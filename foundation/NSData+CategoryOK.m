/*
 *   Copyright 2012 - 2013 Kulykov Oleh
 *
 *   Licensed under the Apache License, Version 2.0 (the "License");
 *   you may not use this file except in compliance with the License.
 *   You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 *   Unless required by applicable law or agreed to in writing, software
 *   distributed under the License is distributed on an "AS IS" BASIS,
 *   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *   See the License for the specific language governing permissions and
 *   limitations under the License.
 */


#import "NSData+CategoryOK.h"

#include <zlib.h>
#import <CoreFoundation/CoreFoundation.h>

CG_INLINE NSData * __NSDataMainBundleDataFromFullPathString(NSString * fullPath)
{
	if (fullPath && [fullPath length] > 0) 
	{
		NSError * error = nil;
		NSData * data = [NSData dataWithContentsOfFile:fullPath 
											   options:NSDataReadingUncached
												 error:&error];
		if (!error && data && [data length] > 0) return data;
	}
	return nil;
}

CG_INLINE NSString * __NSDataMainBundleProcessedBunbledFilePath(NSString * filePath)
{
	if (filePath && [filePath length] > 0) 
	{
		const unichar firstChar = [filePath characterAtIndex:0];
		if (firstChar == '/' || firstChar == '\\') 
		{
			NSString * newPath = [filePath substringFromIndex:1];
			if (newPath && [newPath length] > 0) return newPath;
		}
		return filePath;
	}
	return nil;
}

@implementation NSData (MainBundle)

- (NSData *) dataFromBunbledFilePath:(NSString *) filePath
{
	filePath = __NSDataMainBundleProcessedBunbledFilePath(filePath);
	if (filePath)
	{
		NSString * fileName = [[filePath lastPathComponent] stringByDeletingPathExtension];
		NSString * fileExtension = [filePath pathExtension];
		
		NSArray * components = [filePath pathComponents];
		switch ([components count]) 
		{
			case 0:
				return nil;
				break;
			case 1:
				return __NSDataMainBundleDataFromFullPathString([[NSBundle bundleForClass:[self class]] pathForResource:fileName 
																												 ofType:fileExtension]);
				break;
			default:
				return __NSDataMainBundleDataFromFullPathString([[NSBundle bundleForClass:[self class]] pathForResource:fileName
																												 ofType:fileExtension
																											inDirectory:[filePath stringByDeletingLastPathComponent]]);
				break;
		}
	}
	return nil;
}

@end

CG_INLINE bool __NSDataDataZIPCompressionAppend(NSMutableData * data, 
												const void * buff,
												const NSUInteger buffSize)
{
	const NSUInteger len = [data length];
	[data appendBytes:buff length:buffSize];
	return (len + buffSize) == [data length];
}

@implementation NSData (DataZIPCompression)

- (NSData *) zipCompressedDataWithRatio:(CGFloat)compressionRatio
{
	return [NSData zipCompressData:self withRatio:compressionRatio];
}

- (NSData *) zipDecompressedData
{
	return [NSData zipDecompressData:self];
}

+ (NSData *) zipCompressData:(NSData *) dataToCompress withRatio:(CGFloat)compressionRatio
{
	if (!dataToCompress) return nil;
	if ([dataToCompress length] == 0) return nil;
	
	z_stream zipStream = { 0 };
	zipStream.next_in = (Bytef *)[dataToCompress bytes];
	zipStream.avail_in = (uInt)[dataToCompress length];
	
	const uInt outBufferSize = 32 * 1024;
	Bytef outBuffer[outBufferSize];
	zipStream.next_out = outBuffer;
	zipStream.avail_out = outBufferSize;
	
	if (compressionRatio < 0.0f) deflateInit(&zipStream, Z_NO_COMPRESSION);
	else if (compressionRatio > 1.0f) deflateInit(&zipStream, Z_BEST_COMPRESSION);
	else deflateInit(&zipStream, (int)(compressionRatio * 9.0f));
	
	NSMutableData * compressedBuffer = [NSMutableData data];
	while (zipStream.avail_in != 0)
	{
		if (deflate(&zipStream, Z_NO_FLUSH) != Z_OK) 
		{
			deflateEnd(&zipStream);
			return nil;
		}
		if (zipStream.avail_out == 0)
		{
			if (!__NSDataDataZIPCompressionAppend(compressedBuffer, outBuffer, outBufferSize))
			{
				deflateEnd(&zipStream);
				return nil;
			}
			zipStream.next_out = outBuffer;
			zipStream.avail_out = outBufferSize;
		}
	}
	
	int result = Z_OK;
	while (result == Z_OK)
	{
		if (zipStream.avail_out == 0)
		{
			if (!__NSDataDataZIPCompressionAppend(compressedBuffer, outBuffer, outBufferSize))
			{
				deflateEnd(&zipStream);
				return nil;
			}
			zipStream.next_out = outBuffer;
			zipStream.avail_out = outBufferSize;
		}
		result = deflate(&zipStream, Z_FINISH);
	}
	
	if (result != Z_STREAM_END)
	{
		deflateEnd(&zipStream);
		return nil;
	}
	
	if (!__NSDataDataZIPCompressionAppend(compressedBuffer, outBuffer, outBufferSize - zipStream.avail_out))
	{
		deflateEnd(&zipStream);
		return nil;
	}
	
	deflateEnd(&zipStream);	
	return compressedBuffer;
}

+ (NSData *) zipDecompressData:(NSData *) zipData
{
	if (!zipData) return nil;
	if ([zipData length] == 0) return nil;
	
	z_stream zipStream = { 0 };
	zipStream.next_in = (Bytef *)[zipData bytes];
	zipStream.avail_in = (uInt)[zipData length];
    int result = inflateInit(&zipStream);
    if (result != Z_OK)
	{
        return nil;
	}
	
	const uInt outBuffSize = 32 * 1024;
	Bytef outBuff[outBuffSize];
	NSMutableData * unCompressedData = [NSMutableData data];
	do 
	{			
		zipStream.avail_out = outBuffSize;
		zipStream.next_out = outBuff;
		
		result = inflate(&zipStream, Z_NO_FLUSH);
		if (result == Z_STREAM_ERROR) 
		{
			inflateEnd(&zipStream);
			return nil;
		}
		switch (result) 
		{
			case Z_NEED_DICT:
				result = Z_DATA_ERROR;
			case Z_DATA_ERROR:
			case Z_MEM_ERROR:
				inflateEnd(&zipStream);
				return nil;
		}
		const int haveSize = outBuffSize - zipStream.avail_out;
		if (haveSize > 0) 
		{
			if (!__NSDataDataZIPCompressionAppend(unCompressedData, outBuff, haveSize))
			{
				inflateEnd(&zipStream);
				return nil;
			}
		}
		else
		{
			inflateEnd(&zipStream);
			return nil;
		}
	} while (zipStream.avail_out == 0);
	
    inflateEnd(&zipStream);
	if (result == Z_STREAM_END) 
	{
		return unCompressedData;
	}
	
	return nil;
}

@end


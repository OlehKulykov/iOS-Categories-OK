/*
 *   Copyright (c) 2012 - 2015 Kulykov Oleh <nonamedemail@gmail.com>
 *
 *   Permission is hereby granted, free of charge, to any person obtaining a copy
 *   of this software and associated documentation files (the "Software"), to deal
 *   in the Software without restriction, including without limitation the rights
 *   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *   copies of the Software, and to permit persons to whom the Software is
 *   furnished to do so, subject to the following conditions:
 *
 *   The above copyright notice and this permission notice shall be included in
 *   all copies or substantial portions of the Software.
 *
 *   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *   THE SOFTWARE.
 */


#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface NSData (DataZIPCompression)

/**
 @brief Get zip compressed data with compression ratio.
 @detailed Need to add dependecy of the zlib library.
 @param compressionRatio Float compression ratio value in range [0.0f; 1.0f].
 @return Zip compressed data or nil on error or data is empty.
 */
- (NSData *) zipCompressedDataWithRatio:(CGFloat)compressionRatio;


/**
 @brief Get zip decompressed data if this data is zip compressed.
 @detailed Need to add dependecy of the zlib library.
 @return Decompressed data or nil on error or data is not zip compressed.
 */
- (NSData *) zipDecompressedData;


/**
 @brief Get zip compressed data with compression ratio.
 @detailed Need to add dependecy of the zlib library.
 @param dataToCompress The data for compress.
 @param compressionRatio Float compression ratio value in range [0.0f; 1.0f].
 @return Zip compressed data or nil on error or dataToCompress is empty.
 */
+ (NSData *) zipCompressData:(NSData *) dataToCompress withRatio:(CGFloat)compressionRatio;


/**
 @brief Get zip decompressed data.
 @detailed Need to add dependecy of the zlib library.
 @param zipData Zip compressed data.
 @return Decompressed data or nil on error or data is not zip compressed.
 */
+ (NSData *) zipDecompressData:(NSData *) zipData;

@end


@interface NSData (MainBundle)


/**
 @brief Get bundled file data by file path.
 @detailed Need to add dependecy of the zlib library.
 @param filePath The path of the bundled file.
 @return File data of nil if not found.
 */
- (NSData *) dataFromBunbledFilePath:(NSString *) filePath;

@end



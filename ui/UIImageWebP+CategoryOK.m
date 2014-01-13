/*
 *   Copyright 2012 - 2014 Kulykov Oleh
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


/* If you are using UIImage with WebP support read Google licence,
 * otherwise remove file UIImageWebP+CategoryOK.m from build phase.
 */


/* 
 * Google Webp decoder
 */
// Copyright 2010 Google Inc. All Rights Reserved.
//
// Use of this source code is governed by a BSD-style license
// that can be found in the COPYING file in the root of the source
// tree. An additional intellectual property rights grant can be found
// in the file PATENTS. All contributing project authors may
// be found in the AUTHORS file in the root of the source tree.
// -----------------------------------------------------------------------------
//
//  Main decoding functions for WebP images.
//
// Author: Skal (pascal.massimino@gmail.com)


/* 
 * Google Webp encoder
 */
// Copyright 2011 Google Inc. All Rights Reserved.
//
// Use of this source code is governed by a BSD-style license
// that can be found in the COPYING file in the root of the source
// tree. An additional intellectual property rights grant can be found
// in the file PATENTS. All contributing project authors may
// be found in the AUTHORS file in the root of the source tree.
// -----------------------------------------------------------------------------
//
//   WebP encoder: main interface
//
// Author: Skal (pascal.massimino@gmail.com)


#import "UIImage+CategoryOK.h"

#import "libwebp/src/webp/decode.h"
#import "libwebp/src/webp/encode.h"

static NSData * ___UIImageWebPDataFromImage(UIImage * image, CGFloat compressionQuality)
{
	CGImageRef imageRef = [image CGImage];
	if (!imageRef) return nil;
	
	size_t width = CGImageGetWidth(imageRef);
    size_t height = CGImageGetHeight(imageRef);
	if (width > 0 && height > 0) 
	{
		if ([image respondsToSelector:@selector(scale)]) 
		{
			const CGFloat scaleFactor = [image scale];
			if (scaleFactor <= 0.0f) return nil;
			width = (size_t)(scaleFactor * width);
			height = (size_t)(scaleFactor * height);
		}
	}
	
	if (width <= 0 || height <= 0) return nil;
	
    uint8_t * rawData = (uint8_t *)malloc(height * width * 4);
	if (!rawData) return nil;
	
    const size_t bytesPerPixel = 4;
    const size_t bytesPerRow = bytesPerPixel * width;
    const size_t bitsPerComponent = 8;
	CGColorSpaceRef colorSpace = NULL;
	CGContextRef context = NULL;
	@try 
	{
		colorSpace = CGColorSpaceCreateDeviceRGB();
		context = CGBitmapContextCreate(rawData, 
										width, 
										height,
										bitsPerComponent, 
										bytesPerRow, 
										colorSpace,
										kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
		CGColorSpaceRelease(colorSpace);
		colorSpace = NULL;
		
		CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, (CGFloat)width, (CGFloat)height), imageRef);
		
		CGContextRelease(context);
		context = NULL;
	}
	@catch (NSException * exception) 
	{
		NSLog(@"UIImage WebP Exception: %@", exception);
		free(rawData);
		if (colorSpace) CGColorSpaceRelease(colorSpace);
		if (context) CGContextRelease(context);
		return nil;
	}
	
	uint8_t * outBuff = NULL;
	size_t outSize = 0;
	if (compressionQuality > 100.0f) 
	{
		@try 
		{
			const size_t encSize = WebPEncodeLosslessRGBA(rawData, 
														  (int)width, 
														  (int)height, 
														  (int)bytesPerRow, 
														  &outBuff);
			outSize = encSize;
		}
		@catch (NSException * exception) 
		{
			NSLog(@"UIImage WebP Exception: %@", exception);
			free(rawData);
			if (outBuff) free(outBuff);
			return nil;
		}
	}
	else
	{
		@try 
		{
//			WebPPicture pic;
//			WebPConfig config;
//			WebPMemoryWriter wrt;
//			if (!WebPConfigPreset(&config, WEBP_PRESET_PICTURE, compressionQuality) ||
//				!WebPPictureInit(&pic)) 
//			{
//				return 0;
//			}
//			
//			config.lossless = 0;
//			pic.use_argb = 0;
//			pic.width = width;
//			pic.height = height;
//			pic.writer = WebPMemoryWrite;
//			pic.custom_ptr = &wrt;
//			WebPMemoryWriterInit(&wrt);
//			
//			const int ok = WebPPictureImportRGBA(&pic, rawData, bytesPerRow) && WebPEncode(&config, &pic);
//			WebPPictureFree(&pic);
//			if (!ok) 
//			{
//				free(wrt.mem);
//				outBuff = NULL;
//			}
//			outBuff = wrt.mem;
//			outSize = wrt.size;
			const size_t encSize = WebPEncodeRGBA(rawData,
												  (int)width, 
												  (int)height, 
												  (int)bytesPerRow, 
												  compressionQuality, 
												  &outBuff);
			outSize = encSize;
		}
		@catch (NSException *exception) 
		{
			NSLog(@"UIImage WebP Exception: %@", exception);
			free(rawData);
			if (outBuff) free(outBuff);
			return nil;
		}
	}
	free(rawData);
	if (outBuff && outSize > 0) 
	{
		return [NSData dataWithBytesNoCopy:outBuff 
									length:(NSUInteger)outSize
							  freeWhenDone:YES];
	}
	return nil;
}

static void ___UIImageWebPFreeImageData(void * info, const void * data, size_t size) 
{
	free((void *)data);
}

static UIImage * ___UIImageWebPImageFromData(NSData * data, const int needWidth, const int needHeight)
{
	WebPDecoderConfig config;
	@try 
	{
		if (!WebPInitDecoderConfig(&config)) return nil;
	}
	@catch (NSException *exception) 
	{
		NSLog(@"UIImage WebP Exception: %@", exception);
		return nil;
	}
	
	config.output.colorspace = MODE_rgbA;
	config.options.use_threads = 1;
	
	if (needWidth > 0 && needHeight > 0) 
	{
		config.options.use_scaling = 1;
		config.options.scaled_width = needWidth;
		config.options.scaled_height = needHeight;
	}
	
	@try 
	{
		if (WebPDecode([data bytes], [data length], &config) != VP8_STATUS_OK) return nil;
	}
	@catch (NSException *exception) 
	{
		NSLog(@"UIImage WebP Exception: %@", exception);
		return nil;
	}
	
	int width = config.input.width;
	int height = config.input.height;
	if (config.options.use_scaling)
	{
		width = config.options.scaled_width;
		height = config.options.scaled_height;
	}
	
	if (width <= 0 || height <= 0) return nil;

	CGImageRef imageRef = NULL;
	CGDataProviderRef provider = NULL;
	CGColorSpaceRef colorSpaceRef = NULL;
	@try 
	{
		provider = CGDataProviderCreateWithData(NULL, 
												config.output.u.RGBA.rgba,
												config.output.u.RGBA.size, 
												___UIImageWebPFreeImageData);
		if (!provider) return nil;
		
		colorSpaceRef = CGColorSpaceCreateDeviceRGB();
		if (!colorSpaceRef) { CGDataProviderRelease(provider); return nil; }
		
		const CGBitmapInfo bitmapInfo = kCGBitmapByteOrder32Big | kCGImageAlphaPremultipliedLast;
		CGColorRenderingIntent renderingIntent = kCGRenderingIntentDefault;
		imageRef = CGImageCreate(width, 
								 height, 
								 8, 
								 32, 
								 4 * width,
								 colorSpaceRef, 
								 bitmapInfo,
								 provider, 
								 NULL, 
								 NO, 
								 renderingIntent);
		
		CGColorSpaceRelease(colorSpaceRef);
		colorSpaceRef = NULL;
		
		CGDataProviderRelease(provider);
		provider = NULL;
	}
	@catch (NSException * exception) 
	{
		NSLog(@"UIImage WebP Exception: %@", exception);
		if (colorSpaceRef) CGColorSpaceRelease(colorSpaceRef);
		if (provider) CGDataProviderRelease(provider);
		return nil;
	}
	
	if (imageRef) 
	{
		UIImage * newImage = [[UIImage alloc] initWithCGImage:imageRef];
		CGImageRelease(imageRef);
		return newImage;
	}
	
	return nil;
}

static BOOL ___UIImageWebPIsWebPData(NSData * data, int * width, int * height)
{
	if (data) 
	{
		const size_t dataSize = (size_t)[data length];
		if (dataSize > 0) 
		{
			const int infoResult = WebPGetInfo([data bytes], dataSize, width, height);
			return (width && height) ? (infoResult != 0 && (*width) > 0 && (*height) > 0) : (infoResult != 0);
		}
	}
	return NO;
}

@implementation UIImage (WebP)

+ (id) imageWithWebPData:(NSData *) data
{
	if (___UIImageWebPIsWebPData(data, NULL, NULL)) 
	{
		return ___UIImageWebPImageFromData(data, -1, -1);
	}
	return nil;
}

+ (id) imageWithWebPData:(NSData *) data scale:(CGFloat) scale
{
	int width = -1, height = -1;
	if (___UIImageWebPIsWebPData(data, &width, &height)) 
	{
		width = (int)(scale * width);
		height = (int)(scale * height);
		return (width > 0 && height > 0) ? ___UIImageWebPImageFromData(data, width, height) : nil;
	}
	return nil;
}

+ (id) imageWithContentsOfWebPFile:(NSString *) path
{
	if (path) 
	{
		NSError * error = nil;
		NSData * data = [NSData dataWithContentsOfFile:path 
											   options:NSDataReadingUncached
												 error:&error];
		if (!error && ___UIImageWebPIsWebPData(data, NULL, NULL)) 
		{
			return ___UIImageWebPImageFromData(data, -1, -1);
		}
	}
	return nil;
}

+ (BOOL) isWebPData:(NSData *) data
{
	return ___UIImageWebPIsWebPData(data, NULL, NULL);
}

- (NSData *) losslessWebPRepresentation
{
	return ___UIImageWebPDataFromImage(self, FLT_MAX);
}

- (NSData *) lossyWebPRepresentationWithCompressionQuality:(CGFloat) compressionQuality
{
	if (compressionQuality < 0.0f) compressionQuality = 80.0f;
	else if (compressionQuality > 100.0f) compressionQuality = FLT_MAX;
	return ___UIImageWebPDataFromImage(self, compressionQuality);
}

+ (NSData *) losslessWebPRepresentationOfImage:(UIImage *) image
{
	return image ? ___UIImageWebPDataFromImage(image, FLT_MAX) : nil;
}

+ (NSData *) lossyWebPRepresentation:(UIImage *) image withCompressionQuality:(CGFloat) compressionQuality
{
	if (image) 
	{
		if (compressionQuality < 0.0f) compressionQuality = 80.0f;
		else if (compressionQuality > 100.0f) compressionQuality = FLT_MAX;
		return ___UIImageWebPDataFromImage(image, compressionQuality);
	}
	return nil;
}

@end

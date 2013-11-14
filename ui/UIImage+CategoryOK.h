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


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIImage (WebP)

/**
 @brief Creates image object from Google WebP image data.
 @param data The data of the WebP image file.
 @result Image object or nil on error or if data is not WebP image file.
 */
+ (id) imageWithWebPData:(NSData *) data;


/**
 @brief Creates image object from Google WebP image data scaled to size.
 @param data The data of the WebP image file.
 @param scale The size of the result image.
 @result Image object or nil on error or if data is not WebP image file or size not positive.
 */
+ (id) imageWithWebPData:(NSData *) data scale:(CGFloat) scale;


/**
 @brief Creates image object from Google WebP image data loaded from path.
 @param path The path of the WebP image file.
 @result Image object or nil on error or if data is not WebP image file.
 */
+ (id) imageWithContentsOfWebPFile:(NSString *) path;


/**
 @brief Check is data WebP image file.
 @result YES if data not nil and data is WebP image, othervice NO.
 */
+ (BOOL) isWebPData:(NSData *) data;


/**
 @brief Lossless encoding image to WebP image file data.
 @result Data with lossless WebP image file or nil on error.
 */
- (NSData *) losslessWebPRepresentation;


/**
 @brief Lossy encoding image to WebP image file data with quality.
 @param compressionQuality The quality compression factor [0.0f; 100.0f]. If quality is wrong less then zero - quality will be 80.0 if greater 100.0f you will get lossless image.
 @result Data with lossy WebP image file or nil on error.
 */
- (NSData *) lossyWebPRepresentationWithCompressionQuality:(CGFloat) compressionQuality;


/**
 @brief Lossless encoding image to WebP image file data.
 @param image The image for encoding.
 @result Data with lossless WebP image file or nil on error or image is nil.
 */
+ (NSData *) losslessWebPRepresentationOfImage:(UIImage *) image;


/**
 @brief Lossy encoding image to WebP image file data with quality.
 @param image The image for encoding.
 @param compressionQuality The quality compression factor [0.0f; 100.0f]. If quality is wrong less then zero - quality will be 80.0 if greater 100.0f you will get lossless image.
 @result Data with lossy WebP image file or nil on error or image is nil.
 */
+ (NSData *) lossyWebPRepresentation:(UIImage *) image withCompressionQuality:(CGFloat) compressionQuality;


@end

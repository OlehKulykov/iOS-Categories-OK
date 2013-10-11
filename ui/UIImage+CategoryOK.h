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

+ (id) imageWithWebPData:(NSData *) data;

+ (id) imageWithWebPData:(NSData *) data scale:(CGFloat) scale;

+ (id) imageWithContentsOfWebPFile:(NSString *) path;

+ (BOOL) isWebPData:(NSData *) data;

- (NSData *) losslessWebPRepresentation;

- (NSData *) lossyWebPRepresentationWithCompressionQuality:(CGFloat) compressionQuality;

+ (NSData *) losslessWebPRepresentationOfImage:(UIImage *) image;

+ (NSData *) lossyWebPRepresentation:(UIImage *) image withCompressionQuality:(CGFloat) compressionQuality;

@end

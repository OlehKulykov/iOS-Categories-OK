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


#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface JSONObjectConverter : NSObject

+ (NSInteger) toInteger:(id) object;

+ (NSUInteger) toUInteger:(id) object;

+ (CGFloat) toFloat:(id) object;

+ (double_t) toDouble:(id) object;

+ (BOOL) toBoolean:(id) object;

+ (NSString *) toString:(id) object;

+ (NSString *) toNonEmptyString:(id) object;

+ (NSDictionary *) toDictionary:(id) object;

+ (NSArray *) toArray:(id) object;

+ (NSDate *) toDate:(id) object;

@end



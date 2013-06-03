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

/// Check is array has no objects
CG_INLINE BOOL NSArrayIsEmpty(NSArray * array)
{
	return (array) ? ([array count] == 0) : YES;
}

/// Check is array has objects
CG_INLINE BOOL NSArrayIsNotEmpty(NSArray * array)
{
	return (array) ? ([array count] > 0) : NO;
}

@interface NSArray (StaticInfo)

/// Check is array has no objects
+ (BOOL) isEmpty:(NSArray *)array;

/// Check is array has objects
+ (BOOL) isNotEmpty:(NSArray *)array;

/// Return previous array index from incoming or NSNotFound if index can't be found
+ (NSUInteger) array:(NSArray *)array previousIndexFrom:(NSUInteger)index;

/// Retun next array index from incoming or NSNotFound if index can't be found
+ (NSUInteger) array:(NSArray *)array nextIndexFrom:(NSUInteger)index;

@end


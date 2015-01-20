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
#import <CoreFoundation/CoreFoundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import "../common/iOS_Categories_OK_CommonHeader.h"


/**
 @brief Return number of objects.
 @param array An array for test.
 @return Number of objects or 0 on nil array.
 */
IOS_CATEGORIES_INLINE NSUInteger NSArrayCount(NSArray * array)
{
	return (array) ? [array count] : 0;
}

/**
 @brief Check is array has no objects or nil.
 @param array An array for test.
 @return YES if no objects or nil, othervice NO.
 */
IOS_CATEGORIES_INLINE BOOL NSArrayIsEmpty(NSArray * array)
{
	return (array) ? ([array count] == 0) : YES;
}


/**
 @brief Check is array has objects and not nil.
 @param array An array for test.
 @return YES if not nil and have objects, othervice NO.
 */
IOS_CATEGORIES_INLINE BOOL NSArrayIsNotEmpty(NSArray * array)
{
	return (array) ? ([array count] > 0) : NO;
}


/**
 @brief Get array object at index.
 @param array The target array.
 @param index Index of required object.
 @return Object or nil if array empty or index dosn't exists.
 */
IOS_CATEGORIES_INLINE id NSArrayObjectAtIndex(NSArray * array, const NSUInteger index)
{
	const NSUInteger count = array ? [array count] : 0;
	return (index < count) ? [array objectAtIndex:index] : nil;
}

@interface NSArray (StaticInfo)

/**
 @brief Check is array has no objects.
 @return YES if no objects, othervice NO.
 */
+ (BOOL) isEmpty:(NSArray *)array;


/**
 @brief Check is array has objects.
 @return YES if have objects, othervice NO.
 */
+ (BOOL) isNotEmpty:(NSArray *)array;


/**
 @brief Get array object at index.
 @param index Index of required object.
 @return Object or nil if index dosn't exists.
 */
+ (id) array:(NSArray *)array objectAtIndex:(NSUInteger)index;


/**
 @brief Get array previous index from started index.
 @param array The target array.
 @param index Started index.
 @return Previous array index from started or NSNotFound on error.
 */
+ (NSUInteger) array:(NSArray *)array previousIndexFrom:(NSUInteger)index;


/**
 @brief Get array next index from started index.
 @param array The target array.
 @param index Started index.
 @return Next array index from started or NSNotFound on error.
 */
+ (NSUInteger) array:(NSArray *)array nextIndexFrom:(NSUInteger)index;

@end


@interface NSArray (BinarySerialization)

/**
 @brief Get serialized binary data from array.
 @param array The array for serialization.
 @return NSData with binary content.
 */
+ (NSData *) serializeToBinaryData:(NSArray *) array;


/**
 @brief Get deserialized array from binary data.
 @param binaryData The binary data for deserialization.
 @return NSData with binary content.
 */
+ (NSArray *) deserializeFromBinaryData:(NSData *) binaryData;

@end




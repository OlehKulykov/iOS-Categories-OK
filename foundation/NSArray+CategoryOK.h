/*
 *   Copyright 2012 - 2015 Kulykov Oleh
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




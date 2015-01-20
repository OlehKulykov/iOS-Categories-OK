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


#import "NSArray+CategoryOK.h"

@implementation NSArray (StaticInfo)

+ (BOOL) isEmpty:(NSArray *)array
{
	return NSArrayIsEmpty(array);
}

+ (BOOL) isNotEmpty:(NSArray *)array
{
	return NSArrayIsNotEmpty(array);
}

+ (id) array:(NSArray *)array objectAtIndex:(NSUInteger)index
{
	return NSArrayObjectAtIndex(array, index);
}

+ (NSUInteger) array:(NSArray *)array previousIndexFrom:(NSUInteger)index
{
	if (index > 0 && index < NSNotFound)
	{
		const NSUInteger prevIndex = index - 1;
		if (prevIndex < [array count])
		{
			return prevIndex;
		}
	}
	return NSNotFound;
}

+ (NSUInteger) array:(NSArray *)array nextIndexFrom:(NSUInteger)index
{
	const NSUInteger nextIndex = index + 1;
	if (nextIndex < [array count])
	{
		return nextIndex;
	}
	return NSNotFound;
}

@end


#import "NSDictionary+CategoryOK.h"

#define NSARRAY_BIN_KEY @"NSArray_BinarySerialized_Array"

@implementation NSArray (BinarySerialization)

+ (NSData *) serializeToBinaryData:(NSArray *) array
{
	if (NSArrayIsNotEmpty(array)) 
	{
		NSDictionary * dict = [NSDictionary dictionaryWithObject:array forKey:NSARRAY_BIN_KEY];
		return [NSDictionary binaryPropertyListDataWithDictionary:dict];
	}
	return nil;
}

+ (NSArray *) deserializeFromBinaryData:(NSData *) binaryData
{
	NSDictionary * dict = [NSDictionary dictionaryWithPropertyListData:binaryData];
	if (dict) 
	{
		return [dict objectForKey:NSARRAY_BIN_KEY];
	}
	return nil;
}

@end



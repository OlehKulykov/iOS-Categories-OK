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


#import "NSDictionary+CategoryOK.h"

@implementation NSDictionary(Plists)

+ (NSDictionary *) dictionaryWithPropertyListData:(NSData *)plistData
{
	if (plistData) 
	{
		NSError * error = nil; 
		NSPropertyListFormat format = (NSPropertyListFormat)0;
		id res =  [NSPropertyListSerialization propertyListWithData:plistData 
															options:0
															 format:&format
															  error:&error];
		if (!error && res)
		{
			return [res isKindOfClass:[NSDictionary class]] ? (NSDictionary *)res : nil;
		}
	}
	return nil;
}

+ (NSData *) propertyListDataWithDictionary:(NSDictionary *) dictionary
{
	if (dictionary)
	{
		NSError * error = nil;
		NSData * res = [NSPropertyListSerialization dataWithPropertyList:dictionary 
																  format:NSPropertyListXMLFormat_v1_0
																 options:0
																   error:&error];
		if (!error)
		{
			return res;
		}
	}
	return nil;
}

+ (NSData *) binaryPropertyListDataWithDictionary:(NSDictionary *) dictionary
{
	if (dictionary)
	{
		NSError * error = nil;
		NSData * res = [NSPropertyListSerialization dataWithPropertyList:dictionary 
																  format:NSPropertyListBinaryFormat_v1_0
																 options:0
																   error:&error];
		if (!error)
		{
			return res;
		}
	}
	return nil;
}

- (NSData *) propertyListData
{
	return [NSDictionary propertyListDataWithDictionary:self];
}

- (NSData *) binaryPropertyListData
{
	return [NSDictionary binaryPropertyListDataWithDictionary:self];
}

@end


#define DICT_TYPED_OBJECT_FOR_KEY(t,k) id o=[self objectForKey:k]; return(o&&[o isKindOfClass:[t class]])?((t*)o):nil; \

@implementation NSDictionary(TypedObjects)

- (NSNumber *) numberForKey:(id) aKey
{
	DICT_TYPED_OBJECT_FOR_KEY(NSNumber,aKey)
}

- (NSString *) stringForKey:(id) aKey
{
	DICT_TYPED_OBJECT_FOR_KEY(NSString,aKey)
}

- (NSArray *) arrayForKey:(id) aKey
{
	DICT_TYPED_OBJECT_FOR_KEY(NSArray,aKey)
}

- (NSDictionary *) dictionaryForKey:(id) aKey
{
	DICT_TYPED_OBJECT_FOR_KEY(NSDictionary,aKey)
}

@end

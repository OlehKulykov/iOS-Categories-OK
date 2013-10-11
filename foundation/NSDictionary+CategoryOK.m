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

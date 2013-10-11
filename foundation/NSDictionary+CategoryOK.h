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

@interface NSDictionary(Plists)

- (NSData *) propertyListData;

- (NSData *) binaryPropertyListData;

+ (NSDictionary *) dictionaryWithPropertyListData:(NSData *) plistData;

+ (NSData *) propertyListDataWithDictionary:(NSDictionary *) dictionary;

+ (NSData *) binaryPropertyListDataWithDictionary:(NSDictionary *) dictionary;

@end


@interface NSDictionary(TypedObjects)

- (NSNumber *) numberForKey:(id) aKey;

- (NSString *) stringForKey:(id) aKey;

- (NSArray *) arrayForKey:(id) aKey;

- (NSDictionary *) dictionaryForKey:(id) aKey;

@end


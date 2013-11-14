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

/**
 @brief Get text XML property list file data.
 @return Property list file data as XML version 1.0.
 */
- (NSData *) propertyListData;


/**
 @brief Get binary property list file data.
 @return Binary property list file data.
 */
- (NSData *) binaryPropertyListData;


/**
 @brief Get dictionary from property list file data, XML or binary.
 @return Dictionary object or nil.
 */
+ (NSDictionary *) dictionaryWithPropertyListData:(NSData *) plistData;


/**
 @brief Get text XML property list file data from dictionary.
 @param dictionary The dictionary for encoding.
 @return Property list file data as XML version 1.0.
 */
+ (NSData *) propertyListDataWithDictionary:(NSDictionary *) dictionary;


/**
 @brief Get binary property list file data from dictionary.
 @param dictionary The dictionary for encoding.
 @return Binary property list file data.
 */
+ (NSData *) binaryPropertyListDataWithDictionary:(NSDictionary *) dictionary;

@end


@interface NSDictionary(TypedObjects)


/**
 @brief Get number object for key.
 @param aKey The key object.
 @return Number object or nil if finded object is not number or nil.
 */
- (NSNumber *) numberForKey:(id) aKey;


/**
 @brief Get string object for key.
 @param aKey The key object.
 @return String object or nil if finded object is not string or nil.
 */
- (NSString *) stringForKey:(id) aKey;


/**
 @brief Get array object for key.
 @param aKey The key object.
 @return Array object or nil if finded object is not array or nil.
 */
- (NSArray *) arrayForKey:(id) aKey;


/**
 @brief Get dictionary object for key.
 @param aKey The key object.
 @return Dictionary object or nil if finded object is not dictionary or nil.
 */
- (NSDictionary *) dictionaryForKey:(id) aKey;

@end


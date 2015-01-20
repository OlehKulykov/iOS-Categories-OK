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


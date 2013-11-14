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


/**
 @brief Class for holding POST fields and it's values.
 @detailed Simply using strings and data as values.
 */
@interface RequestFieldsContainer : NSObject
{
@protected
	/// binary data fields
	NSMutableDictionary * _dataFields;
	
	/// text fields
	NSMutableDictionary * _textFields;
}

/**
 @brief Clear all fields
 */
- (void) clearAllFields;


/**
 @brief Add binary data field.
 @param fieldName Name of the field.
 @param data Field value as data.
 @result YES if added, othervice NO.
 */
- (BOOL) addFieldWithName:(NSString *)fieldName andData:(NSData *)data;


/**
 @brief Add binary data field with file name.
 @param fieldName Name of the field.
 @param data Field value as data.
 @param fileName File name of the data.
 @result YES if added, othervice NO.
 */
- (BOOL) addFieldWithName:(NSString *)fieldName data:(NSData *)data andFileName:(NSString *)fileName;


/**
 @brief Add text field.
 @param fieldName Name of the field.
 @param fieldValue String value of the field.
 @result YES if added, othervice NO.
 */
- (BOOL) addFieldWithName:(NSString *)fieldName andStringValue:(NSString *)fieldValue;


/**
 @brief Add field array with array of values.
 @param fieldName Name of the field.
 @param fieldValues Array with field values as strings.
 @result YES if added, othervice NO.
 */
- (BOOL) addArrayFieldWithName:(NSString *)fieldName andValues:(NSArray *)fieldValues;


@end

/*
 *   Copyright 2012 Kulykov Oleh
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

@interface RequestFieldsContainer : NSObject
{
@protected
	/// binary data fields
	NSMutableDictionary * _dataFields;
	
	/// text fields
	NSMutableDictionary * _textFields;
}

/// Clear all fields
- (void) clearAllFields;

/// Add binary data field
- (BOOL) addFieldWithName:(NSString *)fieldName andData:(NSData *)data;

/// Add binary data field
- (BOOL) addFieldWithName:(NSString *)fieldName data:(NSData *)data andFileName:(NSString *)fileName;

/// Add text fields
- (BOOL) addFieldWithName:(NSString *)fieldName andStringValue:(NSString *)fieldValue;


@end

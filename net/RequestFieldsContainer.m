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


#import "RequestFieldsContainer.h"
#import "../common/Common+okCategoryPrecompiled.h"

@implementation RequestFieldsContainer

- (BOOL) addFieldWithName:(NSString *)fieldName data:(NSData *)data andFileName:(NSString *)fileName
{
	if ( !data )
	{
		return NO;
	}
	
	if ( !_dataFields )
	{
		_dataFields = [[NSMutableDictionary alloc] init];
	}
	
	if ( !fieldName )
	{
		fieldName = [NSString stringWithFormat:@"emptyfieldname%u", [_dataFields count]];
	}
	
	if ( !fileName )
	{
		fileName = [NSString stringWithFormat:@"emptyfilename%u", [_dataFields count]];
	}
	
	NSArray * arr = [NSArray arrayWithObjects:fieldName, fileName, nil];
	if (arr)
	{
		if ([arr count] == 2)
		{
			[_dataFields setObject:data forKey:arr];
			return YES;
		}
	}
	
	return NO;
}

- (BOOL) addFieldWithName:(NSString *)fieldName andData:(NSData *)data
{
	return [self addFieldWithName:fieldName data:data andFileName:nil];
}

- (BOOL) addFieldWithName:(NSString *)fieldName andStringValue:(NSString *)fieldValue
{
	if ( !fieldValue )
	{
		return NO;
	}
	
	if ( !_textFields )
	{
		_textFields = [[NSMutableDictionary alloc] init];
	}
	
	if ( !fieldName )
	{
		fieldName = [NSString stringWithFormat:@"emptyfieldname%u", [_textFields count]];
	}
	
	[_textFields setObject:fieldValue forKey:fieldName];
	
	return YES;
}

- (void) clearAllFields
{
	SAFE_RELEASE(_textFields);
	SAFE_RELEASE(_dataFields);
}

- (void)dealloc
{
	[self clearAllFields];
}

@end



#import "RequestFieldsContainer.h"


@implementation RequestFieldsContainer

- (BOOL) addFieldWithName:(NSString *)fieldName data:(NSData *)data andFileName:(NSString *)fileName
{
	if (data == nil)
	{
		return NO;
	}
	
	if (_dataFields == nil)
	{
		_dataFields = [[NSMutableDictionary alloc] init];
	}
	
	if (fieldName == nil)
	{
		fieldName = [NSString stringWithFormat:@"emptyfieldname%d", (NSUInteger)[_dataFields count]];
	}
	
	if (fileName == nil)
	{
		fileName = [NSString stringWithFormat:@"emptyfilename%d", (NSUInteger)[_dataFields count]];
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
	if (fieldValue == nil)
	{
		return NO;
	}
	
	if (_textFields == nil)
	{
		_textFields = [[NSMutableDictionary alloc] init];
	}
	
	if (fieldName == nil)
	{
		fieldName = [NSString stringWithFormat:@"emptyfieldname%d", (NSUInteger)[_textFields count]];
	}
	
	[_textFields setObject:fieldValue forKey:fieldName];
	
	return YES;
}

- (void) clearAllFields
{
	_textFields = nil;
	_dataFields = nil;
}

- (void)dealloc
{
	[self clearAllFields];
}

@end

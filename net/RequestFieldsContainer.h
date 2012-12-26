

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

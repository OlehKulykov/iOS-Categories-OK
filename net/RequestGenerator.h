

#import <Foundation/Foundation.h>
#import "RequestFieldsContainer.h"

@interface RequestGenerator : RequestFieldsContainer

/// Returns multipart data
- (NSData *) getMultipartHTTPBodyData;

/// Returns multipart string
- (NSString *) getMultipartHTTPBodyString;

/// Returns request with multipart POST data
- (NSMutableURLRequest *) getMultipartPOSTRequestForURLString:(NSString *)requestURLString;

/// Returns URL encoded data
- (NSData *) getURLEncodedHTTPBodyData;

/// Returns request with URL encoded POST data
- (NSMutableURLRequest *) getURLEncodedPOSTRequestForURLString:(NSString *)requestURLString;


@end

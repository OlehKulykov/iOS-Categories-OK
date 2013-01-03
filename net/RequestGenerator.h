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

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


/**
 @brief Class generator of the POST requests.
 */
@interface RequestGenerator : RequestFieldsContainer


/**
 @brief Returns multipart data.
 @return Multipart HTTP data.
 */
- (NSData *) getMultipartHTTPBodyData;


/**
 @brief Returns multipart data as string.
 @return Multipart HTTP string data.
 */
- (NSString *) getMultipartHTTPBodyString;


/**
 @brief Returns mutable POST URL request as multipart/form-data.
 @param requestURLString URL string.
 @return Mutable POST URL request.
 */
- (NSMutableURLRequest *) getMultipartPOSTRequestForURLString:(NSString *)requestURLString;


/**
 @brief Returns URL encoded data.
 @return URL encoded data.
 */
- (NSData *) getURLEncodedHTTPBodyData;


/**
 @brief Returns mutable POST URL request as application/x-www-form-urlencoded.
 @param requestURLString URL string.
 @return Mutable POST URL request.
 */
- (NSMutableURLRequest *) getURLEncodedPOSTRequestForURLString:(NSString *)requestURLString;


@end

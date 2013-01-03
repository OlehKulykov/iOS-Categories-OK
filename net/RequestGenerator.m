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


#import "RequestGenerator.h"



@implementation RequestGenerator

//TODO: refactor/extract common methods

+ (NSString *) serverRequestBaseStringBoundary
{
	return @"RE4S9I1D0E5N7T61E4V8I2L3";
}

- (NSString *) getMultipartHTTPBodyString
{
	if (_textFields)
	{
		NSMutableString * postString = [NSMutableString string];
		BOOL isFirstParam = YES;
		NSArray * allKeys = [_textFields allKeys];
		for (NSString * keyString in allKeys)
		{
			id value = [_textFields objectForKey:keyString];
			if ([value isKindOfClass:[NSString class]]) 
			{
				[postString appendFormat:isFirstParam ? @"%@=%@" : @"&%@=%@", keyString, (NSString *)value];
				isFirstParam = NO;
			}
			else if ([value isKindOfClass:[NSArray class]])
			{
				for (id subValue in (NSArray *)value) 
				{
					[postString appendFormat:isFirstParam ? @"%@=%@" : @"&%@=%@", keyString, [subValue description]];
					isFirstParam = NO;
				}
			}
		}
		return postString;
	}
	return nil;
}

- (NSData *) getURLEncodedHTTPBodyData
{
	NSMutableData * postBody = [NSMutableData data];
	
	[postBody appendData:[[self getMultipartHTTPBodyString] dataUsingEncoding:NSUTF8StringEncoding
														 allowLossyConversion:YES]];
	
	return postBody;
}

- (NSMutableURLRequest *) getURLEncodedPOSTRequestForURLString:(NSString*)requestURLString
{
	if ( !requestURLString ) return nil;
	
	NSData * postData = [self getURLEncodedHTTPBodyData];
	if ( !postData ) return nil;
	
	NSURL * requestURL = [NSURL URLWithString:requestURLString];
	if ( !requestURL ) return nil;
	
	NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:requestURL];
	if ( !request ) return nil;
	
	[request setTimeoutInterval:(NSTimeInterval)30];
	
	[request setHTTPMethod:@"POST"];
	[request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField: @"Content-Type"];
	[request setCachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData];
	
	[request setValue:[NSString stringWithFormat:@"%u", [postData length]] forHTTPHeaderField:@"Content-Length"];
	
	[request setHTTPBody:postData];
	
	return request;
}

- (NSMutableURLRequest *) getMultipartPOSTRequestForURLString:(NSString*)requestURLString
{
	if ( !requestURLString ) return nil;
	
	NSData * postData = [self getMultipartHTTPBodyData];
	if ( !postData ) return nil;
	
	NSURL * requestURL = [NSURL URLWithString:requestURLString];
	if ( !requestURL ) return nil;
	
	NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:requestURL];
	if ( !request ) return nil;
	
	[request setTimeoutInterval:(NSTimeInterval)30];
	NSString * contentType = [NSString stringWithFormat:@"multipart/form-data, boundary=%@", [RequestGenerator serverRequestBaseStringBoundary]];
	
	[request setHTTPMethod:@"POST"];
	[request addValue:contentType forHTTPHeaderField: @"Content-Type"];
	[request setCachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData];
	
	[request setValue:[NSString stringWithFormat:@"%u", [postData length]] forHTTPHeaderField:@"Content-Length"];
	
	[request setHTTPBody:postData];
	
	return request;
}

- (NSData *) getMultipartHTTPBodyData
{
	NSMutableData * postBody = [NSMutableData data];
	
	BOOL firstParam = YES;
	BOOL fieldsAdded = NO;
	
	if (_textFields)
	{
		NSArray * allKeys = [_textFields allKeys];
		for (NSString * keyString in allKeys)
		{
			NSString * valueString = [_textFields objectForKey:keyString];
			fieldsAdded = YES;
			if (firstParam)
			{
				[postBody appendData:[[NSString stringWithFormat:@"--%@\r\n", [RequestGenerator serverRequestBaseStringBoundary]]
									  dataUsingEncoding:NSUTF8StringEncoding]];
			}
			else
			{
				[postBody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", [RequestGenerator serverRequestBaseStringBoundary]]
									  dataUsingEncoding:NSUTF8StringEncoding]];
			}
			firstParam = NO;
			[postBody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", keyString] dataUsingEncoding:NSUTF8StringEncoding]];
			[postBody appendData:[valueString dataUsingEncoding:NSUTF8StringEncoding]];
		}
	}
	
	if (_dataFields)
	{
		NSArray * allKeys = [_dataFields allKeys];
		for (NSArray * keyArray in allKeys)
		{
			NSData * valueData = [_dataFields objectForKey:keyArray];
			NSString * fieldName = [keyArray objectAtIndex:0];
			NSString * fileName = [keyArray objectAtIndex:1];
			fieldsAdded = YES;
			if (firstParam)
			{
				[postBody appendData:[[NSString stringWithFormat:@"--%@\r\n", [RequestGenerator serverRequestBaseStringBoundary]]
									  dataUsingEncoding:NSUTF8StringEncoding]];
			}
			else
			{
				[postBody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", [RequestGenerator serverRequestBaseStringBoundary]]
									  dataUsingEncoding:NSUTF8StringEncoding]];
			}
			firstParam = NO;
			
			[postBody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n\r\n", fieldName, fileName] dataUsingEncoding:NSUTF8StringEncoding]];
			[postBody appendData:valueData];
		}
	}
	
	if (fieldsAdded)
	{
		[postBody appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n", [RequestGenerator serverRequestBaseStringBoundary]]
							  dataUsingEncoding:NSUTF8StringEncoding]];
	}
	
	return postBody;
}


@end



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
		NSString * postString = @"";
		BOOL isFirstParam = YES;
		NSArray * allKeys = [_textFields allKeys];
		for (NSString * keyString in allKeys)
		{
			NSString * formatString = nil;
			if (isFirstParam)
			{
				formatString = @"%@=%@";
				isFirstParam = NO;
			}
			else
			{
				formatString = @"&%@=%@";
			}
			NSString * valueString = [_textFields objectForKey:keyString];
			postString = [postString stringByAppendingFormat:formatString, keyString, valueString];
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
	if (requestURLString == nil) { return nil; }
	
	NSData * postData = [self getURLEncodedHTTPBodyData];
	if (postData == nil) { return nil; }
	
	NSURL * requestURL = [NSURL URLWithString:requestURLString];
	if (requestURL == nil) { return nil; }
	
	NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:requestURL];
	if (request == nil) { return nil; }
	
	[request setTimeoutInterval:(NSTimeInterval)30];
	
	[request setHTTPMethod:@"POST"];
	[request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField: @"Content-Type"];
	[request setCachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData];
	
	[request setValue:[NSString stringWithFormat:@"%d", (NSUInteger)[postData length]] forHTTPHeaderField:@"Content-Length"];
	
	[request setHTTPBody:postData];
	
	return request;
}

- (NSMutableURLRequest *) getMultipartPOSTRequestForURLString:(NSString*)requestURLString
{
	if (requestURLString == nil) { return nil; }
	
	NSData * postData = [self getMultipartHTTPBodyData];
	if (postData == nil) { return nil; }
	
	NSURL * requestURL = [NSURL URLWithString:requestURLString];
	if (requestURL == nil) { return nil; }
	
	NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:requestURL];
	if (request == nil) { return nil; }
	
	[request setTimeoutInterval:(NSTimeInterval)30];
	NSString * contentType = [NSString stringWithFormat:@"multipart/form-data, boundary=%@", [RequestGenerator serverRequestBaseStringBoundary]];
	
	[request setHTTPMethod:@"POST"];
	[request addValue:contentType forHTTPHeaderField: @"Content-Type"];
	[request setCachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData];
	
	[request setValue:[NSString stringWithFormat:@"%d", (NSUInteger)[postData length]] forHTTPHeaderField:@"Content-Length"];
	
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

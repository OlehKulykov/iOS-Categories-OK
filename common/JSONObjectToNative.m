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


#import "JSONObjectToNative.h"

#ifndef NO_JSONOBJECTTONATIVE_CATEGORY_OK

NSInteger JSONObjectToInteger(id object)
{
	if ([object isKindOfClass:[NSNumber class]] || [object isKindOfClass:[NSString class]])
	{
		return [object integerValue];
	}
	return 0;
}

NSUInteger JSONObjectToUInteger(id object)
{
	if ([object isKindOfClass:[NSNumber class]])
	{
		return [(NSNumber *)object unsignedIntegerValue];
	}
	else if ([object isKindOfClass:[NSString class]])
	{
		const NSInteger value = [(NSString *)object integerValue];
		return (value < 0) ? 0 : (NSUInteger)value;
	}
	return 0;
}

CGFloat JSONObjectToFloat(id object)
{
	return (CGFloat)JSONObjectToDouble(object);
}

double JSONObjectToDouble(id object)
{
	if ([object isKindOfClass:[NSNumber class]] || [object isKindOfClass:[NSString class]])
	{
		return [object doubleValue];
	}
	return 0.0;
}

BOOL JSONObjectToBoolean(id object)
{
	if ([object isKindOfClass:[NSNumber class]])
	{
		return [(NSNumber *)object boolValue];
	}
	else if ([object isKindOfClass:[NSString class]])
	{
		if ([[(NSString *)object lowercaseString] isEqualToString:@"true"]) 
		{
			return YES;
		}
	}
	return NO;
}

NSString * JSONObjectToString(id object)
{
	return ([object isKindOfClass:[NSString class]]) ? (NSString *)object : nil;
}

NSString * JSONObjectToNonEmptyString(id object)
{
	if ([object isKindOfClass:[NSString class]])
	{
		return [(NSString *)object length] > 0 ? (NSString *)object : nil;
	}
	return nil;
}

NSDictionary * JSONObjectToDictionary(id object)
{
	if ([object isKindOfClass:[NSDictionary class]] || [object isKindOfClass:[NSMutableDictionary class]]) 
	{
		return (NSDictionary *)object;
	}
	return nil;
}

NSArray * JSONObjectToArray(id object)
{
	if ([object isKindOfClass:[NSArray class]] || [object isKindOfClass:[NSMutableArray class]]) 
	{
		return (NSArray *)object;
	}
	return nil;
}

NSDate * JSONObjectToDate(id object)
{
	if ([object isKindOfClass:[NSString class]]) 
	{
		NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
		[formatter setLocale:[NSLocale currentLocale]];
		NSString * string = (NSString *)object;
		if ([string length] == [@"yyyy-MM-dd" length])
		{
			[formatter setDateFormat:@"yyyy-MM-dd"];
		}
		else
		{
			[formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:sszzzz"];
		}
		
		NSDate * date = [formatter dateFromString:string];
		return date;
	}
	
	return nil;
}

#endif


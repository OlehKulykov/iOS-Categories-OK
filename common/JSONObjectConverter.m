/*
 *   Copyright 2012 - 2014 Kulykov Oleh
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


#import "JSONObjectConverter.h"

@implementation JSONObjectConverter

+ (NSInteger) toInteger:(id) object
{
	if ([object isKindOfClass:[NSNumber class]] || [object isKindOfClass:[NSString class]])
	{
		return [object integerValue];
	}
	return 0;
}

+ (NSUInteger) toUInteger:(id) object
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

+ (int64_t) toInt64:(id) object
{
	if ([object isKindOfClass:[NSNumber class]])
	{
		return (int64_t)[(NSNumber *)object longLongValue];
	}
	else if ([object isKindOfClass:[NSString class]])
	{
		const char * s = [(NSString *)object UTF8String];
		long long int v = 0;
		if (sscanf(s, "%lli", &v) == 1) 
		{
			return (int64_t)v;
		}
	}
	return 0;
}

+ (uint64_t) toUInt64:(id) object
{
	if ([object isKindOfClass:[NSNumber class]])
	{
		return (uint64_t)[(NSNumber *)object unsignedLongLongValue];
	}
	else if ([object isKindOfClass:[NSString class]])
	{
		const char * s = [(NSString *)object UTF8String];
		unsigned long long int v = 0;
		if (sscanf(s, "%llu", &v) == 1) 
		{
			return (uint64_t)v;
		}
	}
	return 0;
}

+ (CGFloat) toFloat:(id) object
{
	return [JSONObjectConverter toDouble:object];
}

+ (double_t) toDouble:(id) object
{
	if ([object isKindOfClass:[NSNumber class]] || [object isKindOfClass:[NSString class]])
	{
		return [object doubleValue];
	}
	return 0.0;
}

+ (BOOL) toBoolean:(id) object
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

+ (NSString *) toString:(id) object
{
	return ([object isKindOfClass:[NSString class]]) ? (NSString *)object : nil;
}

+ (NSString *) toNonEmptyString:(id) object
{
	if ([object isKindOfClass:[NSString class]])
	{
		return [(NSString *)object length] > 0 ? (NSString *)object : nil;
	}
	return nil;
}

+ (NSDictionary *) toDictionary:(id) object
{
	if ([object isKindOfClass:[NSDictionary class]] || [object isKindOfClass:[NSMutableDictionary class]]) 
	{
		return (NSDictionary *)object;
	}
	return nil;
}

+ (NSArray *) toArray:(id) object
{
	if ([object isKindOfClass:[NSArray class]] || [object isKindOfClass:[NSMutableArray class]]) 
	{
		return (NSArray *)object;
	}
	return nil;
}

static const char ** __commonDateFormatStrings()
{
	static const char * formats[] =
	{
		"yyyy-MM-dd'T'HH:mm:sszzzz",
		"yyyy-MM-dd'T'HH:mm:ssZ",
		"yyyy-MM-dd'T'HH:mm:ssTZD",
		"yyyy-MM-dd",
		0
	};
	return formats;
}

+ (NSDate *) toDate:(id) object
{
	if ([object isKindOfClass:[NSString class]]) 
	{
		NSString * string = (NSString *)object;
		if ([string length] > 0)
		{
			const char ** format = __commonDateFormatStrings();
			if (format)
			{
				NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
				do 
				{
					[formatter setDateFormat:[NSString stringWithUTF8String:*format]];
					NSDate * date = [formatter dateFromString:string];
					if (date) return date;
				} while (*++format);
			}
		}
	}
	return nil;
}

@end



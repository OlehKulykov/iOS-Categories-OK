/*
 *   Copyright (c) 2012 - 2015 Kulykov Oleh <nonamedemail@gmail.com>
 *
 *   Permission is hereby granted, free of charge, to any person obtaining a copy
 *   of this software and associated documentation files (the "Software"), to deal
 *   in the Software without restriction, including without limitation the rights
 *   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *   copies of the Software, and to permit persons to whom the Software is
 *   furnished to do so, subject to the following conditions:
 *
 *   The above copyright notice and this permission notice shall be included in
 *   all copies or substantial portions of the Software.
 *
 *   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *   THE SOFTWARE.
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
		"yyyy-MM-dd'T'HH:mm:ss.SSSZ",
		"yyyy-MM-dd'T'HH:mm:ss.SSZ",
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
				NSAssert1(NO, @"JSONObjectConverter: Can't find sutable format for date string: %@", string);
			}
		}
	}
	return nil;
}

@end



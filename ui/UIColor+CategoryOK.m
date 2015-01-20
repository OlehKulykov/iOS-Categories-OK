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


#import "UIColor+CategoryOK.h"

UIColor * UIColorMakeWithRGB(uint8_t red,
							 uint8_t green,
							 uint8_t blue)
{
	return [UIColor colorWithRed:((CGFloat)red / 255.0f)
						   green:((CGFloat)green / 255.0f) 
							blue:((CGFloat)blue / 255.0f) 
						   alpha:1.0f];
}

UIColor * UIColorMakeWithRGBA(uint8_t red,
							  uint8_t green,
							  uint8_t blue,
							  uint8_t alpha)
{
	return [UIColor colorWithRed:((CGFloat)red / 255.0f)
						   green:((CGFloat)green / 255.0f) 
							blue:((CGFloat)blue / 255.0f) 
						   alpha:((CGFloat)alpha / 255.0f)];
}

static const char * __UIColorFormatForHexString(NSString * hexString)
{
	switch ([hexString length]) 
	{
		case 6:
			return "%2x%2x%2x";
			break;
		case 7:
			return "#%2x%2x%2x";
			break;
		default:
			break;
	}
	return (const char *)0;
}

UIColor * UIColorMakeWithHEX(NSString * hexString)
{
	const char * formatString = __UIColorFormatForHexString(hexString);
	if (formatString) 
	{
		unsigned int r, g, b;
		const int readed = sscanf([[hexString lowercaseString] UTF8String], formatString, &r, &g, &b);
		if (readed == 3)
		{
			return [UIColor colorWithRed:(r < 255) ? (CGFloat)r / 255.0f : 1.0f
								   green:(g < 255) ? (CGFloat)g / 255.0f : 1.0f
									blue:(b < 255) ? (CGFloat)b / 255.0f : 1.0f 
								   alpha:1.0f];
		}
	}
	return nil;
}


@implementation UIColor (RGBA)

- (RGBAByteColor) colorGetRGBAByteColor
{
	RGBAByteColor c;
	c.value = 0;
	if ([self respondsToSelector:@selector(getRed:green:blue:alpha:)])
	{
		CGFloat r, g, b, a;
		if ([self getRed:&r green:&g blue:&b alpha:&a])
		{
			c = RGBAByteColorMakeWithRGBA(r, g, b, a);
		}
	}
	else
	{
		const CGFloat * comps = CGColorGetComponents(self.CGColor);
		if (comps)
		{
			switch (CGColorGetNumberOfComponents(self.CGColor)) 
			{
				case 4:
					c = RGBAByteColorMakeWithRGBA(comps[0], comps[1], comps[2], comps[3]);
					break;
				case 3:
					c = RGBAByteColorMakeWithRGB(comps[0], comps[1], comps[2]);
					break;
				default:
					break;
			}
		}
	}
	return c;
}

@end


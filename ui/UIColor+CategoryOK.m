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


#import "UIColor+CategoryOK.h"

#ifndef NO_UIColorRGBA_CATEGORY_OK

UIColor * UIColorMakeWithRGB(unsigned char red,
							 unsigned char green,
							 unsigned char blue)
{
	return [UIColor colorWithRed:((CGFloat)red / 255.0f)
						   green:((CGFloat)green / 255.0f) 
							blue:((CGFloat)blue / 255.0f) 
						   alpha:1.0f];
}

UIColor * UIColorMakeWithRGBA(unsigned char red,
							  unsigned char green,
							  unsigned char blue,
							  unsigned char alpha)
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

+ (UIColor *) colorWithRedByte:(unsigned char)red 
					 greenByte:(unsigned char)green 
					  blueByte:(unsigned char)blue 
					 alphaByte:(unsigned char)alpha
{
	return UIColorMakeWithRGBA(red, green, blue, alpha);
}

+ (UIColor *) colorWithRedByte:(unsigned char)red 
					 greenByte:(unsigned char)green 
					  blueByte:(unsigned char)blue
{
	return UIColorMakeWithRGB(red, green, blue);
}

+ (UIColor *) colorWithHEXString:(NSString *)hexString
{
	return UIColorMakeWithHEX(hexString);
}

@end

#endif 


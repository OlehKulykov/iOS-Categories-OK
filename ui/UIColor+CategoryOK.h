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


//#define NO_UIColorRGBA_CATEGORY_OK

#ifndef NO_UIColorRGBA_CATEGORY_OK

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef struct _rgbaByteColor
{
	union
	{
		struct
		{
			uint8_t red;
			uint8_t green;
			uint8_t blue;
			uint8_t alpha;
		};
		uint8_t rgba[4];
		uint32_t value;
	};
} RGBAByteColor;

CG_INLINE BOOL IsValidRGBAByteColorDictionary(NSDictionary * dict)
{
	if (dict)
	{
		id n = [dict objectForKey:@"RGBAByteColorValue"];
		return n ? [n isKindOfClass:[NSNumber class]] : NO;
	}
	return NO;
}

CG_INLINE NSDictionary * RGBAByteColorToDictionary(const RGBAByteColor color)
{
	return [NSDictionary dictionaryWithObject:[NSNumber numberWithUnsignedInt:(uint32_t)color.value] 
									   forKey:@"RGBAByteColorValue"];
}

CG_INLINE RGBAByteColor RGBAByteColorFromDict(NSDictionary * dict)
{
	RGBAByteColor c;
	if (IsValidRGBAByteColorDictionary(dict))
	{
		NSNumber * num = [dict objectForKey:@"RGBAByteColorValue"];
		c.value = (uint32_t)[num unsignedIntValue];
	}
	else
	{
		c.value = 0;
	}
	return c;
}

CG_INLINE BOOL RGBAByteColorsIsEqual(const RGBAByteColor c1, 
									 const RGBAByteColor c2)
{
	return ( c1.value == c2.value );
}

CG_INLINE RGBAByteColor RGBAByteColorMakeWithRGBBytes(const uint8_t red,
													  const uint8_t green,
													  const uint8_t blue)
{
	RGBAByteColor c;
	c.red = red;
	c.green = green;
	c.blue = blue;
	c.alpha = 255;
	return c;
}

CG_INLINE RGBAByteColor RGBAByteColorMakeWithRGBABytes(const uint8_t red,
													   const uint8_t green,
													   const uint8_t blue,
													   const uint8_t alpha)
{
	RGBAByteColor c;
	c.red = red;
	c.green = green;
	c.blue = blue;
	c.alpha = alpha;
	return c;
}

CG_INLINE RGBAByteColor RGBAByteColorMakeWithRGB(const float red,
												 const float green,
												 const float blue)
{
	RGBAByteColor c;
	c.red = (uint8_t)(red * 255);
	c.green = (uint8_t)(green * 255);
	c.blue = (uint8_t)(blue * 255);
	c.alpha = 255;
	return c;
}

CG_INLINE RGBAByteColor RGBAByteColorMakeWithRGBA(const float red,
												  const float green,
												  const float blue,
												  const float alpha)
{
	RGBAByteColor c;
	c.red = (uint8_t)(red * 255);
	c.green = (uint8_t)(green * 255);
	c.blue = (uint8_t)(blue * 255);
	c.alpha = (uint8_t)(alpha * 255);
	return c;
}


UIColor * UIColorMakeWithRGB(uint8_t red,
							 uint8_t green,
							 uint8_t blue);


UIColor * UIColorMakeWithRGBA(uint8_t red,
							  uint8_t green,
							  uint8_t blue,
							  uint8_t alpha);

UIColor * UIColorMakeWithHEX(NSString * hexString);



@interface UIColor (RGBA)

+ (UIColor *) colorWithRGBAByteColor:(RGBAByteColor) byteColor;

- (RGBAByteColor) colorGetRGBAByteColor;

+ (UIColor *) colorWithRedByte:(uint8_t)red 
					 greenByte:(uint8_t)green 
					  blueByte:(uint8_t)blue 
					 alphaByte:(uint8_t)alpha;

+ (UIColor *) colorWithRedByte:(uint8_t)red 
					 greenByte:(uint8_t)green 
					  blueByte:(uint8_t)blue;

+ (UIColor *) colorWithHEXString:(NSString *)hexString;

@end

#endif 


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
#import <UIKit/UIKit.h>
#import "../common/iOS_Categories_OK_CommonHeader.h"

/**
 @brief Structure for holding color RGBA components.
 @detailed Each RGBA component stored as 8 bit unsigned integer at the same time as 4 dimension array of the 8 bit components and one single unsigned 32 bit integer.
 */
typedef struct _rgbaByteColor
{
	/**
	 @brief 32 bit union with RGBA components, components array and one single value.
	 */
	union
	{
		/**
		 @brief Structure for holding color RGBA components as 8 bit unsigned integer.
		 */
		struct
		{
			uint8_t red;
			uint8_t green;
			uint8_t blue;
			uint8_t alpha;
		};
		
		
		/**
		 @brief 4 dimension array of the 8 bit RGBA components.
		 */
		uint8_t rgba[4];
		
		
		/**
		 @brief 32 bit unsigned integer representation of the color.
		 */
		uint32_t value;
	};
} 
/**
 @brief Name of the structure for holding color RGBA components.
 */
RGBAByteColor;


/**
 @brief Compare two color structures.
 @detailed Compare two color structures by them 32 bit unsigned integer representation.
 */
IOS_CATEGORIES_INLINE BOOL RGBAByteColorsIsEqual(const RGBAByteColor c1, 
												 const RGBAByteColor c2)
{
	return ( c1.value == c2.value );
}


/**
 @brief Create color structure from RGB components.
 @detailed Create color structure from 8 bit unsigned integer RGB components.
 @param red The red 8 bit unsigned integer component of the color [0; 255].
 @param green The green 8 bit unsigned integer component of the color [0; 255].
 @param blue The blue 8 bit unsigned integer component of the color [0; 255].
 @result New color structure with alpha value 255.
 */
IOS_CATEGORIES_INLINE RGBAByteColor RGBAByteColorMakeWithRGBBytes(const uint8_t red,
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


/**
 @brief Create color structure from RGBA components.
 @detailed Create color structure from 8 bit unsigned integer RGBA components.
 @param red The red 8 bit unsigned integer component of the color [0; 255].
 @param green The green 8 bit unsigned integer component of the color [0; 255].
 @param blue The blue 8 bit unsigned integer component of the color [0; 255].
 @param alpha The alpha 8 bit unsigned integer component of the color [0; 255].
 @result New color structure.
 */
IOS_CATEGORIES_INLINE RGBAByteColor RGBAByteColorMakeWithRGBABytes(const uint8_t red,
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


/**
 @brief Create color structure from RGB components.
 @detailed Create color structure from float RGB components.
 @param red The red float component of the color [0.0f; 1.0f].
 @param green The green float component of the color [0.0f; 1.0f].
 @param blue The blue float component of the color [0.0f; 1.0f].
 @result New color structure with alpha value 255.
 */
IOS_CATEGORIES_INLINE RGBAByteColor RGBAByteColorMakeWithRGB(const float red,
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


/**
 @brief Create color structure from RGBA components.
 @detailed Create color structure from float RGBA components. Each component is float value.
 @param red The red float component of the color [0.0f; 1.0f].
 @param green The green float component of the color [0.0f; 1.0f].
 @param blue The blue float component of the color [0.0f; 1.0f].
 @param alpha The alpha float component of the color [0.0f; 1.0f].
 @result New color structure with alpha value 255.
 */
IOS_CATEGORIES_INLINE RGBAByteColor RGBAByteColorMakeWithRGBA(const float red,
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


/**
 @brief Create color object from RGB components.
 @detailed Create color object from 8 bit unsigned integer RGB components.
 @param red The red 8 bit unsigned integer component of the color [0; 255].
 @param green The green 8 bit unsigned integer component of the color [0; 255].
 @param blue The blue 8 bit unsigned integer component of the color [0; 255].
 @result New color object.
 */
IOS_CATEGORIES_OK_EXTERN UIColor * UIColorMakeWithRGB(uint8_t red,
													  uint8_t green,
													  uint8_t blue);


/**
 @brief Create color object from RGBA components.
 @detailed Create color object from 8 bit unsigned integer RGBA components.
 @param red The red 8 bit unsigned integer component of the color [0; 255].
 @param green The green 8 bit unsigned integer component of the color [0; 255].
 @param blue The blue 8 bit unsigned integer component of the color [0; 255].
 @param alpha The alpha 8 bit unsigned integer component of the color [0; 255].
 @result New color object.
 */
IOS_CATEGORIES_OK_EXTERN UIColor * UIColorMakeWithRGBA(uint8_t red,
													   uint8_t green,
													   uint8_t blue,
													   uint8_t alpha);


/**
 @brief Create color object from HEX string.
 @param hexString The color HEX string with format: @"FF00FF" or @"#FF00FF". Case is ignored.
 @result New color object.
 */
IOS_CATEGORIES_OK_EXTERN UIColor * UIColorMakeWithHEX(NSString * hexString);



@interface UIColor (RGBA)

/**
 @brief Get 8 bit unsigned integer RGBA structure.
 @result 8 bit unsigned integer RGBA structure of the color.
 */
- (RGBAByteColor) colorGetRGBAByteColor;


@end



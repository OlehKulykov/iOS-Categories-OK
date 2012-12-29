/*
 *   Copyright 2012 Kulykov Oleh
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


#import "UI+CategoryOKConfig.h"

#ifndef NO_UIColorRGBA_CATEGORY_OK

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

UIColor * UIColorMakeWithRGB(unsigned char red,
							 unsigned char green,
							 unsigned char blue);


UIColor * UIColorMakeWithRGBA(unsigned char red,
							  unsigned char green,
							  unsigned char blue,
							  unsigned char alpha);

UIColor * UIColorMakeWithHEX(NSString * hexString);



@interface UIColor (RGBA)

+ (UIColor *) colorWithRedByte:(unsigned char)red 
					 greenByte:(unsigned char)green 
					  blueByte:(unsigned char)blue 
					 alphaByte:(unsigned char)alpha;

+ (UIColor *) colorWithRedByte:(unsigned char)red 
					 greenByte:(unsigned char)green 
					  blueByte:(unsigned char)blue;

+ (UIColor *) colorWithHEXString:(NSString *)hexString;

@end

#endif 


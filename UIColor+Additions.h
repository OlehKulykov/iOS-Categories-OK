

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifndef __UICOLOR_ADDITIONS_H__
#define __UICOLOR_ADDITIONS_H__

UIColor * UIColorMakeWithRGB(unsigned char red,
							 unsigned char green,
							 unsigned char blue);


UIColor * UIColorMakeWithRGBA(unsigned char red,
							  unsigned char green,
							  unsigned char blue,
							  unsigned char alpha);

UIColor * UIColorMakeWithHEX(NSString * hexString);

#endif /* __UICOLOR_ADDITIONS_H__ */



@interface UIColor(RGBA)

+ (UIColor *) colorWithRedByte:(unsigned char)red 
					 greenByte:(unsigned char)green 
					  blueByte:(unsigned char)blue 
					 alphaByte:(unsigned char)alpha;

+ (UIColor *) colorWithRedByte:(unsigned char)red 
					 greenByte:(unsigned char)green 
					  blueByte:(unsigned char)blue;

+ (UIColor *) colorWithHEXString:(NSString *)hexString;

@end



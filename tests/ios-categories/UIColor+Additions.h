

#ifndef __UICOLOR_ADDITIONS_H__
#define __UICOLOR_ADDITIONS_H__

#import <Foundation/Foundation.h>

UIColor * UIColorMakeWithRGB(unsigned char red,
						 unsigned char green,
						 unsigned char blue);


UIColor * UIColorMakeWithRGBA(unsigned char red,
						  unsigned char green,
						  unsigned char blue,
						  unsigned char alpha);

UIColor * UIColorMakeWithHEX(NSString * hexString);

#endif /* __UICOLOR_ADDITIONS_H__ */


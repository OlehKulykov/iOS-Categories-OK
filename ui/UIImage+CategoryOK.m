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


#import "UIImage+CategoryOK.h"
#import <CoreGraphics/CoreGraphics.h>

@implementation UIImage (ColorizedCreation)

+ (UIImage *) imageWithColor:(UIColor *) color
					 andSize:(CGSize) size
{
	return [UIImage imageWithColor:color size:size andOpaque:YES];
}

+ (UIImage *) imageWithColor:(UIColor *) color
						size:(CGSize) size
				   andOpaque:(BOOL) opaque
{
	if (color && ((size.width > 0.0f) && (size.height > 0.0))) 
	{
		const CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
		UIGraphicsBeginImageContextWithOptions(size, opaque, [[UIScreen mainScreen] scale]);
		CGContextRef context = UIGraphicsGetCurrentContext();
		
		CGContextSetFillColorWithColor(context, [color CGColor]);
		CGContextFillRect(context, rect);
		
		UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
		return image;
	}
	return nil;
}


@end


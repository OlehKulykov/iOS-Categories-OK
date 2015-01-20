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


#import "UIView+CategoryOK.h"
#import "NSArray+CategoryOK.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (BackgroundImage)

- (void) setBackgroundImage:(UIImage *)backgroundImage
{
	CALayer * layer = [self layer];
	[layer setContents:(id)[backgroundImage CGImage]];
}

@end



@implementation UIView (SimpleFrame)

- (CGFloat) x
{
	return self.frame.origin.x;
}

- (void) setX:(CGFloat)newX
{
	CGRect selfFrame = [self frame];
	selfFrame.origin.x = newX;
	[self setFrame:selfFrame];
}

- (CGFloat) y
{
	return self.frame.origin.y;
}

- (void) setY:(CGFloat)newY
{
	CGRect selfFrame = [self frame];
	selfFrame.origin.y = newY;
	[self setFrame:selfFrame];
}

- (CGFloat) width
{
	return self.frame.size.width;
}

- (void) setWidth:(CGFloat)newWidth
{
	CGRect selfFrame = [self frame];
	selfFrame.size.width = newWidth;
	[self setFrame:selfFrame];
}

- (CGFloat) height
{
	return self.frame.size.height;
}

- (void) setHeight:(CGFloat)newHeight
{
	CGRect selfFrame = [self frame];
	selfFrame.size.height = newHeight;
	[self setFrame:selfFrame];
}

@end

@implementation UIView (SubviewWithClassType)

- (id) subviewWithClass:(Class) svClass
{
	if (svClass) 
	{
		NSArray * sviews = [self subviews];
		if (NSArrayIsNotEmpty(sviews)) 
		{
			for (id obj in sviews) 
			{
				if ([obj isKindOfClass:svClass]) 
				{
					return obj;
				}
			}
		}
	}
	return nil;
}

@end





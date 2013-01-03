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


#import "UIView+CategoryOK.h"
#import <QuartzCore/QuartzCore.h>

#ifndef NO_UIViewBackgroundImage_CATEGORY_OK

@implementation UIView (BackgroundImage)

- (void) setBackgroundImage:(UIImage *)backgroundImage
{
	CALayer * layer = [self layer];
	[layer setContents:(id)[backgroundImage CGImage]];
}

@end

#endif



#ifndef NO_UIViewSimpleFrame_CATEGORY_OK

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

#endif





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


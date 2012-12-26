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


#import "UIView+iOSAdditions.h"
#import <QuartzCore/QuartzCore.h>

#ifndef NO_UIViewBackgroundImage__IOSADDITIONS__

@implementation UIView (BackgroundImage)

- (void) setBackgroundImage:(UIImage *)backgroundImage
{
	CALayer * layer = [self layer];
	[layer setContents:(id)[backgroundImage CGImage]];
}

@end

#endif
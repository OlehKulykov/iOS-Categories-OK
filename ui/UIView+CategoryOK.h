/*
 *   Copyright 2012 - 2014 Kulykov Oleh
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


#import <UIKit/UIKit.h>


@interface UIView (BackgroundImage)

/**
 @brief Set background view image.
 @detailed Set background image to the view layer using setContents. Image scales to content.
 @param backgroundImage The view background image.
 */
- (void) setBackgroundImage:(UIImage *)backgroundImage;

@end


@interface UIView (SimpleFrame)

/**
 @brief View read/write property for it's frame coordinate X.
 */
@property CGFloat x;


/**
 @brief View read/write property for it's frame coordinate Y.
 */
@property CGFloat y;


/**
 @brief View read/write property for it's frame size Width.
 */
@property CGFloat width;


/**
 @brief View read/write property for it's frame size Height.
 */
@property CGFloat height;


@end



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

/**
 @brief Class of the rotetable view.
 @detailed View can be rotated using radian angle arround anchor point.
 */
@interface AnchorPointRotatableUIView : UIView

/**
 @brief Rotates view using radian angle arround anchor point.
 @detailed Rotates view layer by angle in radians using anchor point coordinates in view coordinate system e.g. point inside view bounds.
 @param radianAngle radian angle.
 @param anchorPoint anchor point coordinates in view coordinate system.
 */ 
- (void) rotateByAngle:(CGFloat)radianAngle withAnchorPoint:(CGPoint)anchorPoint;

@end

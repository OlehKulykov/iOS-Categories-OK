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


#ifndef __CUSTOMMATH_H__
#define __CUSTOMMATH_H__

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import "iOS_Categories_OK_CommonHeader.h"

/// 180/pi
#ifndef MATH_RADIAN
/// Radian value also 180 devided by PI value.
#define MATH_RADIAN (57.295779513082320876798154814105)
#endif


/// 180/pi
#ifndef MATH_180_DIV_PI
/// 180 devided by PI value.
#define MATH_180_DIV_PI MATH_RADIAN
#endif


/// pi/180
#ifndef MATH_PI_DIV_180
/// PI devided by 180 value.
#define MATH_PI_DIV_180 (0.017453292519943295769236907684886)
#endif


#ifndef DEG_TO_RAD
/// Converts degree to radian angle.
#define DEG_TO_RAD(a) (MATH_PI_DIV_180 * a)
#endif


#ifndef RAD_TO_DEG
/// Converts radian to degree angle.
#define RAD_TO_DEG(a) (MATH_180_DIV_PI * a)
#endif


#ifndef NSUInteger64
//typedef uint64_t NSUInteger64;
#define NSUInteger64 uint64_t
#endif

#ifndef NSInteger64
//typedef int64_t NSInteger64;
#define NSInteger64 int64_t
#endif


/// Returns distance between two float values.
IOS_CATEGORIES_INLINE CGFloat DistanceBetweenFloatValues(const CGFloat firstValue, const CGFloat secondValue)
{
	const CGFloat subResult = firstValue - secondValue;
	return ABS(subResult);
}

/// Returns distance between two points.
IOS_CATEGORIES_INLINE CGFloat AngleBetweenPoints(const CGPoint first, const CGPoint second)
{
	const CGFloat dx = first.x - second.x;
	const CGFloat dy = first.y - second.y;
	return atan2f(dy, dx);
}


#endif 

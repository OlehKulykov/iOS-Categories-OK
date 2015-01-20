/*
 *   Copyright 2012 - 2015 Kulykov Oleh
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

/**
 @brief Radian value.
 @detailed Radian value is: 180.0 devided by PI value.
 */ 
#ifndef MATH_RADIAN
#define MATH_RADIAN (57.295779513082320876798154814105)
#endif


/**
 @brief 180 devided by PI value.
 @detailed 180 devided by PI value: 180/PI.
 */ 
#ifndef MATH_180_DIV_PI
#define MATH_180_DIV_PI MATH_RADIAN
#endif


/**
 @brief PI devided by 180 value.
 @detailed 180 devided by PI value: PI/180.
 */ 
#ifndef MATH_PI_DIV_180
#define MATH_PI_DIV_180 (0.017453292519943295769236907684886)
#endif


/**
 @brief Converts degree to radian angle.
 */ 
#ifndef DEG_TO_RAD
#define DEG_TO_RAD(a) (MATH_PI_DIV_180 * a)
#endif


/**
 @brief Converts radian to degree angle.
 */ 
#ifndef RAD_TO_DEG
#define RAD_TO_DEG(a) (MATH_180_DIV_PI * a)
#endif


/**
 @brief Returns distance between two float values.
 @param firstValue The first float value.
 @param secondValue The second float value.
 @return Positive float distance between values.
 */ 
IOS_CATEGORIES_INLINE CGFloat DistanceBetweenFloatValues(const CGFloat firstValue, const CGFloat secondValue)
{
	const CGFloat subResult = firstValue - secondValue;
	return ABS(subResult);
}


/**
 @brief Returns angle between two points.
 @param first The first point value.
 @param second The second point value.
 @return Radian angle between points.
 */ 
IOS_CATEGORIES_INLINE CGFloat AngleBetweenPoints(const CGPoint first, const CGPoint second)
{
	const CGFloat dx = first.x - second.x;
	const CGFloat dy = first.y - second.y;
	return atan2f(dy, dx);
}


#endif /* __CUSTOMMATH_H__ */

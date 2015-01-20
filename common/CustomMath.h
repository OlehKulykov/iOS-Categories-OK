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

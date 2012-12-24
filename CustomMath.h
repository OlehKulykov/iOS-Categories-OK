

#ifndef __CUSTOMMATH_H__
#define __CUSTOMMATH_H__

#import <Foundation/Foundation.h>

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


/// Returns distance between two float values.
static inline CGFloat DistanceBetweenFloatValues(const CGFloat firstValue, const CGFloat secondValue)
{
	const CGFloat subResult = firstValue - secondValue;
	return ABS(subResult);
}

/// Returns distance between two points.
static inline CGFloat AngleBetweenPoints(const CGPoint first, const CGPoint second)
{
	const CGFloat dx = first.x - second.x;
	const CGFloat dy = first.y - second.y;
	return atan2f(dy, dx);
}


#endif /* __CUSTOMMATH_H__ */

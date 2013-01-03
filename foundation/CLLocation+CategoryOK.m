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


#import "CLLocation+CategoryOK.h"

#ifndef NO_CLLocationDistancePrevTo_iOS_3_2_CATEGORY_OK

#import "../common/CustomMath.h"
#include <math.h>

CLLocationDistance GetDistanceBetweenCoordinates(const CLLocationCoordinate2D firstCoord, 
												 const CLLocationCoordinate2D secondCoord)
{	
	long double firstLatitude = firstCoord.latitude;
	long double firstLongitude = firstCoord.longitude;
	long double secondLatitude = secondCoord.latitude;
	long double secondLongitude = secondCoord.longitude;
	const long double epsilon = 1e-7;
	firstLongitude = secondLongitude - firstLongitude;
	firstLatitude = sinl(firstLatitude) * sinl(secondLatitude) + cosl(firstLatitude) * cosl(secondLatitude) * cosl(firstLongitude);
	if (fabsl(firstLatitude) > epsilon) 
	{
		secondLatitude = 1 - firstLatitude * firstLatitude;
		if ((secondLatitude > -epsilon) && (secondLatitude < epsilon))
		{
			secondLatitude = 0.0;
		}
		
		secondLatitude = atanl(sqrtl(secondLatitude) / firstLatitude);
		
		if (firstLatitude < -epsilon)
		{
			secondLatitude = M_PI + secondLatitude;
		}
		
		const long double kilomConvertRange = 1.853 * 60 * MATH_RADIAN;
		return secondLatitude * kilomConvertRange;
	}
	else
	{
		/// 1/4 of Earth's circumference, in km
		return 10006.2; 
	}
	return (CLLocationDistance)0;
}

CLLocationDistance GetDistanceBetweenLocations(CLLocation * firstLocation, 
											   CLLocation * secondLocation)
{
	if (firstLocation && secondLocation) 
	{
		return GetDistanceBetweenCoordinates([firstLocation coordinate],
											 [secondLocation coordinate]);
	}
	return (CLLocationDistance)0;
}



@implementation CLLocation(DistancePrevTo_iOS_3_2)

+ (CLLocationDistance) GetDistanceFromLocation:(CLLocation *)firstLocation 
									toLocation:(CLLocation *)secondLocation
{
	if (firstLocation && secondLocation) 
	{
		return GetDistanceBetweenCoordinates([firstLocation coordinate],
											 [secondLocation coordinate]);
	}
	return (CLLocationDistance)0;
}

+ (CLLocationDistance) GetDistanceFromCoordinates:(const CLLocationCoordinate2D)firstCoord 
									toCoordinates:(const CLLocationCoordinate2D)secondCoord
{
	return GetDistanceBetweenCoordinates(firstCoord, secondCoord);
}

@end

#endif

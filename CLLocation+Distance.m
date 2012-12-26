

#import "CLLocation+Distance.h"
#import "CustomMath.h"
#include <math.h>

CLLocationDistance GetDistanceBetweenCoordinates(const CLLocationCoordinate2D firstCoord, 
												 const CLLocationCoordinate2D secondCoord)
{	
	long double lat1 = firstCoord.latitude;
	long double lon1 = firstCoord.longitude;
	long double lat2 = secondCoord.latitude;
	long double lon2 = secondCoord.longitude;
	const long double epsilon = 1e-7;
	lon1 = lon2 - lon1;
	lat1 = sinl(lat1) * sinl(lat2) + cosl(lat1) * cosl(lat2) * cosl(lon1);
	if (fabsl(lat1) > epsilon) 
	{
		lat2 = 1 - lat1 * lat1;
		if ((lat2 > -epsilon) && (lat2 < epsilon))
		{
			lat2 = 0.0;
		}
		
		lat2 = atanl(sqrtl(lat2) / lat1);
		
		if (lat1 < -epsilon)
		{
			lat2 = M_PI + lat2;
		}
		
		const long double kilomConvertRange = 1.853 * 60 * MATH_RADIAN;
		return lat2 * kilomConvertRange;
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

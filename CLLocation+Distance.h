

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


#ifndef __CLLOCATION_DISTANCE_H__
#define __CLLOCATION_DISTANCE_H__

CLLocationDistance GetDistanceBetweenCoordinates(const CLLocationCoordinate2D firstCoord, 
												 const CLLocationCoordinate2D secondCoord);

CLLocationDistance GetDistanceBetweenLocations(CLLocation * firstLocation, 
											   CLLocation * secondLocation);

#endif /* __CLLOCATION_DISTANCE_H__ */


@interface CLLocation(DistancePrevTo_iOS_3_2)

+ (CLLocationDistance) GetDistanceFromLocation:(CLLocation *)firstLocation 
									toLocation:(CLLocation *)secondLocation;


+ (CLLocationDistance) GetDistanceFromCoordinates:(const CLLocationCoordinate2D)firstCoord 
									toCoordinates:(const CLLocationCoordinate2D)secondCoord;

@end

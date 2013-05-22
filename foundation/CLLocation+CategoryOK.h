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


//#define NO_CLLocationDistancePrevTo_iOS_3_2_CATEGORY_OK

#ifndef NO_CLLocationDistancePrevTo_iOS_3_2_CATEGORY_OK

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

CLLocationDistance GetDistanceBetweenCoordinates(const CLLocationCoordinate2D firstCoord, 
												 const CLLocationCoordinate2D secondCoord);

CLLocationDistance GetDistanceBetweenLocations(CLLocation * firstLocation, 
											   CLLocation * secondLocation);


@interface CLLocation(DistancePrevTo_iOS_3_2)

+ (CLLocationDistance) GetDistanceFromLocation:(CLLocation *)firstLocation 
									toLocation:(CLLocation *)secondLocation;


+ (CLLocationDistance) GetDistanceFromCoordinates:(const CLLocationCoordinate2D)firstCoord 
									toCoordinates:(const CLLocationCoordinate2D)secondCoord;

@end

#endif

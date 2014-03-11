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


#import <Foundation/Foundation.h>
#import "iOS_Categories_OK_CommonHeader.h"

/**
 @brief Class for get current time.
 @detailed Getting current time based on mach absolute time.
 */
@interface MachTime : NSObject

/**
 @brief Get current time from application start.
 @result Time interval in seconds.
 */
+ (NSTimeInterval) currentTime;


/**
 @brief Get current mach absolute as is.
 @result Unsigned integer of the mach counter.
 */
+ (uint64_t) machAbsoluteTime;

@end


/**
 @brief Convert time interval in seconds to hours, minutes and seconds.
 @param hours Pointer to hours integer variable, should not be nil.
 @param minutes Pointer to minutes integer variable, should not be nil.
 @param seconds Pointer to seconds integer variable, should not be nil.
 */ 
IOS_CATEGORIES_OK_EXTERN void TimeIntervalToHMS(const double timeInSeconds,
												int * hours,
												int * minutes,
												int * seconds);


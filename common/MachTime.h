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


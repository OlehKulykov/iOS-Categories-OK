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


#import "MachTime.h"

#include <inttypes.h>
#include <mach/mach_time.h>

typedef struct __machTimeStructPrivate
{
	uint64_t absoluteAppStartTime;
	uint64_t absoluteLastCallTime;
	double_t nanoSecond;
} __MachTimeStructPrivate;

static void __InitMachTimeStructPrivate(__MachTimeStructPrivate * timeStruct)
{
	mach_timebase_info_data_t info = { 0 };
	if (mach_timebase_info(&info) == KERN_SUCCESS && info.denom)
	{
		timeStruct->absoluteAppStartTime = mach_absolute_time();
		timeStruct->absoluteLastCallTime = timeStruct->absoluteAppStartTime;
		timeStruct->nanoSecond = 1e-9 * ((double_t)info.numer) / ((double_t)info.denom);
	}
}

@implementation MachTime

static __MachTimeStructPrivate timeStructPrivate = { 0 };

+ (NSTimeInterval) currentTime
{
	if ( !timeStructPrivate.absoluteAppStartTime )
	{
		__InitMachTimeStructPrivate(&timeStructPrivate);
	}
	return ((double_t)(mach_absolute_time() - timeStructPrivate.absoluteAppStartTime) * timeStructPrivate.nanoSecond);
}

+ (uint64_t) machAbsoluteTime
{
	return mach_absolute_time();
}

@end


void TimeIntervalToHMS(const double timeInSeconds,
					   int * hours,
					   int * minutes,
					   int * seconds)
{
	*hours = floor(timeInSeconds / 3600.0);
	*minutes = floor(fmod(timeInSeconds, 3600.0) / 60.0);
	*seconds = fmod(timeInSeconds, 60.0);
}


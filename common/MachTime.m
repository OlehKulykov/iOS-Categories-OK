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


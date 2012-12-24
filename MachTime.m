

#import "MachTime.h"
#include <inttypes.h>
#include <mach/mach_time.h>

typedef struct _machTimeStruct
{
	uint64_t absoluteAppStartTime;
	uint64_t absoluteLastCallTime;
	long double nanoSecond;
} MachTimeStruct;

void InitMachTimeStruct(MachTimeStruct * timeStruct)
{
	mach_timebase_info_data_t info = { 0 };
	if (mach_timebase_info(&info) == KERN_SUCCESS && info.denom)
	{
		timeStruct->absoluteAppStartTime = mach_absolute_time();
		timeStruct->absoluteLastCallTime = timeStruct->absoluteAppStartTime;
		timeStruct->nanoSecond = 1e-9 * ((long double)info.numer) / ((long double)info.denom);
	}
}

NSTimeInterval GetMachTime()
{
	static MachTimeStruct timeStruct = { 0 };
	if ( !timeStruct.absoluteAppStartTime )
	{
		InitMachTimeStruct(&timeStruct);
	}
	return ((long double)(mach_absolute_time() - timeStruct.absoluteAppStartTime) * timeStruct.nanoSecond);
}




#import "MachTimeTests.h"
#import "MachTime.h"

 
@implementation MachTimeTests

- (void) testTime
{
	@try 
	{
		NSTimeInterval currentTime = [MachTime currentTime];
		[NSThread sleepForTimeInterval:1.0 / 1000.0];
		if ( currentTime >= [MachTime currentTime] ) 
		{
			STFail(@"MachTimeTests: current time calculation not correct.");
		}
	}
	@catch (NSException *exception) 
	{
		STFail(@"MachTimeTests: exception on mach time.");
	}
	@finally 
	{
		
	}
}

@end

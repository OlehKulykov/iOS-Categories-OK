

#import "MachTimeTests.h"
#import "MachTime.h"


@implementation MachTimeTests

- (void) testTime
{
	NSTimeInterval currentTime = GetMachTime();
	
	currentTime = GetMachTime();
}

@end

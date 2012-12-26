

#import "NSArrayTests.h"
#import "NSArray+iOSAdditions.h"

@implementation NSArrayTests
 
- (void) testArray
{
	if ( ![NSArray isEmpty:nil] )
	{
		STFail(@"NSArrayTests: 'isEmpty' ");
	}
	
	if ( ![NSArray isEmpty:[NSArray array]] )
	{
		STFail(@"NSArrayTests: 'isEmpty' ");
	}
	
	if ( ![NSArray isNotEmpty:[NSArray arrayWithObject:@" "]] )
	{
		STFail(@"NSArrayTests: 'isNotEmpty' ");
	}
	
}

@end



#import "UIColorTests.h"
#import "UIColor+CategoryOK.h"

@implementation UIColorTests

- (void) testUIColor
{
	UIColor * color = nil;
	
	color = UIColorMakeWithHEX(@"#ffffff");
	color = UIColorMakeWithHEX(@"ffffff");
	
	color = nil;
}

@end

//
//  UIColorTests.m
//  ios-categories
//
//  Created by Resident Evil on 26.12.12.
//  Copyright (c) 2012 n. All rights reserved.
//

#import "UIColorTests.h"
#import "UIColor+Additions.h"

@implementation UIColorTests

- (void) testUIColor
{
	UIColor * color = nil;
	
	color = UIColorMakeWithHEX(@"#ffffff");
	color = UIColorMakeWithHEX(@"ffffff");
	
	color = nil;
}

@end

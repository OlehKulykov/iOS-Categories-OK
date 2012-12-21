//
//  NSArrayTests.m
//  ios-categories
//
//  Created by Resident Evil on 21.12.12.
//  Copyright (c) 2012 n. All rights reserved.
//

#import "NSArrayTests.h"
#import "NSArray+StaticInfo.h"

@implementation NSArrayTests

- (void) testArray
{
	NSArray * array = nil;
	if ( ![NSArray isEmpty:array] )
	{
		STFail(@"NSArrayTests: 'isEmpty' ");
	}
	
	
}

@end

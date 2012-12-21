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

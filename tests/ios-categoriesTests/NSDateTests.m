//
//  NSDateTests.m
//  ios-categories
//
//  Created by Resident Evil on 22.03.14.
//  Copyright (c) 2014 n. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "JSONObjectConverter.h"

@interface NSDateTests : SenTestCase

@end

@implementation NSDateTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
	NSDate * date = [JSONObjectConverter toDate:@"2014-03-22T09:12:23.493Z"];
	if (!date) 
	{
		STFail(@"Error for date converter %@ \"%s\"", @"2014-03-22T09:12:23.493Z", __PRETTY_FUNCTION__);
	}
    
}

@end

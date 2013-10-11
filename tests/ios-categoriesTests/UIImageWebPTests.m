//
//  UIImageWebPTests.m
//  ios-categories
//
//  Created by Resident Evil on 10.10.13.
//  Copyright (c) 2013 n. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "UIImage+CategoryOK.h"

@interface UIImageWebPTests : SenTestCase

@end

@implementation UIImageWebPTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void) testWebPImageLoading
{
	UIImage * image = [UIImage imageWithContentsOfWebPFile:@"/Users/residentevil/Downloads/webpiosapp-0.2.1/ViewWebP/ViewWebP/gallery/1.webp"];
	if (!image) 
	{
		STFail(@"Can't initialize webp image \"%s\"", __PRETTY_FUNCTION__);
	}
	
	NSData * data = [NSData dataWithContentsOfFile:@"/Users/residentevil/Downloads/webpiosapp-0.2.1/ViewWebP/ViewWebP/gallery/1.webp"];
	if (data) 
	{
		image = [UIImage imageWithWebPData:data scale:2];
		if (!image) 
		{
			STFail(@"Can't initialize webp image from data \"%s\"", __PRETTY_FUNCTION__);
		}
	}
	
	image = [UIImage imageWithContentsOfFile:@"/Users/residentevil/Documents/RIMG/img1.png.0"];
	if (image) 
	{
		data = [image losslessWebPRepresentation];
		[data writeToFile:@"/Users/residentevil/Documents/RIMG/img1.png.lossless.webp" atomically:YES];
		if (!data) 
		{
			STFail(@"Can't encode webp image \"%s\"", __PRETTY_FUNCTION__);
		}
		
		data = [image lossyWebPRepresentationWithCompressionQuality:90.0f];
		[data writeToFile:@"/Users/residentevil/Documents/RIMG/img1.png.90pers.webp" atomically:YES];
		if (!data) 
		{
			STFail(@"Can't encode webp image \"%s\"", __PRETTY_FUNCTION__);
		}
	}

}

@end

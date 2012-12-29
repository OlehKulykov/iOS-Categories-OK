

#import "NSDataTests.h"
#import "NSData+CategoryOK.h"

@implementation NSDataTests

- (void) testZip
{
/// Need define because zip compression requares linking with zlib library
#ifndef NO_DataZIPCompression_CATEGORY_OK
	NSString * pngDataPath = [[NSBundle bundleForClass:[self class]] pathForResource:@"Default"
																			  ofType:@"png"];
	if ( !pngDataPath )
	{
		STFail(@"NSDataTests: test file path not found.");
	}
	
	NSData * sourceData = [NSData dataWithContentsOfFile:pngDataPath];
	if ( !sourceData ) 
	{
		STFail(@"NSDataTests: test file data is empty.");
	}
	
	if ( ![UIImage imageWithData:sourceData] ) 
	{
		STFail(@"NSDataTests: test image is empty.");
	}
	
	
	NSData * zipData = [sourceData zipCompressedDataWithRatio:1.0];
	if ( !zipData ) 
	{
		STFail(@"NSDataTests: error compression, compressed data is empty.");
	}
	
	NSData * unZipData = [zipData zipDecompressedData];
	if ( !unZipData ) 
	{
		STFail(@"NSDataTests: error decompression, decompressed data is empty.");
	}
	
	if ( ![unZipData isEqualToData:sourceData] ) 
	{
		STFail(@"NSDataTests: error in decompression alg.");
	}
	
	if ( ![UIImage imageWithData:unZipData] )
	{
		STFail(@"NSDataTests: test image from unzipped data is empty.");
	}
	
#endif
}

@end

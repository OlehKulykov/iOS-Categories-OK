

#import "NSStringTests.h"
#import "NSString+okCategory.h"

@implementation NSStringTests

- (void) testPaths
{
	NSFileManager * manager = [[NSFileManager alloc] init];
	BOOL isDir = NO;
	NSString * path = [NSString userDocumentPath];
	if ( !path ) 
	{
		STFail(@"NSStringTests: userDocumentPath is empty.");
	}
	else if (![manager fileExistsAtPath:path isDirectory:&isDir] ||
			 ![manager isReadableFileAtPath:path] ||
			 ![manager isWritableFileAtPath:path])
	{
		STFail(@"NSStringTests: userDocumentPath unaccessible.");
	}
	if (!isDir) 
	{
		STFail(@"NSStringTests: userDocumentPath is not dirrectory");
	}
	
	
	path = [NSString userCachePath];
	if ( !path ) 
	{
		STFail(@"NSStringTests: userCachePath is empty.");
	}
	else if (![manager fileExistsAtPath:path isDirectory:&isDir] ||
			 ![manager isReadableFileAtPath:path] ||
			 ![manager isWritableFileAtPath:path])
	{
		STFail(@"NSStringTests: userCachePath unaccessible.");
	}
	if (!isDir) 
	{
		STFail(@"NSStringTests: userDocumentPath is not dirrectory");
	}
}

@end

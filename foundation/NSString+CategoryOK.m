/*
 *   Copyright 2012 - 2013 Kulykov Oleh
 *
 *   Licensed under the Apache License, Version 2.0 (the "License");
 *   you may not use this file except in compliance with the License.
 *   You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 *   Unless required by applicable law or agreed to in writing, software
 *   distributed under the License is distributed on an "AS IS" BASIS,
 *   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *   See the License for the specific language governing permissions and
 *   limitations under the License.
 */


#import "NSString+CategoryOK.h"
#import "../common/MachTime.h"

#import <CoreFoundation/CoreFoundation.h>
#include <unistd.h>
#include <sys/stat.h>

@implementation NSString(IsEmpty)

+ (BOOL) isEmpty:(NSString *)stringToTest
{
	return NSStringIsEmpty(stringToTest);
}

+ (BOOL) isNotEmpty:(NSString *)stringToTest
{
	return NSStringIsNotEmpty(stringToTest);
}

@end

@implementation NSString(Containes)

- (BOOL) isContainesSubstring:(NSString *)subString
{
	if (subString) 
	{
		const NSRange r = [self rangeOfString:subString options:NSCaseInsensitiveSearch];
		return (r.location != NSNotFound && r.length != 0);
	}
	return NO;
}

@end

static NSString * __NSStringSystemPathsGetFirstPathFromArray(NSArray * pathsArray)
{
	if ([pathsArray count]) 
	{
		NSString * path = [pathsArray objectAtIndex:0];
		const char * utf8Path = [path UTF8String];
		if (utf8Path) 
		{
			if (access(utf8Path, R_OK | W_OK | F_OK) == 0) 
			{
				return path;
			}
			else if (mkdir(utf8Path, 644) == 0)
			{
				return path;
			}
		}
	}
	return nil;
}

@implementation NSString (SystemPaths)

+ (BOOL) isFilePathExists:(NSString *) pathForTest
{
	return NSStringIsFilePathExists(pathForTest);
}

+ (BOOL) isDirPathExists:(NSString *) pathForTest
{
	return NSStringIsDirPathExists(pathForTest);
}

+ (NSString *) userDocumentPath
{
	NSArray * pathsArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	return __NSStringSystemPathsGetFirstPathFromArray(pathsArray);
}

+ (NSString *) userCachePath
{
	NSArray * pathsArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
	return __NSStringSystemPathsGetFirstPathFromArray(pathsArray);
}

+ (NSString *) tempFileFullPath
{
	NSArray * pathsArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString * path = __NSStringSystemPathsGetFirstPathFromArray(pathsArray);
	if (!path) return nil;
	
	NSString * fullFilePath = nil;
	while (!fullFilePath) 
	{
		fullFilePath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"tmp%u", arc4random()]];
		if (fullFilePath) 
		{
			if ([[NSFileManager defaultManager] fileExistsAtPath:fullFilePath])
			{
				fullFilePath = nil;
			}
		}
	}
	
	return fullFilePath;
}

BOOL __NSStringSystemPathsCreateFullPathIfNeeded(NSString * path)
{
	if (path) 
	{
		NSFileManager * manager = [NSFileManager defaultManager];
		BOOL isDir = NO;
		if ([manager fileExistsAtPath:path isDirectory:&isDir]) 
		{
			if (isDir && [manager isReadableFileAtPath:path] && [manager isWritableFileAtPath:path]) 
			{
				return YES;
			}
			[manager removeItemAtPath:path error:nil];
		}
		
		return [manager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
	}
	return NO;
}

+ (NSString *) storageDirFullPathForClass:(Class) targetClass
{
	NSString * path = [NSString userDocumentPath];
	if (path)
	{
		path = [path stringByAppendingPathComponent:NSStringFromClass(targetClass)];
		return __NSStringSystemPathsCreateFullPathIfNeeded(path) ? path : nil;
	}
	return nil;
}

+ (NSString *) uniqFileFullPathInDirectory:(NSString *) directoryPath
{
	if (directoryPath)
	{
		BOOL isDir = NO;
		NSFileManager * manager = [NSFileManager defaultManager];
		if ([manager fileExistsAtPath:directoryPath isDirectory:&isDir])
		{
			if (isDir)
			{
				int count = -1, max = 5;
				while (++count < max)
				{
					NSString * newPath = [directoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%llu.file", [MachTime machAbsoluteTime]]];
					if (newPath)
					{
						if (![manager fileExistsAtPath:newPath])
						{
							return newPath;
						}
					}
				}
			}
		}
	}
	return nil;
}

@end




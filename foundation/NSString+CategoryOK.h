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


#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>
#import <CoreGraphics/CoreGraphics.h>

CG_INLINE BOOL NSStringIsEmpty(NSString * stringToTest)
{
	return (stringToTest) ? ([stringToTest length] == 0) : YES;
}

CG_INLINE BOOL NSStringIsNotEmpty(NSString * stringToTest)
{
	return (stringToTest) ? ([stringToTest length] > 0) : NO;
}

CG_INLINE BOOL NSStringIsFilePathExists(NSString * pathForTest)
{
	if (NSStringIsNotEmpty(pathForTest)) 
	{
		BOOL isDir = YES;
		if ([[NSFileManager defaultManager] fileExistsAtPath:pathForTest 
												 isDirectory:&isDir]) 
		{
			return isDir ? NO : YES;
		}
	}
	return NO;
}

CG_INLINE BOOL NSStringIsDirPathExists(NSString * pathForTest)
{
	if (NSStringIsNotEmpty(pathForTest)) 
	{
		BOOL isDir = NO;
		if ([[NSFileManager defaultManager] fileExistsAtPath:pathForTest 
												 isDirectory:&isDir]) 
		{
			return isDir ? YES : NO;
		}
	}
	return NO;
}


@interface NSString(IsEmpty)

+ (BOOL) isEmpty:(NSString *)stringToTest;

+ (BOOL) isNotEmpty:(NSString *)stringToTest;

@end

@interface NSString (Containes)

- (BOOL) isContainesSubstring:(NSString *)subString;

@end



@interface NSString (SpecialHTMLCharacters)


- (NSString *) stringByDecodeSpecialHTMLCharacters;

- (NSString *) stringByEncodeSpecialHTMLCharacters;


@end



@interface NSString (SystemPaths)

+ (BOOL) isFilePathExists:(NSString *) pathForTest;

+ (BOOL) isDirPathExists:(NSString *) pathForTest;

+ (NSString *) userDocumentPath;

+ (NSString *) userCachePath;

+ (NSString *) tempFileFullPath;

/// Returns existed path based on user document path with read/write permissions.
/// Class directory will be created.
+ (NSString *) storageDirFullPathForClass:(Class) targetClass;

+ (NSString *) uniqFileFullPathInDirectory:(NSString *) directoryPath;

@end




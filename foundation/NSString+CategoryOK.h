/*
 *   Copyright 2012 - 2014 Kulykov Oleh
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
#import "../common/iOS_Categories_OK_CommonHeader.h"


/**
 @brief Check string is empty.
 @param stringToTest The test string object.
 @return YES if nil or length is 0, othervice NO.
 */
IOS_CATEGORIES_INLINE BOOL NSStringIsEmpty(NSString * stringToTest)
{
	return (stringToTest) ? ([stringToTest length] == 0) : YES;
}


/**
 @brief Check string is not empty.
 @param stringToTest The test string object.
 @return YES string has character and not nil, othervice NO.
 */
IOS_CATEGORIES_INLINE BOOL NSStringIsNotEmpty(NSString * stringToTest)
{
	return (stringToTest) ? ([stringToTest length] > 0) : NO;
}


/**
 @brief Check file path exists.
 @param pathForTest The test path string object.
 @return YES path exists and not directory, othervice NO.
 */
IOS_CATEGORIES_INLINE BOOL NSStringIsFilePathExists(NSString * pathForTest)
{
	if (NSStringIsNotEmpty(pathForTest)) 
	{
		BOOL isDir = YES;
		if ([[NSFileManager defaultManager] fileExistsAtPath:pathForTest isDirectory:&isDir]) 
		{
			return ( !isDir );
		}
	}
	return NO;
}


/**
 @brief Check directory path exists.
 @param pathForTest The test path string object.
 @return YES path exists and is directory, othervice NO.
 */
IOS_CATEGORIES_INLINE BOOL NSStringIsDirPathExists(NSString * pathForTest)
{
	if (NSStringIsNotEmpty(pathForTest)) 
	{
		BOOL isDir = NO;
		if ([[NSFileManager defaultManager] fileExistsAtPath:pathForTest isDirectory:&isDir]) 
		{
			return isDir;
		}
	}
	return NO;
}


@interface NSString(IsEmpty)


/**
 @brief Check string is empty.
 @param stringToTest The test string object.
 @return YES if nil or length is 0, othervice NO.
 */
+ (BOOL) isEmpty:(NSString *)stringToTest;


/**
 @brief Check string is not empty.
 @param stringToTest The test string object.
 @return YES string has character and not nil, othervice NO.
 */
+ (BOOL) isNotEmpty:(NSString *)stringToTest;

@end

@interface NSString (Containes)

/**
 @brief Check string containes not empty substring using case insensitive search.
 @param subString The string object for searching.
 @return YES substring conteines, othervice NO.
 */
- (BOOL) isContainesSubstring:(NSString *)subString;

@end


@interface NSString (SystemPaths)

/**
 @brief Check file path exists.
 @param pathForTest The test path string object.
 @return YES path exists and not directory, othervice NO.
 */
+ (BOOL) isFilePathExists:(NSString *) pathForTest;


/**
 @brief Check directory path exists.
 @param pathForTest The test path string object.
 @return YES path exists and is directory, othervice NO.
 */
+ (BOOL) isDirPathExists:(NSString *) pathForTest;


/**
 @brief Returns current user documents path.
 @return String with documents path.
 */
+ (NSString *) userDocumentPath;


/**
 @brief Returns current user cache path.
 @return String with cache path.
 */
+ (NSString *) userCachePath;


/**
 @brief Returns temporary file path in users documents directory.
 @return String temporary file path in users documents directory.
 */
+ (NSString *) tempFileFullPath;


/**
 @brief Existed path based on user document path with read/write permissions.
 @detailed Class directory will be created.
 @return String with existed path based on user document path with read/write permissions or nil on error.
 */
+ (NSString *) storageDirFullPathForClass:(Class) targetClass;


/**
 @brief Generates uniq file path in directory.
 @param directoryPath The directory with temp file.
 @return String with nonexisted uniq file path in directory.
 */
+ (NSString *) uniqFileFullPathInDirectory:(NSString *) directoryPath;

@end




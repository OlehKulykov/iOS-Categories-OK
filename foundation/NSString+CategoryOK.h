/*
 *   Copyright (c) 2012 - 2015 Kulykov Oleh <nonamedemail@gmail.com>
 *
 *   Permission is hereby granted, free of charge, to any person obtaining a copy
 *   of this software and associated documentation files (the "Software"), to deal
 *   in the Software without restriction, including without limitation the rights
 *   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *   copies of the Software, and to permit persons to whom the Software is
 *   furnished to do so, subject to the following conditions:
 *
 *   The above copyright notice and this permission notice shall be included in
 *   all copies or substantial portions of the Software.
 *
 *   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *   THE SOFTWARE.
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




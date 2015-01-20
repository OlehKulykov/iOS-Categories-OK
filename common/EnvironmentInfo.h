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
#import <UIKit/UIKit.h>
#import "iOS_Categories_OK_CommonHeader.h"

#ifndef __ENVIRONMENTINFO_H__
#define __ENVIRONMENTINFO_H__

/**
 @brief Checks for horizontal orientation.
 @param orientation interface orientation for checking.
 @return YES if orientation horizontal, othervice NO.
 */ 
IOS_CATEGORIES_OK_EXTERN BOOL isEnvironmentInfoHorizontalInteraceOrientation(const UIInterfaceOrientation orientation);


/**
 @brief Checks current interface orientation horizontal.
 @return YES if orientation horizontal, othervice NO.
 */ 
IOS_CATEGORIES_OK_EXTERN BOOL isEnvironmentInfoHorizontalCurrentInteraceOrientation();


/**
 @brief Checks user interface idiom is iPad.
 @return YES if iPad, othervice NO.
 */ 
IOS_CATEGORIES_OK_EXTERN BOOL isEnvironmentInfoIpad();


/**
 @brief Checks version of the operating system equal or greater than 7.0.
 @return YES if equal or greater than 7.0, othervice NO.
 */ 
IOS_CATEGORIES_OK_EXTERN BOOL isEnvironmentInfoIOS7OrUpper();


/**
 @brief Checks for execution on the iPhone 4 inch.
 @return YES if not iPad and screen resolution satisfies 4 inch, othervice NO.
 */ 
IOS_CATEGORIES_OK_EXTERN BOOL isEnvironmentInfoIPhone4Inch();


/**
 @brief Checks screen for Retina.
 @return YES if screen retina (mean scaling equal or greater 2.0), othervice NO.
 */ 
IOS_CATEGORIES_OK_EXTERN BOOL isEnvironmentInfoRetinaDisplay();

#endif /* __ENVIRONMENTINFO_H__ */


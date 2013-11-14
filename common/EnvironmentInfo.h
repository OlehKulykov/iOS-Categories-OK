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
#import <UIKit/UIKit.h>
#import "iOS_Categories_OK_CommonHeader.h"

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


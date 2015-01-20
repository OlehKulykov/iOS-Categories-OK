/*
 *   Copyright 2012 - 2015 Kulykov Oleh
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


#ifndef __IOS_CATEGORIES_OK_COMMONHEADER_H__
#define __IOS_CATEGORIES_OK_COMMONHEADER_H__

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#if defined(UIKIT_EXTERN)
#define IOS_CATEGORIES_OK_EXTERN UIKIT_EXTERN 
#elif defined(FOUNDATION_EXTERN)
#define IOS_CATEGORIES_OK_EXTERN FOUNDATION_EXTERN
#else
#ifdef __cplusplus
#define IOS_CATEGORIES_OK_EXTERN extern "C" 
#else
#define IOS_CATEGORIES_OK_EXTERN extern 
#endif
#endif



#if defined(NS_INLINE)
#define IOS_CATEGORIES_INLINE NS_INLINE 
#elif defined(CG_INLINE)
#define IOS_CATEGORIES_INLINE CG_INLINE 
#else
#define IOS_CATEGORIES_INLINE 
#endif


#endif


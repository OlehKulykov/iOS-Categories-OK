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


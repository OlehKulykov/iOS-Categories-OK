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
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@interface UIImageView (LoadFromURL)


/**
 @brief Loads image from URL in separate thread.
 @detailed Loads image from URL in separate thread using activity indicator, it's color and callback selectors
 @param url The image URL, should not be nil.
 @param isUseActivityIndicator The flag indication using of the activity inside this image view.
 @param activityIndicatorColor The color of the activity indicator or nil for default color.
 @param target Target object for sending events.
 @param onStartSelector Selector for indication start.
 @param onDoneSelector Selector for indication finishing loading.
 @result Thread object which used for loading or nil on error. If code compiled with non ARC this thread is autorelesable.
*/
- (NSThread *) loadFromURL:(NSURL *)url
	  useActivityIndicator:(BOOL)isUseActivityIndicator
	activityIndicatorColor:(UIColor *)activityIndicatorColor
				withTarget:(id)target
		   onStartSelector:(SEL)onStartSelector
			onDoneSelector:(SEL)onDoneSelector;



/**
 @brief Loads image from URL in separate thread.
 @detailed Loads image from URL in separate thread using activity indicator, it's color and callback selectors
 @param url The image URL, should not be nil.
 @param isUseActivityIndicator The flag indication using of the activity inside this image view.
 @param target Target object for sending events.
 @param onStartSelector Selector for indication start.
 @param onDoneSelector Selector for indication finishing loading.
 @result Thread object which used for loading or nil on error. If code compiled with non ARC this thread is autorelesable.
 */
- (NSThread *) loadFromURL:(NSURL *)url
	  useActivityIndicator:(BOOL)isUseActivityIndicator
				withTarget:(id)target
		   onStartSelector:(SEL)onStartSelector
			onDoneSelector:(SEL)onDoneSelector;

@end


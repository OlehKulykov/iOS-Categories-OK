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


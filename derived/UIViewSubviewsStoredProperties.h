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

typedef NS_ENUM (int32_t, UIViewSubviewStoredProperty) 
{
	UIViewSubviewStoredPropertyFrame = 1,
	UIViewSubviewStoredPropertyTag = 1 << 1,
	UIViewSubviewStoredPropertyHidden = 1 << 2,
	UIViewSubviewStoredPropertyAlpha = 1 << 3,
	UIViewSubviewStoredPropertyAutoresizingMask = 1 << 4
};

typedef NS_ENUM (int32_t, UIViewSubviewStoreStatePolicy) 
{
	UIViewSubviewStoreStatePolicyOnce = 1,
	UIViewSubviewStoreStatePolicyEveryTimeRewrite = 1 << 1,
};

@interface UIViewSubviewsStoredProperties : NSObject

- (UIViewSubviewStoredProperty) storedProperties;

- (UIViewSubviewStoreStatePolicy) storeStatePolicy;

- (void) setStoreStatePolicy:(const UIViewSubviewStoreStatePolicy) newPolicy;

- (void) storeHorizontal;

- (void) storeVertical;

- (void) storeForOrientation:(const UIInterfaceOrientation) orientation;

- (void) store;

- (void) restore;

- (void) restoreHorizontal;

- (void) restoreVertical;

- (void) restoreForOrientation:(const UIInterfaceOrientation) orientation;

- (id) initWithView:(UIView *) view subviews:(NSArray *) subviews andProperties:(const UIViewSubviewStoredProperty) properties;

- (id) initWithView:(UIView *) view andProperties:(const UIViewSubviewStoredProperty) properties;

- (id) initWithView:(UIView *) view;

- (void) cleanup;

- (void) setSubview:(UIView *) subview frame:(const CGRect) frame forOrientation:(const UIInterfaceOrientation) orientation;

@end

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


/**
 @brief Options for typing of the stored view properties.
 */
typedef NS_ENUM (int32_t, UIViewSubviewStoredProperty) 
{
	/**
	 @brief The option for indicating to store view frame.
	 */
	UIViewSubviewStoredPropertyFrame = 1,
	

	/**
	 @brief The option for indicating to store view tag.
	 */
	UIViewSubviewStoredPropertyTag = 1 << 1,
	
	
	/**
	 @brief The option for indicating to store view hidden state.
	 */
	UIViewSubviewStoredPropertyHidden = 1 << 2,
	
	
	/**
	 @brief The option for indicating to store view alpha value.
	 */
	UIViewSubviewStoredPropertyAlpha = 1 << 3,
	
	
	/**
	 @brief The option for indicating to store view autoresizing mask.
	 */
	UIViewSubviewStoredPropertyAutoresizingMask = 1 << 4
};


/**
 @brief Options for typing of the store policy.
 */
typedef NS_ENUM (int32_t, UIViewSubviewStoreStatePolicy) 
{
	/**
	 @brief With this option view properties stores only ones.
	 */
	UIViewSubviewStoreStatePolicyOnce = 1,
	
	
	/**
	 @brief With this option view properties rewrites each time.
	 */
	UIViewSubviewStoreStatePolicyEveryTimeRewrite = 1 << 1,
};


/**
 @brief Class for storing view subviews properties.
 @detailed Storing view subviews properties for horizontal and vertial orientations. You can manually setup view and store it's parameters. Usefull for multiple interface orientations with custom layout for each type of the orientation.
 */
@interface UIViewSubviewsStoredProperties : NSObject


/**
 @brief Get options of stored parameters.
 @return An integer bit mask with stored parameters for each subview.
 */
- (UIViewSubviewStoredProperty) storedProperties;


/**
 @brief Get option of the store policy.
 @return On of the UIViewSubviewStoreStatePolicy values.
 */
- (UIViewSubviewStoreStatePolicy) storeStatePolicy;


/**
 @brief Set store parameters policy.
 @detailed Set store parameters policy before storing states.
 @param newPolicy The integer bit mask with stored parameters.
 @example [... setStoreStatePolicy:UIViewSubviewStoredPropertyFrame | UIViewSubviewStoredPropertyTag];
 */
- (void) setStoreStatePolicy:(const UIViewSubviewStoreStatePolicy) newPolicy;


/**
 @brief Store horizontal subviews parameters.
 */
- (void) storeHorizontal;


/**
 @brief Store vertical subviews parameters.
 */
- (void) storeVertical;


/**
 @brief Store subviews parameters depends of the interface orientation.
 @param UIInterfaceOrientation The interface orientation for which store parameters.
 */
- (void) storeForOrientation:(const UIInterfaceOrientation) orientation;


/**
 @brief Store subviews parameters depends of the current interface orientation.
 */
- (void) store;


/**
 @brief Restore subviews parameters depends of the current interface orientation.
 */
- (void) restore;


/**
 @brief Restore subviews parameters for horizontal interface orientation.
 */
- (void) restoreHorizontal;


/**
 @brief Restore subviews parameters for vertical interface orientation.
 */
- (void) restoreVertical;


/**
 @brief Restore subviews parameters for interface orientation.
 @param orientation The interface orientation for which to restore params.
 */
- (void) restoreForOrientation:(const UIInterfaceOrientation) orientation;


/**
 @brief Initialize object with parent view, it's subviews and properties.
 @param view The parent view. Assigned as weak reference, so remove this object after using. Should not be nil.
 @param subviews The array with subviews for storing/restoring.
 @param properties The integer bit mask with properties for store.
 @return Initialized object or nil on error.
 */
- (id) initWithView:(UIView *) view subviews:(NSArray *) subviews andProperties:(const UIViewSubviewStoredProperty) properties;


/**
 @brief Initialize object with parent view and all view subviews and properties.
 @param view The parent view. Assigned as weak reference, so remove this object after using. Should not be nil.
 @param properties The integer bit mask with properties for store.
 @return Initialized object or nil on error.
 */
- (id) initWithView:(UIView *) view andProperties:(const UIViewSubviewStoredProperty) properties;


/**
 @brief Initialize object with parent view and all view subviews and all properties.
 @param view The parent view. Assigned as weak reference, so remove this object after using. Should not be nil.
 @return Initialized object or nil on error.
 */
- (id) initWithView:(UIView *) view;


/**
 @brief Removes all stored inforamation about parent view and stored properties.
 @detailed After calling this method next using of this object will do nothing.
 */
- (void) cleanup;


/**
 @brief Manual set subview frame.
 @detailed Set frame for subview for specific interface orientation. Prev. stroed value will be rewrited.
 @param subview The target subview.
 @param frame The frame of the subview.
 @param orientation The interface orientation for which store.
 */
- (void) setSubview:(UIView *) subview frame:(const CGRect) frame forOrientation:(const UIInterfaceOrientation) orientation;

@end

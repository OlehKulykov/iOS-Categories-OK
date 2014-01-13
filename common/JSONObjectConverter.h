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


/**
 @brief Class helper for getting values from JSON objects.
 @detailed Using for simple checking type and coresponding value from JSON objects. 
 */
@interface JSONObjectConverter : NSObject

/**
 @brief Get integer value from JSON object.
 @detailed Checking for nil and object type for getting value. 
 @param object from JSON parser.
 @return Integer value if object not nil and have type as NSNumber or NSString, othervice 0.
 */ 
+ (NSInteger) toInteger:(id) object;


/**
 @brief Get unsigned integer value from JSON object.
 @detailed Checking for nil and object type for getting value. In case if object is NSString getting integer value and casting to unsigned.
 @param object from JSON parser.
 @return Unsigned integer value if object not nil and have type as NSNumber or NSString, othervice 0.
 */ 
+ (NSUInteger) toUInteger:(id) object;


/**
 @brief Get float value from JSON object.
 @detailed Checking for nil and object type for getting value. In all cases getting double value and casting to float.
 @param object from JSON parser.
 @return Float value if object not nil and have type as NSNumber or NSString, othervice 0.0.
 */ 
+ (CGFloat) toFloat:(id) object;


/**
 @brief Get double value from JSON object.
 @detailed Checking for nil and object type for getting value.
 @param object from JSON parser.
 @return Float value if object not nil and have type as NSNumber or NSString, othervice 0.0.
 */ 
+ (double_t) toDouble:(id) object;


/**
 @brief Get boolean value from JSON object.
 @detailed Checking for nil and object type for getting value.
 @param object from JSON parser.
 @return Boolean value if object not nil and have type as NSNumber or NSString, othervice NO. In case if type is NSString trying compare with string "true".
 */ 
+ (BOOL) toBoolean:(id) object;


/**
 @brief Get string value from JSON object.
 @detailed Checking for object type for getting value.
 @param object from JSON parser.
 @return NSString value if object have type NSString, othervice nil.
 */ 
+ (NSString *) toString:(id) object;


/**
 @brief Get non empty string value from JSON object.
 @detailed Checking for object type for getting value.
 @param object from JSON parser.
 @return NSString value if have type NSString and it's lenght greater then zero, othervice nil.
 */ 
+ (NSString *) toNonEmptyString:(id) object;


/**
 @brief Get dictionary value from JSON object.
 @detailed Checking for object type for getting value.
 @param object from JSON parser.
 @return NSDictionary value if object have type NSDictionary or NSMutableDictionary, othervice nil.
 */ 
+ (NSDictionary *) toDictionary:(id) object;


/**
 @brief Get array value from JSON object.
 @detailed Checking for object type for getting value.
 @param object from JSON parser.
 @return NSArray value if object have type NSArray or NSMutableArray, othervice nil.
 */ 
+ (NSArray *) toArray:(id) object;


/**
 @brief Get date value from JSON object.
 @detailed Checking for object type for getting value.
 @param object from JSON parser.
 @return NSDate value if object have type NSString and date format satisfies next predefined formats:("yyyy-MM-dd'T'HH:mm:sszzzz", "yyyy-MM-dd'T'HH:mm:ssZ", "yyyy-MM-dd'T'HH:mm:ssTZD", "yyyy-MM-dd"), othervice nil.
 */ 
+ (NSDate *) toDate:(id) object;

@end



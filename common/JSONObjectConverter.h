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
 @brief Get integer 64 bit value from JSON object.
 @detailed Checking for nil and object type for getting value. 
 @param object from JSON parser.
 @return Integer 64 bit value if object not nil and have type as NSNumber or NSString, othervice 0.
 */ 
+ (int64_t) toInt64:(id) object;


/**
 @brief Get unsigned integer 64 bit value from JSON object.
 @detailed Checking for nil and object type for getting value. In case if object is NSString getting integer value and casting to unsigned.
 @param object from JSON parser.
 @return Unsigned integer 64 bit value if object not nil and have type as NSNumber or NSString, othervice 0.
 */ 
+ (uint64_t) toUInt64:(id) object;


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



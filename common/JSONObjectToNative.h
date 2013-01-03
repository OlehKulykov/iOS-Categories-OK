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


#import "Common+CategoryOKConfig.h"

#ifndef NO_JSONOBJECTTONATIVE_CATEGORY_OK

#import <Foundation/Foundation.h>

NSInteger JSONObjectToInteger(id object);

NSUInteger JSONObjectToUInteger(id object);

CGFloat JSONObjectToFloat(id object);

double JSONObjectToDouble(id object);

BOOL JSONObjectToBoolean(id object);

NSString * JSONObjectToString(id object);

NSDictionary * JSONObjectToDictionary(id object);

NSArray * JSONObjectToArray(id object);

NSDate * JSONObjectToDate(id object);

#endif


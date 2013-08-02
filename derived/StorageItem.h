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

@class StorageBase;

/**
 @brief Base class of item for linear storage.
 */
@interface StorageItem : NSObject

/**
 @brief Identifier of the item. 
 @return Unsinged indentifier of the item.
 */
- (unsigned long long) storageItemIdentifier;

/**
 @brief Parent storage object. 
 @detailed Pointer to the parent storage where item is stored.
 @return Storage object of nil.
 */
- (StorageBase *) parentStorage;

/**
 @brief Dictionary with basic information. 
 @detailed Mutable dictionary with information about the item. Use this method in subclasses to append basic info with yours.
 @return Pointer to mutable dictionary.
 */
- (NSMutableDictionary *) mutableDictionary;

/**
 @brief Initialize item object with info dictionary. 
 @detailed Initialize item object with info dictionary which was taken using mutableDictionary method.
 @param dictionary with basic information.
 @return Item object.
 */
- (id) initWithDictionary:(NSDictionary *) dictionary;

/**
 @brief Compare item with another item.
 @detailed Compare item with another item using item identifier.
 @param item pointer or nil to check.
 @return YES if objects not nill and identifiers is equal othervice NO.
 */
- (BOOL) isEqualToStorageItem:(StorageItem *) item;

/**
 @brief Generate new identifier.
 @return Unsigned identifier.
 */
+ (unsigned long long) generateIdentifier;

@end

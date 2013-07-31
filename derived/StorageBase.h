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
#import "StorageItem.h"

/**
 @brief Base class of linear storage items.
 @detailed Storage class for manipulating StorageItem's 
 */
@interface StorageBase : NSObject

/**
 @brief Checks is storage loaded.
 @return Yes if was successfully loaded othervice NO.
 */
- (BOOL) isLoaded;

/**
 @brief Checks is storage has no items.
 @return Yes if there is no items othervice NO.
 */
- (BOOL) isEmpty;

/**
 @brief Checks is storage has items.
 @return Yes if there is some items othervice NO.
 */
- (BOOL) isNotEmpty;

/**
 @brief Count of the items in storage.
 @return Number of stored items.
 */
- (NSUInteger) count;

/**
 @brief Get index of the item.
 @detailed While searching index of the item method doesn't checks item and storage ownership. For correct result you should overide method isEqual in your item class.
 @return Index of the item or NSNotFound if not found or item is nil.
 */
- (NSUInteger) storageItemIndex:(StorageItem *) item;

/**
 @brief Method for informing storage that the item was added.
 @detailed After implementing your own storage class you can be informed about adding item via this method. Default implementation do nothing so you can skip calling this of the super class.
 */
- (void) onAddedStorageItem:(StorageItem *) item;

/**
 @brief Adding new item to storage.
 @detailed Adding new not nil item to storage only ones, next adding the same item will do nothing.
 @return Yes if item not contained and successfully added, othervice NO.
 */
- (BOOL) addStorageItem:(StorageItem *) item;

/**
 @brief Method for informing storage that the item was removed.
 @detailed After implementing your own storage class you can be informed about removing item via this method. Default implementation do nothing so you can skip calling this of the super class.
 */
- (void) onRemovedStorageItem:(StorageItem *) item;

/**
 @brief Removing item from storage.
 @detailed Removing not nil item from storage.
 @return Yes if item contained and successfully removed, othervice NO.
 */
- (BOOL) removeStorageItem:(StorageItem *) item;


- (void) removeAllItems;

- (NSArray *) storageItems;

- (BOOL) load;

- (BOOL) save;

- (NSString *) storeFolderFullPath;

- (NSString *) storeFileFullPath;

/// Need to override
- (Class) storageClass;

/// Need to override
- (StorageItem *) createNewItemForDictionary:(NSDictionary *) dictionary;

+ (NSString *) storeFolderFullPathForClass:(Class) storageClass;

@end

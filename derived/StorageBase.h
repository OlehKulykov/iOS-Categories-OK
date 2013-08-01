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
 @param Item object.
 @return Index of the item or NSNotFound if not found or item is nil.
 */
- (NSUInteger) storageItemIndex:(StorageItem *) item;

/**
 @brief Method for informing storage that the item was added.
 @detailed After implementing your own storage class you can be informed about adding item via this method. Default implementation do nothing so you can skip calling this of the super class.
 @param Item object.
 */
- (void) onAddedStorageItem:(StorageItem *) item;

/**
 @brief Adding new item to storage.
 @detailed Adding new not nil item to storage only ones, next adding the same item will do nothing.
 @param Item object.
 @return Yes if item not contained and successfully added, othervice NO.
 */
- (BOOL) addStorageItem:(StorageItem *) item;

/**
 @brief Method for informing storage that the item was removed.
 @param Item object.
 @detailed After implementing your own storage class you can be informed about removing item via this method. Default implementation do nothing so you can skip calling this of the super class.
 */
- (void) onRemovedStorageItem:(StorageItem *) item;

/**
 @brief Removing item from storage.
 @detailed Removing not nil item from storage.
 @param Item object.
 @return Yes if item contained and successfully removed, othervice NO.
 */
- (BOOL) removeStorageItem:(StorageItem *) item;

/**
 @brief Remove all items from storage.
 @detailed Remove all items from storage. For each item will be called onRemovedStorageItem: method.
 */
- (void) removeAllItems;

/**
 @brief Get items array.
 @detailed Get all items array available on the storage.
 @return Array object contained all items or nil.
 */
- (NSArray *) storageItems;

/**
 @brief Loads stored items.
 @detailed Loads stored items from storeFileFullPath. You can call this method several times, but actual loading will be ones.
 @return YES if loaded othervice NO.
 */
- (BOOL) load;

/**
 @brief Saves stored items.
 @detailed Saves stored items to storeFileFullPath. 
 @return YES if saved othervice NO.
 */
- (BOOL) save;

/**
 @brief Getting full folder path for storing items info.
 @detailed Full path assigned for this storage. Depends on the class of the storage.
 @return String of the folder path for storing.
 */
- (NSString *) storeFolderFullPath;

/**
 @brief Getting full file path for storing items info.
 @detailed Full path of the file assigned for this storage. Depends on the class of the storage.
 @return String of the file path for storing.
 */
- (NSString *) storeFileFullPath;

/**
 @brief Getting Class of the overrided storage.
 @detailed Class of the overrided storage class. You should allways implement this method in subclasses.
 @return Class of the storage.
 */
- (Class) storageClass;

/**
 @brief Create new empty item for using with this storage.
 @detailed Create new empty item for using with this storage using base info as dictionary. You should allways implement this method in subclasses.
 @param Dictionary with item inforamation.
 @return New item object.
 */
- (StorageItem *) createNewItemForDictionary:(NSDictionary *) dictionary;

/**
 @brief Getting full folder path for storing.
 @detailed Full path assigned for this storage. Depends on the class.
 @param Class of the storage.
 @return String of the folder path for storing.
 */
+ (NSString *) storeFolderFullPathForClass:(Class) storageClass;

@end

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

@interface StorageBase : NSObject

- (BOOL) isLoaded;

- (BOOL) isEmpty;

- (BOOL) isNotEmpty;

- (NSUInteger) count;

/// NSNotFound - if not found
- (NSUInteger) storageItemIndex:(StorageItem *) item;

/// Can be overrided
- (void) onAddedStorageItem:(StorageItem *) item;

- (BOOL) addStorageItem:(StorageItem *) item;

- (void) onRemovedStorageItem:(StorageItem *) item;

- (BOOL) removeStorageItem:(StorageItem *) item;

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

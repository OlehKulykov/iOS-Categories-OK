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


#import "StorageBase.h"
#import "NSString+CategoryOK.h"
#import "NSDictionary+CategoryOK.h"
#import "NSArray+CategoryOK.h"
#import "NSData+CategoryOK.h"
#import "StorageItemPrivate.h"

#define STORAGE_LIST_ARRAY_KEY @"St0r@geL1stArr@y"

@interface StorageBase()
{
@private
	BOOL _isLoaded;
}

@property (strong) NSMutableArray * storageItemsArray;

@end


@implementation StorageBase

- (BOOL) isLoaded
{
	return _isLoaded;
}

- (BOOL) isEmpty
{
	return ([self count] == 0);
}

- (BOOL) isNotEmpty
{
	return ([self count] > 0);
}

- (NSUInteger) count
{
	return _storageItemsArray ? [_storageItemsArray count] : 0;
}

- (NSUInteger) storageItemIndex:(StorageItem *) item
{
	if (_storageItemsArray && item)
	{
		return [_storageItemsArray indexOfObject:item];
	}
	return NSNotFound;
}

- (void) onAddedStorageItem:(StorageItem *) item
{
	
}

- (BOOL) addStorageItem:(StorageItem *) item
{
	if (item)
	{
		NSUInteger count = 0;
		if (_storageItemsArray)
		{
			count = [_storageItemsArray count];
			[_storageItemsArray addObject:item];
		}
		else self.storageItemsArray = [NSMutableArray arrayWithObject:item];
		if (count != [_storageItemsArray count])
		{
			item.parentStorageObject = self;
			[self onAddedStorageItem:item];
			return YES;
		}
	}
	return NO;
}

- (void) onRemovedStorageItem:(StorageItem *) item
{
	
}

- (BOOL) removeStorageItem:(StorageItem *) item
{
	const NSUInteger index = [self storageItemIndex:item];
	if (index != NSNotFound)
	{
		const NSUInteger count = [_storageItemsArray count];
		[_storageItemsArray removeObjectAtIndex:index];
		if (count != [_storageItemsArray count])
		{
			item.parentStorageObject = nil;
			[self onRemovedStorageItem:item];
			return YES;
		}
	}
	return NO;
}

- (void) removeAllItems
{
	if (NSArrayIsNotEmpty(_storageItemsArray)) 
	{
		while ([_storageItemsArray count] > 0) 
		{
			StorageItem * item = [_storageItemsArray lastObject];
			item.parentStorageObject = nil;
			[_storageItemsArray removeLastObject];
		}
	}
}

- (NSArray *) storageItems
{
	return (NSArray *)_storageItemsArray;
}

- (BOOL) load
{
	if (_isLoaded) return YES;
	NSString * path = [self storeFileFullPath];
	if (!path) return NO;
	
	NSData * data = [NSData dataWithContentsOfFile:path];
	if (!data)
	{
		_isLoaded = YES;
		return YES;
	}
	
	if (data) 
	{
		NSDictionary * dict = [NSDictionary dictionaryWithPropertyListData:[NSData zipDecompressData:data]];
		if (!dict)
		{
			dict = [NSDictionary dictionaryWithPropertyListData:data];
		}
		
		if (dict)
		{
			NSArray * list = [dict objectForKey:STORAGE_LIST_ARRAY_KEY];
			if (NSArrayIsNotEmpty(list))
			{
				for (NSDictionary * d in list) 
				{
					[self addStorageItem:[self createNewItemForDictionary:d]];
				}
			}
			_isLoaded = YES;
			return YES;
		}
	}
	
	return NO;
}

- (BOOL) save
{
	NSString * path = [self storeFileFullPath];
	if (!path) return NO;
	
	if (NSArrayIsEmpty(_storageItemsArray))
	{
		[[NSFileManager defaultManager] removeItemAtPath:path error:nil];
		return YES;
	}
	else
	{
		NSMutableArray * array = [NSMutableArray arrayWithCapacity:[_storageItemsArray count]];
		for (StorageItem * item in _storageItemsArray) 
		{
			NSDictionary * d = [item mutableDictionary];
			if (d) [array addObject:d];
		}
		
		if ([array count] == [_storageItemsArray count])
		{
			NSDictionary * storeDict = [NSDictionary dictionaryWithObject:array forKey:STORAGE_LIST_ARRAY_KEY];
			if (storeDict) 
			{
				NSData * data = [NSData zipCompressData:[storeDict binaryPropertyListData] withRatio:1.0f];
				if (data)
				{
					return [data writeToFile:path atomically:YES];
				}
				else
				{
					return [storeDict writeToFile:path atomically:YES];
				}
			}
		}
	}
	return NO;
}

/// Need to override
- (Class) storageClass
{
	return nil;
}

- (StorageItem *) createNewItemForDictionary:(NSDictionary *) dictionary
{
	return dictionary ? [[StorageItem alloc] initWithDictionary:dictionary] : nil;
}

- (NSString *) storeFolderFullPath
{
	return [StorageBase storeFolderFullPathForClass:[self storageClass]];
}

- (NSString *) storeFileFullPath
{
	NSString * path = [self storeFolderFullPath];
	if (path)
	{
		return [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.storage", NSStringFromClass([self storageClass])]];
	}
	return nil;
}

+ (NSString *) storeFolderFullPathForClass:(Class) storageClass
{
	return storageClass ? [NSString storageDirFullPathForClass:storageClass] : nil;
}

@end

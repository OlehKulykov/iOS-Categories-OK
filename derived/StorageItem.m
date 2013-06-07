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


#import "StorageItem.h"
#import "StorageItemPrivate.h"
#import "MachTime.h"

#define ITEM_ID_KEY @"St0r@ge1tEm1dent1f1er"


@interface StorageItem()
{
@private
	unsigned long long _i;
}

@end

@implementation StorageItem

- (unsigned long long) storageItemIdentifier
{
	return _i;
}

- (StorageBase *) parentStorage
{
	return self.parentStorageObject;
}

- (NSMutableDictionary *) mutableDictionary
{
	return [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithUnsignedLongLong:_i], ITEM_ID_KEY, nil];
}

- (id) init
{
	self = [super init];
	if (self) 
	{
		_i = [MachTime machAbsoluteTime];
	}
	return self;
}

- (id) initWithDictionary:(NSDictionary *) dictionary
{
	self = [super init];
	if (self) 
	{
		if (dictionary)
		{
			NSNumber * num = [dictionary objectForKey:ITEM_ID_KEY];
			_i = num ? [num unsignedLongLongValue] : [MachTime machAbsoluteTime];
		}
		else
		{
			_i = [MachTime machAbsoluteTime];
		}
	}
	return self;
}

- (BOOL) isEqualToStorageItem:(StorageItem *) item
{
	return item ? (_i == item->_i) : NO;
}

- (BOOL) isEqual:(id)object
{
	if ([object isKindOfClass:[StorageItem class]]) 
	{
		return [self isEqualToStorageItem:(StorageItem *)object];
	}
	return [super isEqual:object];
}

- (NSString *) description
{
	return [NSString stringWithFormat:@"Item: %llu", _i];
}

- (NSString *) debugDescription
{
	return [NSString stringWithFormat:@"Item: %llu", _i];
}

@end

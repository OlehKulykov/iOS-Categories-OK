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


#import "NotificationManager.h"

#if !defined(__has_feature)
#define __has_feature(feature) 0
#endif

#if __has_feature(objc_arc)

#ifndef __ARC__
#define __ARC__
#endif

#endif


@interface NotificationManager()

@end

#define OBJECT_KEY @"n0t1f1c@Ti0N_0bjecT"

@implementation NotificationManager

- (void) dealloc
{
#ifndef __ARC__
	[super dealloc];
#endif	
}

+ (NSString *) notificationNameFromNumber:(int)notificationNumber
{
	return [NSString stringWithFormat:@"n0t1f1c@Ti0N_%i", notificationNumber];
}

+ (id) objectFromNotification:(NSNotification *)notification
{
	if (notification)
	{
		NSDictionary * userInfo = [notification userInfo];
		return userInfo ? [userInfo objectForKey:OBJECT_KEY] : nil;
	}
	return nil;
}

+ (void) sendNotificationNumber:(int)notificationNumber withObject:(id)object
{
	// sync not async
	dispatch_sync(dispatch_get_main_queue(), ^{
		[[NSNotificationCenter defaultCenter] postNotificationName:[NotificationManager notificationNameFromNumber:notificationNumber] 
															object:self
														  userInfo:object ? [NSDictionary dictionaryWithObject:object forKey:OBJECT_KEY] : nil];
	});
}

- (void) sendNotificationNumber:(int)notificationNumber withObject:(id)object
{
	[NotificationManager sendNotificationNumber:notificationNumber withObject:object];
}

+ (void) addListener:(id)listener 
		withSelector:(SEL)listenerSelector 
forNotificationNumber:(int)notificationNumber
{
	if (listener && listenerSelector)
	{
		if ([listener respondsToSelector:listenerSelector])
		{
			// sync not async
			dispatch_sync(dispatch_get_main_queue(), ^{
				[[NSNotificationCenter defaultCenter] addObserver:listener 
														 selector:listenerSelector
															 name:[NotificationManager notificationNameFromNumber:notificationNumber]
														   object:self];
			});
		}
	}
}

- (void) addListener:(id)listener withSelector:(SEL)listenerSelector forNotificationNumber:(int)notificationNumber
{
	[NotificationManager addListener:listener withSelector:listenerSelector forNotificationNumber:notificationNumber];
}

+ (void) removeListener:(id)listener
{
	if (listener)
	{
		// sync not async
		dispatch_sync(dispatch_get_main_queue(), ^{
			[[NSNotificationCenter defaultCenter] removeObserver:listener];
		});
	}
}

- (void) removeListener:(id)listener
{
	[NotificationManager removeListener:listener];
}

+ (void) removeListener:(id)listener forNotificationNumber:(int)notificationNumber
{
	if (listener)
	{
		// sync not async
		dispatch_sync(dispatch_get_main_queue(), ^{
			[[NSNotificationCenter defaultCenter] removeObserver:listener 
															name:[NotificationManager notificationNameFromNumber:notificationNumber]
														  object:self];
		});
	}
}

- (void) removeListener:(id)listener forNotificationNumber:(int)notificationNumber
{
	[NotificationManager removeListener:listener forNotificationNumber:notificationNumber];
}

static NotificationManager * _manager = nil;
+ (NotificationManager *) defaultManager
{
	if (!_manager)
	{
		_manager = [[super allocWithZone:NULL] init];
    }
    return _manager;
}

+ (void) releaseDefaultManager
{
	_manager = nil;
}

+ (id) allocWithZone:(NSZone *)zone
{
    return [self defaultManager];	
}

- (id) copyWithZone:(NSZone *)zone
{
    return self;
}

#ifndef __ARC__
- (id) retain
{
    return self;	
}

- (NSUInteger) retainCount
{
    return NSUIntegerMax;
}

- (void) release
{
	
}

- (id) autorelease
{
    return self;	
}
#endif

@end

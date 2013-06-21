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

+ (BOOL) sendNotificationNumber:(int)notificationNumber withObject:(id)object
{
	return [[NotificationManager defaultManager] sendNotificationNumber:notificationNumber withObject:object];
}

- (BOOL) sendNotificationNumber:(int)notificationNumber withObject:(id)object
{
	__block BOOL res = NO;
	// sync not async
	dispatch_sync(dispatch_get_main_queue(), ^{
		[[NSNotificationCenter defaultCenter] postNotificationName:[NotificationManager notificationNameFromNumber:notificationNumber] 
															object:self
														  userInfo:object ? [NSDictionary dictionaryWithObject:object forKey:OBJECT_KEY] : nil];
		res = YES;
	});
	return NO;
}

+ (BOOL) addListener:(id)listener 
		withSelector:(SEL)listenerSelector 
forNotificationNumber:(int)notificationNumber
{
	return [[NotificationManager defaultManager] addListener:listener withSelector:listenerSelector forNotificationNumber:notificationNumber];
}

- (BOOL) addListener:(id)listener withSelector:(SEL)listenerSelector forNotificationNumber:(int)notificationNumber
{
	__block BOOL res = NO;
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
				res = YES;
			});
		}
	}
	return res;
}

+ (BOOL) removeListener:(id)listener
{
	return [[NotificationManager defaultManager] removeListener:listener];
}

- (BOOL) removeListener:(id)listener
{
	__block BOOL res = NO;
	if (listener)
	{
		// sync not async
		dispatch_sync(dispatch_get_main_queue(), ^{
			[[NSNotificationCenter defaultCenter] removeObserver:listener];
			res = YES;
		});
	}
	return res;
}

+ (BOOL) removeListener:(id)listener forNotificationNumber:(int)notificationNumber
{
	return [[NotificationManager defaultManager] removeListener:listener forNotificationNumber:notificationNumber];
}

- (BOOL) removeListener:(id)listener forNotificationNumber:(int)notificationNumber
{
	__block BOOL res = NO;
	if (listener)
	{
		// sync not async
		dispatch_sync(dispatch_get_main_queue(), ^{
			[[NSNotificationCenter defaultCenter] removeObserver:listener 
															name:[NotificationManager notificationNameFromNumber:notificationNumber]
														  object:self];
			res = YES;
		});
	}
	return res;
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

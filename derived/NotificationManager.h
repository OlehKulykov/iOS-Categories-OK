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

/**
 @brief Custom notification manager.
 @detailed Wrapper arround NSNotificationCenter for easly controll notifications. All static methods using for prevent invokation of singleton.
 */
@interface NotificationManager : NSObject


/**
 @brief Staticaly sending notification by it's number.
 @detailed Send notification number in main queue. 
 @param notificationNumber Some integer number indicated notification. No need to store notification name string. You can use enum value for this parameter.
 @param object User defined object which will be sended with notification.
 @return Yes if was sended othervice NO.
 */
+ (BOOL) sendNotificationNumber:(int)notificationNumber withObject:(id)object;


/**
 @brief Sending notification by it's number.
 @detailed Send notification number in main queue. 
 @param notificationNumber Some integer number indicated notification. No need to store notification name string. You can use enum value for this parameter.
 @param object User defined object which will be sended with notification.
 @return Yes if was sended othervice NO.
 */
- (BOOL) sendNotificationNumber:(int)notificationNumber withObject:(id)object;


/**
 @brief Staticaly adds notification listener.
 @detailed Adds listener object with object selector for notification number.  
 @param listener object which will be informed about notification.
 @param listenerSelector selector of the listener object which will be invoked.
 @param notificationNumber notification number.
 @return Yes if was added othervice NO.
 */
+ (BOOL) addListener:(id)listener withSelector:(SEL)listenerSelector forNotificationNumber:(int)notificationNumber;


/**
 @brief Adds notification listener.
 @detailed Adds listener object with object selector for notification number.  
 @param listener object which will be informed about notification.
 @param listenerSelector selector of the listener object which will be invoked.
 @param notificationNumber notification number.
 @return Yes if was added othervice NO.
 */
- (BOOL) addListener:(id)listener withSelector:(SEL)listenerSelector forNotificationNumber:(int)notificationNumber;


/**
 @brief Staticaly remove listener object.
 @detailed Remove listener for all it's notifications
 @param listener object which will be informed about notification.
 @return Yes if was removed othervice NO.
 */
+ (BOOL) removeListener:(id)listener;


/**
 @brief Remove listener object.
 @detailed Remove listener for all it's notifications
 @param listener object which will be informed about notification.
 @return Yes if was removed othervice NO.
 */
- (BOOL) removeListener:(id)listener;


/**
 @brief Staticaly remove listener object for specific notification.
 @detailed Remove listener for specific notification.
 @param listener object which will be informed about notification.
 @param notificationNumber notification number.
 @return Yes if was added othervice NO.
 */
+ (BOOL) removeListener:(id)listener forNotificationNumber:(int)notificationNumber;


/**
 @brief Remove listener object for specific notification.
 @detailed Remove listener for specific notification.
 @param listener object which will be informed about notification.
 @param notificationNumber notification number.
 @return Yes if was added othervice NO.
 */
- (BOOL) removeListener:(id)listener forNotificationNumber:(int)notificationNumber;


/**
 @brief Get object which was sended with notification.
 @detailed Try to get object which was sended with notification using methods of the class.
 @param notification notification object which was received.
 @return Object if it's avaiable or nil.
 */
+ (id) objectFromNotification:(NSNotification *)notification;


/**
 @brief Get default singleton of the manager.
 @return Notification manager.
 */
+ (NotificationManager *) defaultManager;


/**
 @brief Releases default singleton of the manager.
 */
+ (void) releaseDefaultManager;


@end

/*
 *   Copyright 2012 Kulykov Oleh
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


#import "UIImageView+iOSAdditions.h"
#import <CoreFoundation/CoreFoundation.h>
#import "Common+iOSAdditionsPrecompiled.h"

#ifndef NO_UIImageViewLoadFromURL__IOSADDITIONS__

#define URL_KEY @"1"
#define IS_USE_INDICATOR_KEY @"2"
#define INDICATOR_VIEW_KEY @"3"
#define IMAGE_KEY @"4"
#define ON_START_INVOKATION_KEY @"5"
#define ON_DONE_INVOKATION_KEY @"6"

CG_INLINE NSInvocation * __UIImageViewLoadFromURLInvocation(UIImageView * imageView,
															id target,
															SEL selectr)
{
	NSMethodSignature * methodSig = [[target class] instanceMethodSignatureForSelector:selectr];
	NSInvocation * invocation = [NSInvocation invocationWithMethodSignature:methodSig];
	[invocation setSelector:selectr];
	[invocation setTarget:target];
	if ([methodSig numberOfArguments] > 2) [invocation setArgument:&imageView atIndex:2];
	return invocation;
}

@implementation UIImageView (LoadFromURL)

- (void) __UIImageViewLoadFromURLThreadStartMethod:(NSMutableDictionary *)params
{
	if ([params objectForKey:IS_USE_INDICATOR_KEY]) 
	{
		const CGRect selfFrame = [self frame];
		UIActivityIndicatorView * indicator = nil;
		if ((selfFrame.size.width >= 37.0f) && (selfFrame.size.height >= 37.0f))
			indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
		else
			indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
		
		if (indicator) 
		{
			[self addSubview:indicator];
			
			CGRect indicatorFrame = [indicator frame];
			indicatorFrame.origin.x = (selfFrame.size.width / 2.0f) - (indicatorFrame.size.width / 2.0f);
			indicatorFrame.origin.y = (selfFrame.size.height / 2.0f) - (indicatorFrame.size.height / 2.0f);
			[indicator setFrame:indicatorFrame];
			[indicator setHidden:NO];
			[indicator startAnimating];
			
			[params setObject:indicator forKey:INDICATOR_VIEW_KEY];
			SAFE_RELEASE(indicator);
		}
	}
	
	NSInvocation * invocation = [params objectForKey:ON_START_INVOKATION_KEY];
	if (invocation) 
	{
		[invocation invoke];
	}
}

- (void) __UIImageViewLoadFromURLThreadDoneMethod:(NSMutableDictionary *)params
{
	UIActivityIndicatorView * indicator = [params objectForKey:INDICATOR_VIEW_KEY];
	if (indicator) 
	{
		[indicator removeFromSuperview];
	}
	
	UIImage * image = [params objectForKey:IMAGE_KEY];
	if (image) 
	{
		[self setImage:image];
	}

	NSInvocation * invocation = [params objectForKey:ON_DONE_INVOKATION_KEY];
	if (invocation)
	{
		[invocation invoke];
	}
}

- (void) __UIImageViewLoadFromURLThreadMethod:(id)paramsObject
{
	@autoreleasepool 
	{
		NSMutableDictionary * params = (NSMutableDictionary *)paramsObject;
		dispatch_sync(dispatch_get_main_queue(), ^{
			[self __UIImageViewLoadFromURLThreadStartMethod:params];
		});
		
		NSURL * url = [params objectForKey:URL_KEY];
		if (url) 
		{
			NSData * data = [NSData dataWithContentsOfURL:url];
			if (data) 
			{
				UIImage * image = [UIImage imageWithData:data];
				if (image) [params setObject:image forKey:IMAGE_KEY];
			}
		}
		
		dispatch_sync(dispatch_get_main_queue(), ^{
			[self __UIImageViewLoadFromURLThreadDoneMethod:params];
		});
	}
}

- (NSThread *) loadFromURL:(NSURL *)url
	  useActivityIndicator:(BOOL)isUseActivityIndicator
				withTarget:(id)target
		   onStartSelector:(SEL)onStartSelector
			onDoneSelector:(SEL)onDoneSelector
{
	if ( !url ) return nil;
	
	NSMutableDictionary * params = [NSMutableDictionary dictionaryWithCapacity:6];
	if ( !params ) return nil;
	
	[params setObject:url forKey:URL_KEY];
	
	if (isUseActivityIndicator) 
	{
		[params setObject:[NSNumber numberWithBool:YES] forKey:IS_USE_INDICATOR_KEY];
	}
	
	if (target) 
	{
		if (onStartSelector) 
		{
			[params setObject:__UIImageViewLoadFromURLInvocation(self, target, onStartSelector) 
					   forKey:ON_START_INVOKATION_KEY];
		}
		if (onDoneSelector) 
		{
			[params setObject:__UIImageViewLoadFromURLInvocation(self, target, onDoneSelector)
					   forKey:ON_DONE_INVOKATION_KEY];
		}
	}
	
	NSThread * thread = SAFE_AUTORELEASE([[NSThread alloc] initWithTarget:self 
																 selector:@selector(__UIImageViewLoadFromURLThreadMethod:)
																   object:params]);
	[thread setThreadPriority:([[NSThread mainThread] threadPriority] / 2.0)];
	[thread start];
	return thread;
}

@end

#endif

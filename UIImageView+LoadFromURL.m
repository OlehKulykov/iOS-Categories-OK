

#import "UIImageView+LoadFromURL.h"
#import <CoreFoundation/CoreFoundation.h>

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

@implementation UIImageView(LoadFromURL1)

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
	
	NSThread * thread = [[NSThread alloc] initWithTarget:self 
												selector:@selector(__UIImageViewLoadFromURLThreadMethod:)
												  object:params];	
	[thread setThreadPriority:([[NSThread mainThread] threadPriority] / 2.0)];
	[thread start];
	return thread;
}

@end

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


#import "UIViewSubviewsStoredProperties.h"
#import "../common/EnvironmentInfo.h"
#import "../common/iOS_Categories_OK_CommonHeader.h"

#ifdef DEBUG
#undef DEBUG
#endif

#define IS_HOR_NOW (isEnvironmentInfoHorizontalCurrentInteraceOrientation())
#define IS_HOR(o) (isEnvironmentInfoHorizontalInteraceOrientation(o))

@interface UIViewSubviewStateInfoPrivate : NSObject
{
@private
	NSInteger _tag;
	UIViewAutoresizing _autoresizingMask;
	CGRect _frame;
	CGFloat _alpha;
	UIViewSubviewStoredProperty _storedStates;
	BOOL _isHidden;
}

@property NSUInteger identifier;

+ (NSUInteger) viewIdentifier:(UIView *) view;

@end

@implementation UIViewSubviewStateInfoPrivate

+ (NSUInteger) viewIdentifier:(UIView *) view
{
	union 
	{
		void * v; 
		NSUInteger i; 
	} u1;
	u1.v = (__bridge void *)view;
	return u1.i;
}

- (void) storeFrame:(const CGRect)f
{
	_frame = f;
	_storedStates |= UIViewSubviewStoredPropertyFrame;
}

- (void) storeAlpha:(const CGFloat)a
{
	_alpha = a;
	_storedStates |= UIViewSubviewStoredPropertyAlpha;
}

- (void) storeTag:(const NSInteger)t
{
	_tag = t;
	_storedStates |= UIViewSubviewStoredPropertyTag;
}

- (void) storeHidden:(const BOOL)ish
{
	_isHidden = ish;
	_storedStates |= UIViewSubviewStoredPropertyHidden;
}

- (void) storeAutoresizingMask:(const UIViewAutoresizing)am
{
	_autoresizingMask = am;
	_storedStates |= UIViewSubviewStoredPropertyAutoresizingMask;
}

- (void) restore:(UIView *) view
{
	if (_storedStates & UIViewSubviewStoredPropertyFrame) 
	{
		const UIViewAutoresizing am = [view autoresizingMask];
		[view setAutoresizingMask:UIViewAutoresizingNone];
		[view setFrame:_frame];
		[view setAutoresizingMask:am];
#ifdef DEBUG
		NSLog(@"SUBVIEW FRAME:%@", NSStringFromCGRect(_frame));
#endif		
	}
	if (_storedStates & UIViewSubviewStoredPropertyAlpha) [view setAlpha:_alpha];
	if (_storedStates & UIViewSubviewStoredPropertyTag) [view setTag:_tag];
	if (_storedStates & UIViewSubviewStoredPropertyHidden) [view setHidden:_isHidden];
	if (_storedStates & UIViewSubviewStoredPropertyAutoresizingMask) [view setAutoresizingMask:_autoresizingMask];
}

- (void) store:(UIView *) view states:(const UIViewSubviewStoredProperty) states
{
	_identifier = [UIViewSubviewStateInfoPrivate viewIdentifier:view];
	if (states & UIViewSubviewStoredPropertyFrame) [self storeFrame:[view frame]];
	if (states & UIViewSubviewStoredPropertyAlpha) [self storeAlpha:[view alpha]];
	if (states & UIViewSubviewStoredPropertyTag) [self storeTag:[view tag]];
	if (states & UIViewSubviewStoredPropertyHidden) [self storeHidden:[view isHidden]];
	if (states & UIViewSubviewStoredPropertyAutoresizingMask) [self storeAutoresizingMask:[view autoresizingMask]];
}

- (id) initWithView:(UIView *) view states:(UIViewSubviewStoredProperty) states
{
	self = [super init];
	if (self) 
	{
		[self store:view states:states];
	}
	return self;
}

@end

#define STATE_HOR_STORED ((int32_t)1)
#define STATE_VERT_STORED ((int32_t)(1 << 1))

@interface UIViewSubviewsStoredProperties()
{
@private
	UIViewSubviewStoredProperty _states;
	UIViewSubviewStoreStatePolicy _storeStatePolicy;
	int32_t _internalState;
}

@property (strong) NSMutableArray * hor;
@property (strong) NSMutableArray * vert;
@property (weak) UIView * view;

@end

@implementation UIViewSubviewsStoredProperties

- (UIViewSubviewStoredProperty) storedProperties
{
	return _states;
}

- (UIViewSubviewStoreStatePolicy) storeStatePolicy
{
	return _storeStatePolicy;
}

- (void) setStoreStatePolicy:(const UIViewSubviewStoreStatePolicy) newPolicy
{
	_storeStatePolicy = newPolicy;
}

static UIViewSubviewStateInfoPrivate * stateForSubviewFromArray(UIView * subview, NSMutableArray * arr)
{
	if (subview && arr)
	{
		const NSUInteger viewID = [UIViewSubviewStateInfoPrivate viewIdentifier:subview];
		for (UIViewSubviewStateInfoPrivate * info in arr)
		{
			if (viewID == [info identifier]) 
			{
				return info;
			}
		}
	}
	return nil;
}

IOS_CATEGORIES_INLINE BOOL isValidViewSubview(UIView * view, UIView * subview)
{
	if (view && subview) 
	{
		UIView * superView = [subview superview];
		if (superView) return [view isEqual:superView];
	}
	return NO;
}

- (void) setSubview:(UIView *) subview frame:(const CGRect) frame forOrientation:(const UIInterfaceOrientation) orientation
{
	UIView * v = self.view;
	if (isValidViewSubview(v, subview))
	{
		const BOOL isHorizontal = IS_HOR(orientation);
		UIViewSubviewStateInfoPrivate * info = stateForSubviewFromArray(subview, isHorizontal ? _hor : _vert);
		if (info)
		{
#ifdef DEBUG
			NSLog(@"SET %@ FRAME:%@", isHorizontal ? @"HOR" : @"VERT", NSStringFromCGRect(frame));
#endif			
			[info storeFrame:frame];
		}
	}
}

static void restoreFromArray(UIView * view, NSMutableArray * arr)
{
	uint32_t count = 0;
	NSArray * subviews = [view subviews];
	for (UIView * v in subviews) 
	{
		UIViewSubviewStateInfoPrivate * info = stateForSubviewFromArray(v, arr);
		if (info) 
		{
			[info restore:v]; 
			count++; 
		}
	}
	if (count) [view setNeedsLayout];
}

static void storeToArray(UIView * view, NSMutableArray * arr, const UIViewSubviewStoredProperty states)
{
	NSArray * subviews = [view subviews];
	for (UIView * v in subviews) 
	{
		UIViewSubviewStateInfoPrivate * info = stateForSubviewFromArray(v, arr);
		if (info)
		{
			[info store:v states:states];
		}
	}
}

IOS_CATEGORIES_INLINE BOOL isVerticalStored(const int32_t internalState)
{
	return (internalState & STATE_VERT_STORED) ? YES : NO;
}

IOS_CATEGORIES_INLINE BOOL isCanStoreVertical(const UIViewSubviewStoreStatePolicy storeStatePolicy, const int32_t internalState)
{
	if (storeStatePolicy & UIViewSubviewStoreStatePolicyEveryTimeRewrite) 
	{
		return YES;
	}
	else if (storeStatePolicy & UIViewSubviewStoreStatePolicyOnce)
	{
		return ( !isVerticalStored(internalState) );
	}
	return NO;
}

IOS_CATEGORIES_INLINE BOOL isHorizontalStored(const int32_t internalState)
{
	return (internalState & STATE_HOR_STORED) ? YES : NO;
}

IOS_CATEGORIES_INLINE BOOL isCanStoreHorizontal(const UIViewSubviewStoreStatePolicy storeStatePolicy, const int32_t internalState)
{
	if (storeStatePolicy & UIViewSubviewStoreStatePolicyEveryTimeRewrite) 
	{
		return YES;
	}
	else if (storeStatePolicy & UIViewSubviewStoreStatePolicyOnce)
	{
		return ( !isHorizontalStored(internalState) );
	}
	return NO;
}

- (void) storeHorizontal
{
	if (isCanStoreHorizontal(_storeStatePolicy, _internalState)) 
	{
#ifdef DEBUG
		NSLog(@"STORE HORIZONTAL STATES");
#endif	
		UIView * v = self.view;
		if (v)
		{
			storeToArray(v, _hor, _states);
		}
		_internalState |= STATE_HOR_STORED;
	}
}

- (void) storeVertical
{
	if (isCanStoreVertical(_storeStatePolicy, _internalState)) 
	{
#ifdef DEBUG
		NSLog(@"STORE VERTICAL STATES");
#endif			
		UIView * v = self.view;
		if (v)
		{
			storeToArray(v, _vert, _states);
		}
		_internalState |= STATE_VERT_STORED;
	}
}

- (void) storeForOrientation:(const UIInterfaceOrientation) orientation
{
	if (IS_HOR(orientation))
	{
		[self storeHorizontal]; 
	}
	else
	{
		[self storeVertical];
	}
}

- (void) store
{
	if (IS_HOR_NOW) 
	{
		[self storeHorizontal];
	} 
	else
	{
		[self storeVertical];
	}
}

- (void) restore
{
	if (IS_HOR_NOW)
	{
		[self restoreHorizontal];
	} 
	else
	{
		[self restoreVertical];
	}
}

- (void) restoreHorizontal
{
#ifdef DEBUG
	NSLog(@"RESTORE HORIZONTAL STATES");
#endif	
	UIView * v = self.view;
	if (v)
	{
		restoreFromArray(v, _hor);
	}
}

- (void) restoreVertical
{
#ifdef DEBUG
	NSLog(@"RESTORE VERTICAL STATES");
#endif	
	UIView * v = self.view;
	if (v)
	{
		restoreFromArray(v, _vert);
	}
}

- (void) restoreForOrientation:(const UIInterfaceOrientation) orientation
{
	if (IS_HOR(orientation)) 
	{
		[self restoreHorizontal]; 
	}
	else
	{
		[self restoreVertical];
	}
}

- (BOOL) uiViewSubviewsStatesAddInitWithSubviews:(NSArray *) subviews
{
	_storeStatePolicy = UIViewSubviewStoreStatePolicyOnce;
	UIView * v = self.view;
	if (v) 
	{
		if (!subviews) subviews = [v subviews];
		const NSUInteger count = [subviews count];
		NSMutableArray * horizontalArray = [NSMutableArray arrayWithCapacity:count];
		NSMutableArray * verticalArray = [NSMutableArray arrayWithCapacity:count];
		for (UIView * v in subviews) 
		{
			const NSUInteger viewID = [UIViewSubviewStateInfoPrivate viewIdentifier:v];
			UIViewSubviewStateInfoPrivate * info = [[UIViewSubviewStateInfoPrivate alloc] init];
			info.identifier = viewID;
			[horizontalArray addObject:info];
			info = [[UIViewSubviewStateInfoPrivate alloc] init];
			info.identifier = viewID;
			[verticalArray addObject:info];
		}		
		self.hor = horizontalArray;
		self.vert = verticalArray;
		return (([_hor count] == count) && ([_vert count] == count));
	}
	return NO;
}

- (id) initWithView:(UIView *) view subviews:(NSArray *) subviews andProperties:(const UIViewSubviewStoredProperty) properties
{
	if (view)
	{
		self = [super init];
		if (self) 
		{
			self.view = view;
			_states = properties;
			if ([self uiViewSubviewsStatesAddInitWithSubviews:subviews]) return self;
		}
	}
	return nil;
}

- (id) initWithView:(UIView *) view andProperties:(const UIViewSubviewStoredProperty) properties
{
	if (view)
	{
		self = [super init];
		if (self) 
		{
			self.view = view;
			_states = properties;
			if ([self uiViewSubviewsStatesAddInitWithSubviews:nil]) return self;
		}
	}
	return nil;
}

- (id) initWithView:(UIView *) view
{
	if (view)
	{
		self = [super init];
		if (self) 
		{
			self.view = view;
			_states = (UIViewSubviewStoredPropertyFrame | 
					   UIViewSubviewStoredPropertyTag | 
					   UIViewSubviewStoredPropertyHidden | 
					   UIViewSubviewStoredPropertyAlpha | 
					   UIViewSubviewStoredPropertyAutoresizingMask);
			if ([self uiViewSubviewsStatesAddInitWithSubviews:nil]) return self;
		}
	}
	return nil;
}

- (id) init
{
	return nil;
}

- (void) cleanup
{
	self.view = nil;
	self.hor = nil;
	self.vert = nil;
}

- (void) dealloc
{
	[self cleanup];
}

@end


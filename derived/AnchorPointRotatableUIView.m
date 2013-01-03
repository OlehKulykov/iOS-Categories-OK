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


#import "AnchorPointRotatableUIView.h"
#import <QuartzCore/QuartzCore.h>

@interface AnchorPointRotatableUIView()
{
@private
	CGPoint _initialCenter;
}

@end


@implementation AnchorPointRotatableUIView

- (void) rotateByAngle:(CGFloat)radianAngle withAnchorPoint:(CGPoint)anchorPoint
{
	CALayer * layer = [self layer];
	
	[layer setAffineTransform:CGAffineTransformIdentity];
	[layer setPosition:_initialCenter];
	
	const CGSize boundSize = layer.bounds.size;
	const CGPoint boundCenter = CGPointMake(boundSize.width / 2.0f, boundSize.height / 2.0f);
	
	CGPoint position = [layer position];
	
	[layer setAnchorPoint:CGPointMake(anchorPoint.x / boundSize.width, anchorPoint.y / boundSize.height)];
	[layer setAffineTransform:CGAffineTransformMakeRotation(radianAngle)];
	
	position.y += anchorPoint.y - boundCenter.y;
	position.x += anchorPoint.x - boundCenter.x;
	
	[layer setPosition:position];
}

- (void) setFrame:(CGRect)newFrame
{
	[super setFrame:newFrame];
	_initialCenter = [self center];
}

- (void) setCenter:(CGPoint)newCenter
{
	[super setCenter:newCenter];
	_initialCenter = [self center];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
	{
		_initialCenter = [self center];
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self) 
	{
		_initialCenter = [self center];
	}
	return self;
}

- (id) init
{
	self = [super init];
	if (self) 
	{
		_initialCenter = [self center];
	}
	return self;
}

@end

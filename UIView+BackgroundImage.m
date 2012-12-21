

#import "UIView+BackgroundImage.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (BackgroundImage)

- (void) setBackgroundImage:(UIImage *)backgroundImage
{
	CALayer * layer = [self layer];
	[layer setContents:(id)[backgroundImage CGImage]];
}

@end



#import <Foundation/Foundation.h>

@interface UIImageView(LoadFromURL1)

- (NSThread *) loadFromURL:(NSURL *)url
	  useActivityIndicator:(BOOL)isUseActivityIndicator
				withTarget:(id)target
		   onStartSelector:(SEL)onStartSelector
			onDoneSelector:(SEL)onDoneSelector;

@end

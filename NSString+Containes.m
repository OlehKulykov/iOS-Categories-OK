

#import "NSString+Containes.h"

@implementation NSString(Containes)

- (BOOL) isContainesSubstring:(NSString *)subString
{
	if (subString) 
	{
		NSRange r = [self rangeOfString:subString options:NSCaseInsensitiveSearch];
		return (r.location != NSNotFound) && (r.length != 0);
	}
	return NO;
}

@end

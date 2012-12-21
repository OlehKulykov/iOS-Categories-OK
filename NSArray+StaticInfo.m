

#import "NSArray+StaticInfo.h"

@implementation NSArray (StaticInfo)

+ (BOOL) isEmpty:(NSArray *)array
{
	return ([array count] == 0);
}

+ (BOOL) isNotEmpty:(NSArray *)array
{
	return ([array count] > 0);
}

+ (NSUInteger) array:(NSArray *)array previvousIndexFrom:(NSUInteger)index
{
	if (index > 0 && index < NSNotFound)
	{
		const NSUInteger prevIndex = index - 1;
		if (prevIndex < [array count])
		{
			return prevIndex;
		}
	}
	return NSNotFound;
}

+ (NSUInteger) array:(NSArray *)array nextIndexFrom:(NSUInteger)index
{
	const NSUInteger nextIndex = index + 1;
	if (nextIndex < [array count])
	{
		return nextIndex;
	}
	return NSNotFound;
}

@end

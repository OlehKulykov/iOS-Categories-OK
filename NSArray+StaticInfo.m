

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
	
}

+ (NSUInteger) array:(NSArray *)array nextIndexFrom:(NSUInteger)index
{
	
}

@end

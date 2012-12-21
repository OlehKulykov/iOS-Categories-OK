

#import <Foundation/Foundation.h>

@interface NSArray (StaticInfo)

+ (BOOL) isEmpty:(NSArray *)array;
+ (BOOL) isNotEmpty:(NSArray *)array;

+ (NSUInteger) array:(NSArray *)array previvousIndexFrom:(NSUInteger)index;
+ (NSUInteger) array:(NSArray *)array nextIndexFrom:(NSUInteger)index;

@end

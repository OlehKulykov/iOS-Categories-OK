

#import <Foundation/Foundation.h>

@interface NSArray (StaticInfo)

/// Check is array has none objects
+ (BOOL) isEmpty:(NSArray *)array;

/// Check is array has objects
+ (BOOL) isNotEmpty:(NSArray *)array;

/// Return previous array index from incoming or NSNotFound if index can't be found
+ (NSUInteger) array:(NSArray *)array previousIndexFrom:(NSUInteger)index;

/// Retun next array index from incoming  or NSNotFound if index can't be found
+ (NSUInteger) array:(NSArray *)array nextIndexFrom:(NSUInteger)index;

@end

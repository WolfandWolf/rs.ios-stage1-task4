#import <Foundation/Foundation.h>




@interface FullBinaryTrees : NSObject

@property(nonatomic, strong) FullBinaryTrees *left;
@property(nonatomic, strong) FullBinaryTrees *right;
@property(nonatomic, strong) NSNumber *val;

- (NSString *)stringForNodeCount:(NSInteger)count;

@end

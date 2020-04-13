#import "FullBinaryTrees.h"

@implementation FullBinaryTrees
- (NSString *)stringForNodeCount:(NSInteger)count {
    NSArray *resultArray = [self getFBT:count];
    NSString *result = [self parseArray:resultArray];
    
    return result;
}

- (NSArray *)getFBT:(NSInteger)count {
    NSMutableArray *resultArray = [NSMutableArray new];
    if (count == 1) {
        FullBinaryTrees *node = [FullBinaryTrees new];
        [resultArray addObject:node];
    }
    if (count % 2 == 1) {
        for (int counter = 0; counter < count; counter++) {
            NSArray *leftPart = [self getFBT:counter];
            for (FullBinaryTrees *leftCounter in leftPart) {
                NSArray *rightPart = [self getFBT:count - counter - 1];
                for (FullBinaryTrees *rightCounter in rightPart) {
                    FullBinaryTrees *initNode = [FullBinaryTrees new];
                    [initNode setValue:leftCounter forKey:@"left"];
                    [initNode setValue:rightCounter forKey:@"right"];
                    
                    [resultArray addObject:initNode];
                }
            }
        }
    }
    return resultArray;
}

- (NSString *)parseArray:(NSArray *)array {
    NSMutableArray *arr = [NSMutableArray new];
    
    for (FullBinaryTrees *node in array) {
        NSMutableArray<NSMutableArray*> *resArr = [NSMutableArray array];
        [self printNode:node onLevel:0 toArray:resArr];
        
        NSMutableArray *res = [NSMutableArray array];
        
        for (NSMutableArray *levelArr in resArr) {
            for (int i = 0; i < ceil((float)levelArr.count / 4); i++) {
                int from = i * 4;
                int to = (i + 1) * 4;
                NSRange range = NSMakeRange(from, to > levelArr.count ? levelArr.count - from : 4);
                NSArray *filterArr = [levelArr subarrayWithRange:range];
                
                NSPredicate* predicate = [NSPredicate predicateWithFormat:@"self isEqual: %@", @"0"];
                NSArray *nodesArray = [filterArr filteredArrayUsingPredicate:predicate];
                
                if (nodesArray.count > 0) {
                    NSString *levelStr = [levelArr componentsJoinedByString:@","];
                    [res addObject:levelStr];
                }
            }
        }
        
        NSArray *bstWithTrailingNulls = [[res componentsJoinedByString:@","] componentsSeparatedByString:@","];
        NSArray *bst = [self removeTrailingNulls:bstWithTrailingNulls];
        
        [arr addObject:[NSString stringWithFormat:@"[%@]", [bst componentsJoinedByString:@","]]];
    }
         
    NSString *res = [NSString stringWithFormat:@"[%@]", [arr componentsJoinedByString:@","]];
    
    return res;
}

- (NSArray *)removeTrailingNulls:(NSArray<NSArray *> *)bst {
    NSMutableArray *bstCopy = [bst mutableCopy];
        
    BOOL isHeadCleaned = NO;
    
    while(!isHeadCleaned) {
        NSString *node = bstCopy[0];
        
        if ([node isEqualToString:@"null"]) {
            [bstCopy removeObjectAtIndex:0];
        } else {
            isHeadCleaned = YES;
        }
    }
    
    BOOL isEndCleaned = NO;
    
    while(!isEndCleaned) {
        NSUInteger lastIndex = bstCopy.count - 1;
        NSString *node = bstCopy[lastIndex];
        
        if ([node isEqualToString:@"null"]) {
            [bstCopy removeObjectAtIndex:lastIndex];
        } else {
            isEndCleaned = YES;
        }
    }
    
    return bstCopy;
}

- (void)printNode:(FullBinaryTrees*)node onLevel:(int)treeLevel toArray:(NSMutableArray<NSMutableArray *> *)array {
    while (array.count <= treeLevel) {
        [array addObject:[NSMutableArray array]];
    }
    
    NSMutableArray *levelArray = array[treeLevel];
    
    if ([node isKindOfClass:[FullBinaryTrees class]]) {
        [levelArray addObject:@"0"];
        [self printNode:node.left onLevel:(treeLevel + 1) toArray:array];
        [self printNode:node.right onLevel:(treeLevel + 1) toArray:array];
    } else {
        [levelArray addObject:@"null"];
    }
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _val = @0;
        _left = nil;
        _right = nil;
    }
    return self;
}
@end

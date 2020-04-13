#import "SquareDecomposer.h"

@implementation SquareDecomposer
- (NSArray <NSNumber*>*)decomposeNumber:(NSNumber*)number {
    if ([number intValue] <= 0)
        return 0;
    NSMutableArray *result = [SquareDecomposer decompose:[number longValue] rest:[number longValue] * [number longValue]];
    if (result != nil) {
        if ([[result lastObject] longValue] == [number longValue]) {
            [result removeLastObject];
        }
        return result;
    }
    else {
        return 0;
    }
}

+ (NSMutableArray *)decompose:(long)number rest:(long)rest {
    if (rest == 0) {
        return [NSMutableArray arrayWithObject:[NSNumber numberWithLong:number]];
    }
    for (long int counter = number - 1; counter >= 1; counter--) {
        if (rest - (counter * counter) >= 0) {
            NSMutableArray *buffer = [SquareDecomposer decompose:counter rest:(rest - (counter * counter))];
            if (buffer != nil) {
                [buffer addObject:[NSNumber numberWithLong:number]];
                return buffer;
            }
        }
    }
    return nil;
}
@end

#import "ArrayCalculator.h"

@implementation ArrayCalculator
+ (NSInteger)maxProductOf:(NSInteger)numberOfItems itemsFromArray:(NSArray *)array {
    NSMutableArray *clearArray = [array mutableCopy];
    NSArray *sortedArray = [[NSArray alloc] init];
    NSInteger result = 1;
    for (NSObject *counter in array) {
        if ([counter isKindOfClass:[NSString class]]) {
            [clearArray removeObject:counter];
        }
    }
    if ([clearArray count] == 0)
        return 0;
    else if ([clearArray count] <= numberOfItems) {
        for (NSNumber *counter in clearArray) {
            result *= [counter intValue];
        }
        return result;
    }
    else {
        sortedArray = [clearArray sortedArrayUsingSelector:@selector(compare:)];
        NSMutableArray *copySortedArray = [sortedArray mutableCopy];
        int lenght = (int)[sortedArray count] - 1;
        int counter = (int)[sortedArray count] - 1;
        int amountOfNegative = 0;
        for (NSNumber *counter in sortedArray) {
            if ([counter intValue] < 0)
                amountOfNegative++;
        }
        for (counter = lenght; counter >= lenght / 2; counter-=2) {
            if ([sortedArray[lenght - counter] intValue] * -1 * [sortedArray[lenght - counter + 1] intValue] * -1 > [sortedArray[counter] intValue] * [sortedArray[counter - 1] intValue] && amountOfNegative > 1) {
                
                copySortedArray[lenght - counter] = [NSNumber numberWithInt:[copySortedArray[lenght - counter] intValue] * -1];
                copySortedArray[lenght - counter + 1] = [NSNumber numberWithInt:[copySortedArray[lenght - counter + 1] intValue] * -1];
                amountOfNegative -= 2;
            }
        }
        sortedArray = [copySortedArray sortedArrayUsingSelector:@selector(compare:)];
        for (counter = lenght; counter > lenght - numberOfItems; counter--) {
            result *= [sortedArray[counter] intValue];
        }
        return result;
    }
}
@end

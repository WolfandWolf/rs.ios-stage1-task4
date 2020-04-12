#import "TelephoneFinder.h"

@implementation TelephoneFinder
- (NSArray <NSString*>*)findAllNumbersFromGivenNumber:(NSString*)number {
    NSArray *collection = @[@[@"8"], @[@"2", @"4"], @[@"1", @"5", @"3"], @[@"2", @"6"], @[@"1", @"5", @"7"], @[@"2", @"4", @"8", @"6"], @[@"3", @"5", @"9"], @[@"4", @"8"], @[@"7", @"5", @"0", @"9"], @[@"8", @"6"]];
    NSMutableArray<NSString*> *result = [[NSMutableArray alloc] init];
    if ([number intValue] <= 0)
        return nil;
    else {
        for (int counterFirst = 0; counterFirst < [number length]; counterFirst++) {
            for (int counterSecond = 0; counterSecond < [collection count]; counterSecond++) {
                if ([number characterAtIndex:counterFirst] - 48 == counterSecond) {
                    for (int counterThird = 0; counterThird < [collection[counterSecond] count]; counterThird++) {
                        NSMutableString *buffer = [number mutableCopy];
                        [buffer replaceCharactersInRange:NSMakeRange(counterFirst, 1) withString:collection[counterSecond][counterThird]];
                        [result addObject:buffer];
                    }
                }
                    
            }
        }
        return result;
    }
}
@end

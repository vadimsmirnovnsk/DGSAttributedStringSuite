#import "DGSAttributedStringMaker.h"

@interface DGSAttributedStringMaker ()

@property (nonatomic, strong) NSMutableArray *mutableAttributedStrings;

@end

@implementation DGSAttributedStringMaker

#pragma mark Lifecycle

- (instancetype)init
{
    if (self = [super init]) {
        _mutableAttributedStrings = [NSMutableArray array];
    }
    return self;
}

#pragma mark Public

- (DGSAttributedString *(^)(NSString *))string
{
    return ^id(NSString *addingString){
        DGSAttributedString *newDGAttributedString = 
            [[DGSAttributedString alloc] initWithString:addingString];
        [self.mutableAttributedStrings addObject:newDGAttributedString];
        return newDGAttributedString;
    };
}

#pragma mark Getters

- (NSArray *)attributedStrings
{
    NSMutableArray *result = [NSMutableArray array];
    for (DGSAttributedString *dgsString in self.mutableAttributedStrings) {
        [result addObject:dgsString.resultString];
    }
    return [result copy];
}

@end

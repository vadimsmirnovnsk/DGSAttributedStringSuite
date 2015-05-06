#import "NSAttributedString+Make.h"
#import "DGSAttributedStringMaker.h"

@implementation NSAttributedString (Make)

+ (instancetype)dgs_makeString:(void(^)(DGSAttributedStringMaker *))block
{
    DGSAttributedStringMaker *maker = [DGSAttributedStringMaker new];
    block(maker);

    NSMutableAttributedString *resultString = [NSMutableAttributedString new];
    for (NSAttributedString *string in maker.attributedStrings)
	{
        [resultString appendAttributedString:string];
    }
    return ([[self class] isSubclassOfClass:[NSMutableAttributedString class]]) ? resultString : [resultString copy];
}

- (NSAttributedString *)dgs_stringByRemaking:(void (^)(DGSAttributedStringMaker *))block
{
    DGSAttributedStringMaker *maker = [DGSAttributedStringMaker new];
    block(maker);
    
    NSMutableAttributedString *resultString = [self mutableCopy];
    for (NSAttributedString *string in maker.attributedStrings)
	{
        [resultString appendAttributedString:string];
    }
    return [resultString copy];
}

@end

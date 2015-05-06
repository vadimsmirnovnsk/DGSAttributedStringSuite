#import "NSMutableAttributedString+Remake.h"

#import "DGSAttributedStringMaker.h"


@implementation NSMutableAttributedString (Remake)

- (void)dgs_remakeString:(void (^)(DGSAttributedStringMaker *))block
{
    DGSAttributedStringMaker *maker = [DGSAttributedStringMaker new];
    block(maker);
	
    for (NSAttributedString *string in maker.attributedStrings)
	{
        [self appendAttributedString:string];
    }
}

@end

#import <Foundation/Foundation.h>

@class DGSAttributedStringMaker;

@interface NSMutableAttributedString (Remake)

- (void)dgs_remakeString:(void(^)(DGSAttributedStringMaker *add))block;

@end

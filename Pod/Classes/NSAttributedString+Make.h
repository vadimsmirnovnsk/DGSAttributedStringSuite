#import <Foundation/Foundation.h>

@class DGSAttributedStringMaker;

@interface NSAttributedString (Make)

+ (instancetype)dgs_makeString:(void(^)(DGSAttributedStringMaker *add))block;
- (NSAttributedString *)dgs_stringByRemaking:(void(^)(DGSAttributedStringMaker *add))block;

@end

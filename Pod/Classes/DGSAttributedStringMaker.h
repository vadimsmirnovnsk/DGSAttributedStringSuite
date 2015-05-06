#import <Foundation/Foundation.h>
#import "DGSAttributedString.h"

@interface DGSAttributedStringMaker : NSObject

@property (nonatomic, copy, readonly) NSArray *attributedStrings;

- (DGSAttributedString * (^)(NSString *addingString))string;

@end

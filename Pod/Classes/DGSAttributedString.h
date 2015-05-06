#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface DGSAttributedString : NSObject

@property (nonatomic, copy, readonly) NSAttributedString *resultString;

- (instancetype)initWithString:(NSString *)string NS_DESIGNATED_INITIALIZER;

/*! Colors */
- (DGSAttributedString * (^)(UIColor *color))color;
- (DGSAttributedString * (^)(UIColor *color))backgroundColor;
- (DGSAttributedString * (^)(UIColor *color))strokeColor;
- (DGSAttributedString * (^)(UIColor *color))underlineColor;
- (DGSAttributedString * (^)(UIColor *color))strikeThroughColor;

/*! Lines */
- (DGSAttributedString * (^)(NSUnderlineStyle style))underlinedWithStyle;
- (DGSAttributedString * (^)(NSUnderlineStyle style))strikedThroughWithStyle;
- (DGSAttributedString * (^)(CGFloat width))strokeWidth;

/*! Font */
- (DGSAttributedString * (^)(UIFont *font))font;
- (DGSAttributedString * (^)(CGFloat size))fontSize;

/*! Text appearence */
- (DGSAttributedString * (^)(CGFloat offset))baselineOffset;
- (DGSAttributedString * (^)(CGFloat kern))kern;
- (DGSAttributedString * (^)(CGFloat expansion))expansion;
- (DGSAttributedString * (^)(NSUInteger combination))textDirection;

/*! Effects */
- (DGSAttributedString * (^)(NSShadow *shadow))shadow;
- (DGSAttributedString * (^)(BOOL enableLetterpressed))letterpressed;

/*! Misc */
- (DGSAttributedString * (^)(BOOL enableLigatures))ligatures;
- (DGSAttributedString * (^)(void))verticalGlyphForm;

/*! Link. (Can be type of NSURL or NSString) */
- (DGSAttributedString * (^)(id link))link;

/*! Just a syntax-sugar for linking all these methods */
- (DGSAttributedString *)with;
- (DGSAttributedString *)and;

@end

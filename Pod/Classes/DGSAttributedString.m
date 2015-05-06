#import "DGSAttributedString.h"

@interface DGSAttributedString ()

@property (nonatomic, strong, readwrite) NSMutableAttributedString *mutableAttributedString;

- (NSRange)range;

@end

@implementation DGSAttributedString

#pragma mark Lifecycle

- (instancetype)init
{
    return [self initWithString:@""];
}

- (instancetype)initWithString:(NSString *)string
{
    if (self = [super init])
	{
        _mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:string];
    }
    return self;
}

#pragma mark Public

// MARK: Color
- (DGSAttributedString *(^)(UIColor *))color
{
    return ^id (UIColor *color) {
        [self.mutableAttributedString addAttribute:NSForegroundColorAttributeName
											 value:color
											 range:self.range];
        return self;
    };
}

- (DGSAttributedString * (^)(UIColor *color))backgroundColor
{
	return ^id (UIColor *color) {
        [self.mutableAttributedString addAttribute:NSBackgroundColorAttributeName
											 value:color
											 range:self.range];
        return self;
    };
}

- (DGSAttributedString * (^)(UIColor *color))strokeColor
{
	return ^id (UIColor *color) {
        [self.mutableAttributedString addAttribute:NSStrokeColorAttributeName
											 value:color
											 range:self.range];
        return self;
    };
}

- (DGSAttributedString * (^)(UIColor *color))underlineColor
{
	return ^id (UIColor *color) {
        [self.mutableAttributedString addAttribute:NSUnderlineColorAttributeName
											 value:color
											 range:self.range];
        return self;
    };
}

- (DGSAttributedString * (^)(UIColor *color))strikeThroughColor
{
	return ^id (UIColor *color) {
        [self.mutableAttributedString addAttribute:NSStrikethroughColorAttributeName
											 value:color
											 range:self.range];
        return self;
    };
}

// MARK: Lines
- (DGSAttributedString * (^)(NSUnderlineStyle style))underlinedWithStyle
{
	return ^id (NSUnderlineStyle style) {
		[self.mutableAttributedString addAttribute:NSUnderlineStyleAttributeName
											 value:@(style)
											 range:self.range];
		return self;
	};
}

- (DGSAttributedString * (^)(NSUnderlineStyle style))strikedThroughWithStyle
{
	return ^id (NSUnderlineStyle style) {
		[self.mutableAttributedString addAttribute:NSStrikethroughStyleAttributeName
											 value:@(style)
											 range:self.range];
		return self;
	};
}

- (DGSAttributedString * (^)(CGFloat newStrokeWidth))strokeWidth
{
	return ^id (CGFloat strokeWidth) {
		[self.mutableAttributedString addAttribute:NSStrokeWidthAttributeName
											 value:@(strokeWidth)
											 range:self.range];
		return self;
	};
}

// MARK: Font
- (DGSAttributedString *(^)(UIFont *))font
{
    return ^id (UIFont *font) {
        [self.mutableAttributedString addAttribute:NSFontAttributeName
											 value:font
											 range:self.range];
        return self;
    };
}

- (DGSAttributedString * (^)(CGFloat))fontSize
{
	return ^id (CGFloat fontSize) {
		NSRange range = self.range;
		id attrs = [self.mutableAttributedString attributesAtIndex:0 effectiveRange:&range];
		UIFont *currentFont;

		if (attrs[NSFontAttributeName])
		{
			currentFont = attrs[NSFontAttributeName];
		}
		else
		{
			currentFont = [UIFont systemFontOfSize:fontSize];
		}

		[self.mutableAttributedString addAttribute:NSFontAttributeName
											 value:[currentFont fontWithSize:fontSize]
											 range:self.range];

		return self;
	};
}

// MARK: Text appearance
- (DGSAttributedString * (^)(CGFloat offset))baselineOffset
{
	return ^id (CGFloat offset) {
		[self.mutableAttributedString addAttribute:NSBaselineOffsetAttributeName
											 value:@(offset)
											 range:self.range];
		return self;
	};
}

- (DGSAttributedString * (^)(CGFloat kern))kern
{
	return ^id (CGFloat kern) {
		[self.mutableAttributedString addAttribute:NSKernAttributeName
											 value:@(kern)
											 range:self.range];
		return self;
	};
}

- (DGSAttributedString * (^)(CGFloat expansion))expansion
{
	return ^id (CGFloat expansion) {
		[self.mutableAttributedString addAttribute:NSExpansionAttributeName
											 value:@(expansion)
											 range:self.range];
		return self;
	};
}

- (DGSAttributedString * (^)(NSUInteger combination))textDirection
{
	return ^id (NSUInteger combination) {
		[self.mutableAttributedString addAttribute:NSWritingDirectionAttributeName
											 value:@[@(combination)]
											 range:self.range];
		return self;
	};
}

// MARK: Effects
- (DGSAttributedString * (^)(NSShadow *shadow))shadow
{
	return ^id (NSShadow *shadow) {
		NSRange range = self.range;
		id attrs = [self.mutableAttributedString attributesAtIndex:0 effectiveRange:&range];
		UIColor *currentColor;

		if (attrs[NSForegroundColorAttributeName])
		{
			currentColor = attrs[NSForegroundColorAttributeName];
		}
		else
		{
			currentColor = [UIColor blackColor];
		}
		NSShadow *localShadow;
		if(shadow)
		{
			localShadow = shadow;
		}
		else
		{
			localShadow = [[NSShadow alloc] init];
			UIColor *shadowColor = currentColor;
			[localShadow setShadowColor:shadowColor];
			[localShadow setShadowBlurRadius:3.0];
		}
		[self.mutableAttributedString addAttribute:NSShadowAttributeName
											 value:localShadow
											 range:self.range];
		return self;
	};
}

- (DGSAttributedString * (^)(BOOL enableLetterpressed))letterpressed
{
	return ^id (BOOL enableLetterpressed) {
		if (enableLetterpressed)
		{
			[self.mutableAttributedString addAttribute:NSTextEffectAttributeName
												 value:NSTextEffectLetterpressStyle
												 range:self.range];
		}
		else
		{
			[self.mutableAttributedString addAttribute:NSTextEffectAttributeName
												 value:@(0)
												 range:self.range];
		}
		return self;
	};
}

// MARK: Misc
- (DGSAttributedString * (^)(BOOL enableLigatures))ligatures
{
	return ^id (BOOL enableLigatures) {
		[self.mutableAttributedString addAttribute:NSLigatureAttributeName
											 value:enableLigatures ? @1 : @0
											 range:self.range];
		return self;
	};
}

- (DGSAttributedString * (^)(void))verticalGlyphForm
{
	return ^(void) {
		[self.mutableAttributedString addAttribute:NSVerticalGlyphFormAttributeName
											 value:@(1)
											 range:self.range];
		return self;
	};
}

// MARK: Link
- (DGSAttributedString * (^)(id link))link
{
	return ^(id link) {
		if ([link isKindOfClass:[NSURL class]] || [link isKindOfClass:[NSString class]])
		{
			[self.mutableAttributedString addAttribute:NSLinkAttributeName
												 value:link
												 range:self.range];
		}
		return self;
	};
}

// MARK: Syntax sugar
- (DGSAttributedString *)with
{
    return self;
}

- (DGSAttributedString *)and
{
    return self;
}

#pragma mark Getters
- (NSAttributedString *)resultString
{
    return self.mutableAttributedString.copy;
}

#pragma mark Inner
- (NSRange)range
{
    return (NSRange){0, self.mutableAttributedString.length};
}

@end

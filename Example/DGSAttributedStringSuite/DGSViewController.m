#import "DGSViewController.h"

#import <DGSAttributedStringSuite/DGSAttributedStringSuite.h>

@interface DGSViewController ()

@end

@implementation DGSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor lightGrayColor];

	// Create new mutable string.
	NSMutableAttributedString *mutableString = [NSMutableAttributedString dgs_makeString:^(DGSAttributedStringMaker *add)
	{
		add.string(@"Hello ").with.
			color([UIColor redColor]).
			strikedThroughWithStyle(NSUnderlineStyleDouble);
		add.string(@"bro! \n\n").
			underlinedWithStyle(NSUnderlineStyleSingle);
		add.string(@"Do you like this style of creation attributed strings?\n\n").
			letterpressed(YES);
	}];

	// Modify mutable string.
	[mutableString dgs_remakeString:^(DGSAttributedStringMaker *add) {
		add.string(@"Added ").with.
			strikedThroughWithStyle(NSUnderlineStyleDouble);
		add.string(@"string ").with.
			strokeWidth(1).and.
			color([UIColor darkTextColor]);
		add.string(@"by ").with.
			fontSize(7);
		add.string(@"remaking. ").with.
			fontSize(15).and.
			underlinedWithStyle(NSUnderlineStyleSingle);
	}];

	NSAttributedString *nonMutableString = [mutableString copy];

	// Remake string.
	NSAttributedString *remakedString =
		[nonMutableString dgs_stringByRemaking:^(DGSAttributedStringMaker *add) {
			add.string(@"\n\n Remaked!").with.
				shadow(nil);
		}];

	UILabel *testLabel = [[UILabel alloc] initWithFrame:self.view.bounds];
	testLabel.lineBreakMode = NSLineBreakByWordWrapping;
	testLabel.numberOfLines = 0;
	testLabel.attributedText = remakedString;
	testLabel.textAlignment = NSTextAlignmentCenter;
	[self.view addSubview:testLabel];
}

@end

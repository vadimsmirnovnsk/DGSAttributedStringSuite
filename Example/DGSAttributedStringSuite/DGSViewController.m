//
//  DGSViewController.m
//  DGSAttributedStringSuite
//
//  Created by Vadim Smirnov on 05/06/2015.
//  Copyright (c) 2014 Vadim Smirnov. All rights reserved.
//

#import "DGSViewController.h"

#import <DGSAttributedStringSuite/DGSAttributedStringSuite.h>

@interface DGSViewController ()

@end

@implementation DGSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor lightGrayColor];

	NSMutableAttributedString *newString = [NSMutableAttributedString dgs_makeString:^(DGSAttributedStringMaker *add)
	{
		add.string(@"Hello ").with.
			color([UIColor redColor]).
			strikedThroughWithStyle(NSUnderlineStyleDouble);
		add.string(@"bro! ").
			underlinedWithStyle(NSUnderlineStyleSingle);
		add.string(@"Mathafaka!!!").
			letterpressed(YES);
	}];

	NSAttributedString *remakedString =
		[newString dgs_stringByRemaking:^(DGSAttributedStringMaker *add) {
			add.string(@" Remaked!");
		}];

	UILabel *testLabel = [[UILabel alloc] initWithFrame:self.view.bounds];
	testLabel.attributedText = remakedString;
	[self.view addSubview:testLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

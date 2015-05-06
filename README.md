# DGSAttributedStringSuite

[![CI Status](http://img.shields.io/travis/Vadim Smirnov/DGSAttributedStringSuite.svg?style=flat)](https://travis-ci.org/Vadim Smirnov/DGSAttributedStringSuite)
[![Version](https://img.shields.io/cocoapods/v/DGSAttributedStringSuite.svg?style=flat)](http://cocoapods.org/pods/DGSAttributedStringSuite)
[![License](https://img.shields.io/cocoapods/l/DGSAttributedStringSuite.svg?style=flat)](http://cocoapods.org/pods/DGSAttributedStringSuite)
[![Platform](https://img.shields.io/cocoapods/p/DGSAttributedStringSuite.svg?style=flat)](http://cocoapods.org/pods/DGSAttributedStringSuite)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

With this library you can to create simply NSAttributedStrings by chaining strings with parameters.
Just look down.

```objective-c
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
```

## Requirements
iOS started from 7.0 version.

## Installation

DGSAttributedStringSuite is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "DGSAttributedStringSuite"
```

## Author

Vadim Smirnov, va.smirnov@2gis.ru

## License

DGSAttributedStringSuite is available under the MIT license. See the LICENSE file for more info.

//
//  CalendarTitleView.m
//  Sortime
//
//  Created by Calcifer on 15/11/30.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "CalendarTitleView.h"

@interface CalendarTitleView ()

@end

@implementation CalendarTitleView
- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self createSubviews];
		UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(titleTap)];
		[self addGestureRecognizer:tapGesture];
	}
	return self;
}

- (void)titleTap{
	NSLog(@"tap");
	if (self.titleTaped) {
		self.titleTaped();
	}
}

- (void)createSubviews {
	UILabel *titleLabel = [[UILabel alloc] init];
	[self addSubview:titleLabel];
	NSString *str = [NSString stringWithFormat:@"%d.%d.%d",[NSDate date].yearValue,[NSDate date].monthValue,[NSDate date].dayValue];
	titleLabel.text = str;
	titleLabel.textColor = [UIColor whiteColor];
	titleLabel.textAlignment = NSTextAlignmentCenter;
	[titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(self);
		make.centerY.equalTo(self.mas_centerY);
	}];
	self.titleLabel = titleLabel;
	
	UIButton *arrowButton = [UIButton new];
	UIImage *originArrow = [UIImage imageNamed:@"icon_today"];
	UIImage *downArrow = [originArrow imageRotatedByDegrees:180.0];
	[arrowButton setBackgroundImage:downArrow forState:UIControlStateNormal];
	arrowButton.size = arrowButton.currentImage.size;
	[self addSubview:arrowButton];
	[arrowButton mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(self.titleLabel.mas_right);
		make.centerY.equalTo(self.titleLabel.mas_centerY);
		make.right.equalTo(self.mas_right);
	}];
	self.arrowButton = arrowButton;
	self.arrowButton.hidden = YES;
	[arrowButton bk_whenTapped:^{
		NSLog(@"tap");
		if (self.titleTaped) {
			self.titleTaped();
		}
	}];
}

- (void)showLeftArrow {
	self.arrowButton.hidden = NO;
	UIImage *originArrow = [UIImage imageNamed:@"icon_today"];
	UIImage *leftArrow = [originArrow imageRotatedByDegrees:180.0];
	[self.arrowButton setBackgroundImage:leftArrow forState:UIControlStateNormal];;
}

- (void)showRightArrow {
	self.arrowButton.hidden = NO;
	UIImage *originArrow = [UIImage imageNamed:@"icon_today"];
	UIImage *rightArrow = originArrow;
	[self.arrowButton setBackgroundImage:rightArrow forState:UIControlStateNormal];;
}

- (void)hideArrow {
	self.arrowButton.hidden = YES;
}

- (void)layoutSubviews {
	
}


@end

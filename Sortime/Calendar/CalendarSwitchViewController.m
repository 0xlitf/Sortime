//
//  CalendarSwitchViewController.m
//  Sortime
//
//  Created by Calcifer on 15/11/29.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "CalendarSwitchViewController.h"

@implementation CalendarSwitchViewController

- (instancetype)init
{
	self = [super init];
	if (self) {
		[self createSubviews];
	}
	return self;
}

- (void)createSubviews {
	self.view.backgroundColor = [UIColor whiteColor];

	UILabel *title = [[UILabel alloc] init];
	NSString *timeStr = [NSString stringWithFormat:@"%d.%d.%d",[[NSDate date] yearValue],[[NSDate date] monthValue],[[NSDate date] dayValue]];
	title.text = timeStr;
	title.textAlignment = NSTextAlignmentCenter;
	title.font = [UIFont fontWithName:@"Helvetica" size:13];
	[self.view addSubview:title];
	[title mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerX.equalTo(self.view);
		make.top.equalTo(@50);
	}];
	
	UILabel *subTitle = [[UILabel alloc] init];
	NSString *describe = [NSString stringWithFormat:@"又是美好的一天，选择哪种视图更有味道？"];
	subTitle.text = describe;
	subTitle.textAlignment = NSTextAlignmentCenter;
	subTitle.font = [UIFont fontWithName:@"Helvetica" size:10];
	subTitle.textColor = [UIColor lightGrayColor];
	[self.view addSubview:subTitle];
	[subTitle mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerX.equalTo(self.view);
		make.top.equalTo(@80);
	}];
	
	UIButton *closeButton = [[UIButton alloc] init];
	closeButton.backgroundColor = [UIColor colorWithRed:0.969 green:0.969 blue:0.969 alpha:1.00];
	closeButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
	
	[closeButton setTitle:@"关闭" forState:UIControlStateNormal];
	[closeButton setTitleColor:kLightBlueColor forState:UIControlStateNormal];
	[closeButton bk_addEventHandler:^(id sender) {
		[self dismissViewControllerAnimated:YES completion:^{
			
		}];
	} forControlEvents:UIControlEventTouchUpInside];
	
	[self.view addSubview:closeButton];
	[closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
		make.bottom.left.right.equalTo(self.view);
		make.height.equalTo(@50);
	}];
	
	
	
}





-(void)viewWillAppear:(BOOL)animated{
	
}

-(UIStatusBarStyle)preferredStatusBarStyle{
	
	return UIStatusBarStyleLightContent;
}
@end

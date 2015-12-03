//
//  SettingViewController.m
//  Sortime
//
//  Created by Calcifer on 15/11/29.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "SettingViewController.h"

@implementation SettingViewController

- (instancetype)init
{
	self = [super init];
	if (self) {
		[self createNavigationBarButton];
		[self createSubviews];
	}
	return self;
}

- (void)createNavigationBarButton {
	
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]bk_initWithImage:[UIImage imageNamed:@"icon_save"] style:UIBarButtonItemStylePlain handler:^(id sender) {
		NSLog(@"RightBarButtonItem");
		[self.navigationController dismissViewControllerAnimated:YES completion:^{
			
		}];
	}];
	
	
}

- (void)createSubviews{
	self.view.backgroundColor = [UIColor whiteColor];
	
	
}

- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	
	[self.navigationController.navigationBar setBackgroundColor:[UIColor colorWithRed:0.349 green:0.678 blue:0.922 alpha:1.00]];
	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20)];
	view.backgroundColor = [UIColor colorWithRed:0.349 green:0.678 blue:0.922 alpha:1.00];
	view.origin = CGPointMake(0, -20);
	[self.navigationController.navigationBar addSubview:view];
}


@end

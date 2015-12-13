//
//  BaseViewController.m
//  Sortime
//
//  Created by Calcifer on 15/11/23.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end


@implementation BaseViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	
}

- (void)createBackBarButtonItem {
	UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
	[backButton setImage:[UIImage imageNamed:@"icon_backWhite"] forState:UIControlStateNormal];
	backButton.imageEdgeInsets = UIEdgeInsetsMake(0, -40, 0, 0);
	
	[backButton bk_addEventHandler:^(id sender) {
		[self.navigationController popViewControllerAnimated:YES];
	} forControlEvents:UIControlEventTouchUpInside];
	
	UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
	
	self.navigationItem.leftBarButtonItem = backBarButtonItem;

}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	
	self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
	self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
	
	[self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
	[self.navigationController.navigationBar setShadowImage:[UIImage new]];
	
	
	
	
	
	
}

-(void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	[self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
	[self.navigationController.navigationBar setShadowImage:nil];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
	return UIStatusBarStyleLightContent;
}
@end

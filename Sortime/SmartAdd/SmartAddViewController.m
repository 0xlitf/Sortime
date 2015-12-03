//
//  AddPlanViewController.m
//  Sortime
//
//  Created by Calcifer on 15/11/25.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "SmartAddViewController.h"
#import "SmartAddTitleView.h"

@interface SmartAddViewController()

@end

@implementation SmartAddViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	UIView *view = [UIView new];
	self.view = view;
	self.view.backgroundColor=[UIColor whiteColor];
	[self createSubviews];
	[self createBarButtonItem];
	
}

- (void)createSubviews{
	SmartAddTitleView *smartAddTitleView = [SmartAddTitleView new];
	[self.view addSubview:smartAddTitleView];
	[smartAddTitleView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.equalTo(self.view);
	}];
}

- (void)createBarButtonItem {
	UIBarButtonItem *doneButtonItem = [[UIBarButtonItem alloc] bk_initWithImage:[UIImage imageNamed:@"icon_save"] style:UIBarButtonItemStylePlain handler:^(id sender) {
		[self dismissViewControllerAnimated:YES completion:^{
			
		}];
	}];
	self.navigationItem.rightBarButtonItem = doneButtonItem;
	
	UIBarButtonItem *cancelButtonItem = [[UIBarButtonItem alloc] bk_initWithImage:[UIImage imageNamed:@"icon_popup_close"] style:UIBarButtonItemStylePlain handler:^(id sender) {
		[self dismissViewControllerAnimated:YES completion:^{
			
		}];
	}];
	self.navigationItem.leftBarButtonItem = cancelButtonItem;
}

- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	self.navigationItem.leftBarButtonItem.tintColor = [UIColor colorWithWhite:0.67 alpha:1];
	self.navigationItem.rightBarButtonItem.tintColor = [UIColor colorWithRed:0.000 green:0.480 blue:1.000 alpha:1.00];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden
{
	return YES;
}




@end

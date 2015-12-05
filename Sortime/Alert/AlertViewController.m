//
//  NotificationViewController.m
//  Sortime
//
//  Created by Calcifer on 15/11/23.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "AlertViewController.h"
#import "SegmentButtonView.h"
#import "AlertTableView.h"
#import "AddFriendViewController.h"

@interface AlertViewController ()
@property (nonatomic, weak) AlertTableView *alertTableView;
@property (nonatomic, weak) SegmentButtonView *segmentButtonView;
@end

@implementation AlertViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self createSubviews];
	
	
}

- (void)createSubviews {
	UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
	titleLabel.text = @"提醒";
	titleLabel.textColor = [UIColor whiteColor];
	titleLabel.font = [UIFont fontWithName:@"Helvetica" size:12];
	self.navigationItem.titleView = titleLabel;
	
	UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] bk_initWithImage:[UIImage imageNamed:@"icon_addFriend_tag"] style:UIBarButtonItemStylePlain handler:^(id sender) {
		NSLog(@"addFriend");
		
		
		AddFriendViewController *addFriendViewController = [AddFriendViewController new];
		[self.navigationController pushViewController:addFriendViewController animated:YES];

	}];
	self.navigationItem.rightBarButtonItem = rightBarButtonItem;

	
	SegmentButtonView *segmentButtonView = [SegmentButtonView new];
	[self.view addSubview:segmentButtonView];
	[segmentButtonView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(@64);
		make.left.right.equalTo(self.view);
		make.height.equalTo(@35);
	}];
	self.segmentButtonView = segmentButtonView;
	
	AlertTableView *alertTableView = [AlertTableView new];
	[self.view addSubview:alertTableView];
	[alertTableView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(segmentButtonView.mas_bottom);
		make.left.right.bottom.equalTo(self.view);
	}];
	self.alertTableView = alertTableView;
	
	
	
	
	
	
	
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle{
	return UIStatusBarStyleLightContent;
}

- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	
	[self.navigationController.navigationBar setBackgroundColor:kLightBlueColor];
	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20)];
	view.backgroundColor = kLightBlueColor;
	view.origin = CGPointMake(0, -20);
	[self.navigationController.navigationBar addSubview:view];
}

@end

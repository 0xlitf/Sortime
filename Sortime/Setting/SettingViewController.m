//
//  SettingViewController.m
//  Sortime
//
//  Created by Calcifer on 15/11/29.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingArrowModel.h"
#import "SettingGroup.h"


@interface SettingViewController()

@property (nonatomic, strong) UITableView *tableView;

@end


@implementation SettingViewController

- (instancetype)init
{
	self = [super init];
	if (self) {
		[self createNavigationBarButton];
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

- (void)viewDidLoad{
	[self addGroup0];
	[self addGroup1];
	[self addGroup2];
	[self addGroup3];
	[self addGroup4];
	[self addGroup5];
}

- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	
	[self.navigationController.navigationBar setBackgroundColor:kLightBlueColor];
	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20)];
	view.backgroundColor = kLightBlueColor;
	view.origin = CGPointMake(0, -20);
	[self.navigationController.navigationBar addSubview:view];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)addGroup0
{
	SettingArrowModel *pushNotice = [SettingArrowModel itemWithIcon:@"avatarPlaceholder" title:@"User" destinationViewController:nil];
	SettingGroup *group = [[SettingGroup alloc] init];
	group.models = @[pushNotice];
	[self.dataList addObject:group];
}


- (void)addGroup1
{
	SettingArrowModel *addFriends = [SettingArrowModel itemWithIcon:@"icon_addFriend_tag" title:@"添加好友" destinationViewController:nil];
	SettingArrowModel *friendsList = [SettingArrowModel itemWithIcon:@"icon_friendlist" title:@"好友列表" destinationViewController:nil];
	SettingArrowModel *scaning = [SettingArrowModel itemWithIcon:@"icon_scan" title:@"扫一扫" destinationViewController:nil];
	SettingGroup *group = [[SettingGroup alloc] init];
	group.models = @[addFriends,friendsList,scaning];
	[self.dataList addObject:group];
}

- (void)addGroup2
{
	SettingArrowModel *bindingPhone = [SettingArrowModel itemWithIcon:@"icon_addFriend_tag" title:@"绑定手机" destinationViewController:nil];
	SettingArrowModel *googleCalendar = [SettingArrowModel itemWithIcon:@"icon_friendlist" title:@"谷歌日历" destinationViewController:nil];
	SettingArrowModel *weChetAccount = [SettingArrowModel itemWithIcon:@"icon_scan" title:@"微信账号" destinationViewController:nil];
	SettingGroup *group = [[SettingGroup alloc] init];
	group.models = @[bindingPhone,googleCalendar,weChetAccount];
	[self.dataList addObject:group];
}

- (void)addGroup3
{
	SettingArrowModel *visableCalendar = [SettingArrowModel itemWithIcon:@"icon_addFriend_tag" title:@"可见日历" destinationViewController:nil];
	SettingArrowModel *viewSetting = [SettingArrowModel itemWithIcon:@"icon_friendlist" title:@"视图设置" destinationViewController:nil];
	SettingArrowModel *backgroundSetting = [SettingArrowModel itemWithIcon:@"icon_scan" title:@"背景设置" destinationViewController:nil];
	SettingArrowModel *alertSetting = [SettingArrowModel itemWithIcon:@"icon_scan" title:@"提醒设置" destinationViewController:nil];
	SettingGroup *group = [[SettingGroup alloc] init];
	group.models = @[visableCalendar,viewSetting,backgroundSetting,alertSetting];
	[self.dataList addObject:group];
}


- (void)addGroup4
{
	SettingArrowModel *needEvaluate = [SettingArrowModel itemWithIcon:@"icon_addFriend_tag" title:@"求好评" destinationViewController:nil];
	SettingArrowModel *feedback = [SettingArrowModel itemWithIcon:@"icon_friendlist" title:@"意见反馈" destinationViewController:nil];
	SettingArrowModel *about = [SettingArrowModel itemWithIcon:@"icon_scan" title:@"关于" destinationViewController:nil];
	SettingGroup *group = [[SettingGroup alloc] init];
	group.models = @[needEvaluate,feedback,about];
	[self.dataList addObject:group];
}

- (void)addGroup5
{
	return;
	SettingArrowModel *logOut = [SettingArrowModel itemWithIcon:@"icon_addFriend_tag" title:@"退出" destinationViewController:nil];
	SettingGroup *group = [[SettingGroup alloc] init];
	group.models = @[logOut];
	[self.dataList addObject:group];
}


- (UIStatusBarStyle)preferredStatusBarStyle {
	return UIStatusBarStyleLightContent;
}


@end

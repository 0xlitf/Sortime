//
//  CalendarViewController.m
//  Sortime
//
//  Created by Calcifer on 15/11/23.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "CalendarViewController.h"
#import "CalendarView.h"
#import "CalendarListView.h"
#import "SettingNavigationController.h"
#import "SettingViewController.h"
#import "CalendarSwitchViewController.h"
#import "CalendarListPageTableView.h"
#import "CalendarTitleView.h"

@interface CalendarViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) CalendarView *calendarView;
@property (nonatomic, assign)  NSInteger deltaDayValue;
@property (nonatomic, strong) CalendarTitleView *titleView;


@end

@implementation CalendarViewController

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"section：%ld，row：%ld",indexPath.section,(long)indexPath.row);
	
}

- (CalendarView *)calendarView {
	if (!_calendarView) {
		_calendarView = [[CalendarView alloc] init];
	}
	return _calendarView;
}


- (void)changeNavigationBarAlpha:(NSNotification*)notification{
	NSString *nameStr = [notification name];
	NSString *objectStr = [notification object];

	
	self.navigationController.navigationBar.alpha = [objectStr floatValue];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeNavigationBarAlpha:) name:@"changeNavigationBarAlpha" object:nil];
	
	
	[self.view addSubview:self.calendarView];
	[self.calendarView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.top.right.equalTo(self.view);
		make.bottom.equalTo(@(-49));
	}];
	[self createNavigationBarButton];
	WeakSelf(weakself);
	self.calendarView.listView.updateTitle = ^(NSInteger currentPage){
		[weakself updateTitleView:currentPage];
	};
	
	self.titleView.titleTaped = ^{
		[weakself.calendarView.listView.pageViewController setViewControllers:[NSArray arrayWithObject:weakself.calendarView.listView.todaylistPageController] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:^(BOOL finished) {
			
		}];
		weakself.calendarView.listView.deltaDayValue = 0;
		[weakself updateTitleView:0];
	};

	
	
}



- (void)updateTitleView:(NSInteger) currentPage {
	WeakSelf(weakself);
	
	weakself.deltaDayValue = currentPage;
	NSDate *today = [NSDate date];
	NSDate *currentPageDate = [today initWithTimeIntervalSinceNow:weakself.deltaDayValue * 24 *60 *60];
	NSString *str = [NSString stringWithFormat:@"%d.%d.%d",currentPageDate.yearValue,currentPageDate.monthValue,currentPageDate.dayValue];
	NSLog(@"%@",str);
	weakself.titleView.titleLabel.text = str;
	if (currentPage < 0) {
		[weakself.titleView showRightArrow];
		[UIView animateWithDuration:0.5 animations:^{
			weakself.titleView.arrowButton.alpha = 1;
		} completion:^(BOOL finished) {
		 
		}];
	}
	if (currentPage > 0) {
		[weakself.titleView showLeftArrow];
		[UIView animateWithDuration:0.5 animations:^{
			weakself.titleView.arrowButton.alpha = 1;
		} completion:^(BOOL finished) {
		 
		}];
	}
	if (currentPage == 0) {
		UIImage *originArrow = [UIImage imageNamed:@"icon_today"];
		UIImage *downArrow = [originArrow imageRotatedByDegrees:90.0];
		[UIView animateWithDuration:0.3 animations:^{
			
			[weakself.titleView.arrowButton setBackgroundImage:downArrow forState:UIControlStateNormal];
			weakself.titleView.arrowButton.alpha = 0;
		} completion:^(BOOL finished) {
			//				[weakself.titleView.arrowButton setImage:[UIImage imageNamed:@"icon_today"] forState:UIControlStateNormal];
		}];
	}
	
	
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
	
//	self.navigationController.navigationBar.alpha = 0;
//	[self.navigationController setNavigationBarHidden:YES];
	
	
	self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
	self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
	
}


- (void)createNavigationBarButton {
	
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] bk_initWithImage:[UIImage imageNamed:@"icon_settings"] style:UIBarButtonItemStyleDone handler:^(id sender) {
		NSLog(@"leftBarButtonItem");
		SettingViewController *settingViewController = [SettingViewController new];
		SettingNavigationController *settingNavigationController = [[SettingNavigationController alloc] initWithRootViewController:settingViewController];
		[self.navigationController presentViewController:settingNavigationController animated:YES completion:^{
			
		}];
		
	}];
	UIImage *originalImage =[UIImage imageNamed:@"icon_switch_default"];//原图缩小
	UIImage *scaledImage =
	[UIImage imageWithCGImage:[originalImage CGImage]
						scale:(originalImage.scale * 1.6)
				  orientation:(originalImage.imageOrientation)];
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]bk_initWithImage:scaledImage style:UIBarButtonItemStylePlain handler:^(id sender) {
		NSLog(@"RightBarButtonItem");
		CalendarSwitchViewController *calendarSwitchViewController = [CalendarSwitchViewController new];
		[self.navigationController presentViewController:calendarSwitchViewController animated:YES completion:^{
			
		}];
		
	}];
	
	CalendarTitleView *titleView = [[CalendarTitleView alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
	
	self.navigationItem.titleView = titleView;
	self.titleView = titleView;
	
}

- (void)dealloc{
	[[NSNotificationCenter defaultCenter] removeObserver:self];

}


@end

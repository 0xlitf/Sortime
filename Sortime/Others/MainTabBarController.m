//
//  MainTabBarController.m
//
//
//  Created by Calcifer on 15/11/23.
//
//

#import "MainTabBarController.h"
#import "MainTabBar.h"
#import "CalendarNavigationController.h"
#import "CalendarViewController.h"
#import "AleatNavigationController.h"
#import "AlertViewController.h"
#import "SmartAddNavigationController.h"
#import "SmartAddViewController.h"



@interface MainTabBarController ()
@end


@implementation MainTabBarController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self createTabBar];
	[self createSubviewControllers];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)createSubviewControllers {
	CalendarViewController *calendarViewController = [[CalendarViewController alloc] init];
	
	CalendarNavigationController *calenderNavigationController = [[CalendarNavigationController alloc] initWithRootViewController:calendarViewController];
	
	self.calendarViewController = calendarViewController;
	
	calenderNavigationController.title = @"日历";
	calenderNavigationController.tabBarItem.image = [UIImage imageNamed:@"TabItemCalendar"];
	calenderNavigationController.tabBarItem.selectedImage = [UIImage imageNamed:@"TabItemCalendarSelected"];
	AlertViewController *notificationViewController = [[AlertViewController alloc] init];
	
	AleatNavigationController *notificationNavigationController = [[AleatNavigationController alloc] initWithRootViewController:notificationViewController];
	notificationNavigationController.title = @"提醒";
	notificationNavigationController.tabBarItem.image = [UIImage imageNamed:@"TabItemMessage"];
	notificationNavigationController.tabBarItem.selectedImage = [UIImage imageNamed:@"TabItemMessageSelected"];
	
	self.viewControllers = @[calenderNavigationController,notificationNavigationController];
	self.selectedIndex = 0;
	
}

- (BOOL)tabBarController:(UITabBarController *)aTabBar
shouldSelectViewController:(UIViewController *)viewController
{
	return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
	NSLog(@"123");
}

- (void)createTabBar {
	CGRect tabBarRect = self.tabBar.frame;
	MainTabBar *mainTabBar = [[MainTabBar alloc] init];
	[self setValue:mainTabBar forKeyPath:@"tabBar"];
	mainTabBar.backgroundColor = [UIColor clearColor];
	mainTabBar.frame = tabBarRect;
	WeakSelf(weakself);
	mainTabBar.plusBtnClickBlock = ^{
		[weakself plusPresend];
	};
	
	
	
}

- (void)plusPresend {
	
	SmartAddViewController *smartAddViewController = [SmartAddViewController new];
	SmartAddNavigationController *smartAddNavigationController = [[SmartAddNavigationController alloc] initWithRootViewController:smartAddViewController];
	[self presentViewController:smartAddNavigationController animated:YES completion:^{
		NSLog(@"presentViewController");
	}];
	
}
@end

//
//  CalendarListView.m
//  Sortime
//
//  Created by Calcifer on 15/11/23.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "CalendarListView.h"
#import "CalendarListPageView.h"
#import "Masonry.h"
#import "UIView+Extension.h"
#import "CalendarListPageTableView.h"
#import "CalendarListPageWeatherView.h"
#import "CalendarListPageNoticeView.h"
#import "View+MASAdditions.h"
#import "CalendarListPageViewController.h"

@interface CalendarListView ()
@end

@implementation CalendarListView

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		
		[self createSubviews];
	}
	return self;
}

- (CalendarListPageViewController *)viewControllerAtIndex:(NSInteger)index {
	CalendarListPageViewController *child = [[CalendarListPageViewController alloc] init];
	child.deltaDayValue = index;
	return child;
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
	NSUInteger index = [(CalendarListPageViewController *)viewController deltaDayValue];
	self.currentlistPageController = (CalendarListPageViewController *)viewController;
	if (self.updateTitle) {
		self.updateTitle(index);
	}
	return [self viewControllerAtIndex:--index];
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
	NSUInteger index = [(CalendarListPageViewController *)viewController deltaDayValue];
	self.currentlistPageController = (CalendarListPageViewController *)viewController;
	if (self.updateTitle) {
		self.updateTitle(index);
	}
	return [self viewControllerAtIndex:++index];
}

-(void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed {
	if (completed) {
		
	}
}


- (void)createSubviews {
	self.deltaDayValue = 0;
	
	UIPageViewController *pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
	self.pageViewController = pageViewController;
	self.pageViewController.delegate = self;
	self.pageViewController.dataSource = self;
	[self addSubview:self.pageViewController.view];
	[self.pageViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.equalTo(self);
	}];
	
	CalendarListPageViewController *listPageController = [self viewControllerAtIndex:0];//[[CalendarListPageViewController alloc] init]
	self.todaylistPageController = listPageController;
	self.currentlistPageController = listPageController;
	
	[self.pageViewController setViewControllers:[NSArray arrayWithObject:listPageController] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
	[self.viewController addChildViewController:self.pageViewController];
	
	
	[self addSubview:self.pageViewController.view];
	[self.pageViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.equalTo(self);
	}];
	[self.pageViewController didMoveToParentViewController:self.viewController];
}

@end

//
//  CalendarListView.h
//  Sortime
//
//  Created by Calcifer on 15/11/23.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalendarListPageView.h"
#import "CalendarListPageViewController.h"

@class CalendarListPageView;

@interface CalendarListView : UIView<UIPageViewControllerDelegate,UIPageViewControllerDataSource>

@property (nonatomic, strong) NSArray *viewsArray;
@property (nonatomic, strong) UIPageViewController *pageViewController;

@property (nonatomic, assign) NSInteger deltaDayValue;

@property (nonatomic, strong) CalendarListPageViewController *todaylistPageController;
@property (nonatomic, strong) CalendarListPageViewController *currentlistPageController;

@property (nonatomic, copy) void (^updateTitle)(NSInteger currentPage);


@property (nonatomic, weak) UIPanGestureRecognizer *panGesture;
@end

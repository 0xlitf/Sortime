//
//  CalendarView.h
//  Sortime
//
//  Created by Calcifer on 15/11/23.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CalendarListView;
@class CalendarDayView;
@class CalendarWeekView;
@class CalendarMonthView;
@class CalendarCoverView;

@interface CalendarView : UIView
@property (nonatomic, strong) UIImageView *bgImage;
@property (nonatomic, strong) CalendarListView *listView;
@property (nonatomic, strong) CalendarDayView *dayView;
@property (nonatomic, strong) CalendarWeekView *weekView;
@property (nonatomic, strong) CalendarMonthView *monthView;
@property (nonatomic, strong) CalendarCoverView *coverView;
@end

//
//  CalendarView.m
//  Sortime
//
//  Created by Calcifer on 15/11/23.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "CalendarView.h"
#import "CalendarListView.h"
#import "CalendarDayView.h"
#import "CalendarWeekView.h"
#import "CalendarMonthView.h"
#import "CalendarCoverView.h"
#import "CalendarListPageTableView.h"
#import "CalendarListPageWeatherView.h"
#import "CalendarListPageNoticeView.h"
#import "Masonry.h"

@interface CalendarView ()

@property (nonatomic, strong) UIGestureRecognizer *gesture;

@end

@implementation CalendarView
- (instancetype)init {
	self = [super init];
	if (self) {
		[self createSubviews];
		
	}
	return self;
}
- (void)createSubviews {
	[self addSubview:self.bgImage];
	[self.bgImage mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.equalTo(self);
	}];
	[self addSubview:self.listView];
	[self.listView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(@64);
		make.left.bottom.right.equalTo(self);
	}];
//	
//	[self addSubview:self.dayView];
//	[self.dayView mas_makeConstraints:^(MASConstraintMaker *make) {
//		make.edges.equalTo(self);
//	}];
//	[self addSubview:self.monthView];
//	[self.monthView mas_makeConstraints:^(MASConstraintMaker *make) {
//		make.edges.equalTo(self);
//	}];
//	[self addSubview:self.weekView];
//	[self.weekView mas_makeConstraints:^(MASConstraintMaker *make) {
//		make.edges.equalTo(self);
//	}];
//	[self addSubview:self.coverView];
//	[self.coverView mas_makeConstraints:^(MASConstraintMaker *make) {
//		make.edges.equalTo(self);
//	}];
	
}



- (UIImageView *)bgImage {
	if (!_bgImage) {
		_bgImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CalendarListViewBg0"]];
	}
	return _bgImage;
}

-(CalendarListView *)listView {
	if (!_listView) {
		_listView = [CalendarListView new];
	}
	return _listView;
}

-(CalendarDayView *)dayView {
	if (!_dayView) {
		_dayView = [CalendarDayView new];
	}
	return _dayView;
}

-(CalendarMonthView *)monthView {
	if (!_monthView) {
		_monthView = [CalendarMonthView new];
	}
	return _monthView;
}

-(CalendarWeekView *)weekView {
	if (!_weekView) {
		_weekView = [CalendarWeekView new];
	}
	return _weekView;
}

-(CalendarCoverView *)coverView {
	if (!_coverView) {
		_coverView = [CalendarCoverView new];
	}
	return _coverView;
}



@end

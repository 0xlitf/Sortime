//
//  CalendarListPageTableView.m
//  Sortime
//
//  Created by Calcifer on 15/11/27.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "CalendarListPageTableView.h"
#import "CalendarListPageweatherView.h"
#import "CalendarListPageNoticeView.h"

@interface CalendarListPageTableView ()
@end

@implementation CalendarListPageTableView

- (instancetype)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		[self createSubviews];
		self.clipsToBounds = NO;
		self.backgroundColor = [UIColor clearColor];

	}
	return self;
}

- (void)createSubviews {
	UIView *weatherContentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 91)];//
	[self addSubview:weatherContentView];
	self.tableHeaderView = weatherContentView;
	
	CalendarListPageWeatherView *weatherView = [CalendarListPageWeatherView new];
	[weatherContentView addSubview:weatherView];
	[weatherView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self);
		make.left.right.equalTo(weatherContentView);
	}];
	self.weatherView = weatherView;
	
	
	
	CalendarListPageNoticeView *noticeView = [[CalendarListPageNoticeView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 1000)];
	[self addSubview:noticeView];
	self.noticeView = noticeView;
	self.tableFooterView = noticeView;
	noticeView.backgroundColor = [UIColor whiteColor];
	
}


@end

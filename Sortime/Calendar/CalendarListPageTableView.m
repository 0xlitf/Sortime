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
		self.showsVerticalScrollIndicator = NO;
		self.showsHorizontalScrollIndicator = NO;
		self.backgroundColor = [UIColor clearColor];
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadData) name:@"reloadTableViewData" object:nil];
	}
	return self;
}


-(void)dealloc {
	[[NSNotificationCenter defaultCenter] removeObserver:self];
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
	
	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 1)];
	[self addSubview:view];
	self.tableFooterView = view;
	
	
	CalendarListPageNoticeView *noticeView = [[CalendarListPageNoticeView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 1000)];
	[self addSubview:noticeView];
	self.noticeView = noticeView;
	
	noticeView.backgroundColor = [UIColor whiteColor];
	[noticeView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self.tableFooterView);
		make.left.right.equalTo(self);
		make.height.equalTo(@1000);
		make.width.equalTo(@(kScreenWidth));
	}];
}




@end

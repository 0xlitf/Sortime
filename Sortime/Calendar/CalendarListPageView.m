//
//  CalendarListPageView.m
//  Sortime
//
//  Created by Calcifer on 15/11/25.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "UIView+Extension.h"
#import "CalendarListPageView.h"
#import "CalendarListPageNoticeView.h"
#import "Masonry.h"
#import "CalendarListPageTableView.h"
#import "CalendarListPageWeatherView.h"

@interface CalendarListPageView ()

@end


@implementation CalendarListPageView

- (instancetype)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		self.backgroundColor = [UIColor clearColor];
		self.frame = frame;
		[self createPlanTableView];
		[self createBackgroundWeatherView];
		

		
	}
	return self;
}

- (void)createBackgroundWeatherView {
	UIView *backgroundWeatherView = [[UIView alloc] init];
	
	[self addSubview:backgroundWeatherView];
	[backgroundWeatherView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(@100);
		make.right.equalTo(self).offset(-30);
	}];
	
	UILabel *dateLabel = [UILabel new];
	dateLabel.textAlignment = NSTextAlignmentRight;
	dateLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
	dateLabel.text = @"2015年11月26日";
	dateLabel.textColor = [UIColor whiteColor];
	[backgroundWeatherView addSubview:dateLabel];
	[dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.left.right.equalTo(dateLabel.superview);
	}];
	
	UILabel *calendarLabel = [UILabel new];
	calendarLabel.textAlignment = NSTextAlignmentRight;
	calendarLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
	calendarLabel.text = @"农历";
	calendarLabel.textColor = [UIColor whiteColor];
	[backgroundWeatherView addSubview:calendarLabel];
	[calendarLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(dateLabel.mas_bottom);
		make.left.right.equalTo(calendarLabel.superview);
	}];
	
	UILabel *weekDayLabel = [UILabel new];
	weekDayLabel.textAlignment = NSTextAlignmentRight;
	weekDayLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
	weekDayLabel.text = @"星期日";
	weekDayLabel.textColor = [UIColor whiteColor];
	[backgroundWeatherView addSubview:weekDayLabel];
	[weekDayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(calendarLabel.mas_bottom);
		make.left.right.equalTo(weekDayLabel.superview);
	}];
	
	backgroundWeatherView.alpha = 0;
	self.backgroundWeatherView = backgroundWeatherView;
}

-(void)createPlanTableView {
	CalendarListPageTableView *planTableView = [[CalendarListPageTableView alloc] init];
	[self addSubview:planTableView];
	
	self.planTableView = planTableView;
	self.planTableView.separatorStyle = nil;
	[self.planTableView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(@0);
		make.left.right.equalTo(self);
		make.bottom.equalTo(self);
	}];
}

-(void)layoutSubviews {
	
}

@end

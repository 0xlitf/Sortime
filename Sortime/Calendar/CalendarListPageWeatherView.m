//
//  CalendarListPageWeatherView.m
//  Sortime
//
//  Created by Calcifer on 15/11/25.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "CalendarListPageWeatherView.h"
#import "Masonry.h"
#import "UIView+Extension.h"
#import "WeatherModel.h"


@interface CalendarListPageWeatherView ()



@end



@implementation CalendarListPageWeatherView


- (instancetype)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		[self createSubviews];
		
		
	}
	return self;
}


- (void)createSubviews {

	self.imageIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"没有数据"]];
	
	UIFont *font = [UIFont fontWithName:@"Helvetica Neue" size:12];
	
	self.imageIcon.size = self.imageIcon.image.size;
	self.dayLabel = [[UILabel alloc] init];
	self.dayLabel.textAlignment = NSTextAlignmentLeft;
	self.dayLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
	self.dayLabel.textColor = [UIColor whiteColor];
	self.calendarLabel = [[UILabel alloc] init];
	self.calendarLabel.textAlignment = NSTextAlignmentLeft;
	self.calendarLabel.font = font;
	self.calendarLabel.textColor = [UIColor whiteColor];
	self.weatherLabel = [[UILabel alloc] init];
	self.weatherLabel.textAlignment = NSTextAlignmentLeft;
	self.weatherLabel.font = font;
	self.weatherLabel.textColor = [UIColor whiteColor];
	self.locationLabel = [[UILabel alloc] init];
	self.locationLabel.textAlignment = NSTextAlignmentRight;
	self.locationLabel.font = font;
	self.locationLabel.textColor = [UIColor whiteColor];
	self.windLabel = [[UILabel alloc] init];
	self.windLabel.textAlignment = NSTextAlignmentRight;
	self.windLabel.font = font;
	self.windLabel.textColor = [UIColor whiteColor];
	self.pMLabel = [[UILabel alloc] init];
	self.pMLabel.textAlignment = NSTextAlignmentRight;
	self.pMLabel.font = font;
	self.pMLabel.textColor = [UIColor whiteColor];
	/*
	 @property (nonatomic, copy) NSString *cnty;//中国
	 @property (nonatomic, copy) NSString *city;//北京
	 @property (nonatomic, copy) NSString *wind_dir;//无持续风向
	 @property (nonatomic, copy) NSString *wind_sc;//微风
	 @property (nonatomic, copy) NSString *pm25;//pm2.5
	 @property (nonatomic, copy) NSString *tmp;//温度
	 */
	
	self.dayLabel.text = @"今天";
	self.calendarLabel.text = [NSString getChineseCalendarWithDate:[NSDate date]];
	self.weatherLabel.text = @"天气无数据";
	self.locationLabel.text = @"位置信息";
	self.windLabel.text = @"暂无数据";
	self.pMLabel.text = @"PM2.5 无数据";
	
	[self addSubview:self.imageIcon];
	[self addSubview:self.dayLabel];
	[self addSubview:self.calendarLabel];
	[self addSubview:self.weatherLabel];
	[self addSubview:self.locationLabel];
	[self addSubview:self.windLabel];
	[self addSubview:self.pMLabel];
	
	const int spacing = 7;
	[self.imageIcon mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(@10);
		make.left.equalTo(@7);
	}];
	[self.dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self.imageIcon.mas_top);
		make.left.equalTo(self.imageIcon.mas_right).with.offset(spacing);
	}];
	[self.calendarLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self.dayLabel.mas_bottom).with.offset(spacing);
		make.left.equalTo(self.imageIcon.mas_right).with.offset(spacing);
	}];
	[self.weatherLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self.calendarLabel.mas_bottom).with.offset(spacing);
		make.left.equalTo(self.imageIcon.mas_right).with.offset(spacing);
	}];
	
	[self.locationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self.dayLabel.mas_top);
		make.right.equalTo(self).with.offset(-spacing);
	}];
	[self.windLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self.calendarLabel.mas_top);
		make.right.equalTo(self).with.offset(-spacing);
	}];
	[self.pMLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self.weatherLabel.mas_top);
		make.right.equalTo(self).with.offset(-spacing);
	}];
	
}

//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
//
//	return YES;
//}




@end

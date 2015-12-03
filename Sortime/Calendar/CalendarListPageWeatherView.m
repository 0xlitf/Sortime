//
//  CalendarListPageWeatherView.m
//  Sortime
//
//  Created by Calcifer on 15/11/25.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "CalendarListPageWeatherView.h"
#import "CalendarListPageWeatherModel.h"
#import "Masonry.h"
#import "UIView+Extension.h"
@interface CalendarListPageWeatherView ()
@property (nonatomic, strong) UIImageView *imageIcon;
@property (nonatomic, strong) UILabel *locationLabel;
@property (nonatomic, strong) UILabel *windLabel;
@property (nonatomic, strong) UILabel *pMLabel;
@property (nonatomic, strong) UILabel *dayLabel;
@property (nonatomic, strong) UILabel *calendarLabel;
@property (nonatomic, strong) UILabel *weatherLabel;

@end



@implementation CalendarListPageWeatherView


- (instancetype)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		[self createSubviews];
	}
	return self;
}


- (void)createSubviews {
	CalendarListPageWeatherModel *model = [CalendarListPageWeatherModel new];
	self.imageIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:model.imageName]];
	
	UIFont *font = [UIFont fontWithName:@"Helvetica Neue" size:12];
	
	self.imageIcon.size = self.imageIcon.image.size;
	self.dayLabel = [[UILabel alloc] init];
	self.dayLabel.text = model.dayLabelStr;
	self.dayLabel.textAlignment = NSTextAlignmentLeft;
	self.dayLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
	self.dayLabel.textColor = [UIColor whiteColor];
	self.calendarLabel = [[UILabel alloc] init];
	self.calendarLabel.text = model.calendarLabelStr;
	self.calendarLabel.textAlignment = NSTextAlignmentLeft;
	self.calendarLabel.font = font;
	self.calendarLabel.textColor = [UIColor whiteColor];
	self.weatherLabel = [[UILabel alloc] init];
	self.weatherLabel.text = model.weatherLabelStr;
	self.weatherLabel.textAlignment = NSTextAlignmentLeft;
	self.weatherLabel.font = font;
	self.weatherLabel.textColor = [UIColor whiteColor];
	self.locationLabel = [[UILabel alloc] init];
	self.locationLabel.text = model.locationLabelStr;
	self.locationLabel.textAlignment = NSTextAlignmentRight;
	self.locationLabel.font = font;
	self.locationLabel.textColor = [UIColor whiteColor];
	self.windLabel = [[UILabel alloc] init];
	self.windLabel.text = model.windLabelStr;
	self.windLabel.textAlignment = NSTextAlignmentRight;
	self.windLabel.font = font;
	self.windLabel.textColor = [UIColor whiteColor];
	self.pMLabel = [[UILabel alloc] init];
	self.pMLabel.text = model.pMLabelStr;
	self.pMLabel.textAlignment = NSTextAlignmentRight;
	self.pMLabel.font = font;
	self.pMLabel.textColor = [UIColor whiteColor];
	
	
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

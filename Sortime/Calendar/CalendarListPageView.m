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
		
		
		UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureHandler:)];
		[panGesture setMinimumNumberOfTouches:1];

		[self.planTableView addGestureRecognizer:panGesture];
		self.panGesture = panGesture;
		
	}
	return self;
}


- (void)panGestureHandler:(UIPanGestureRecognizer *)sender {
	static double transitionOriginX;
	static double transitionOriginY;
	
	static double noticeViewY;
	static double planTableViewY;
	static double weatherViewY;
	static double backgroundWeatherViewY;
	
	typedef NS_ENUM (NSUInteger, PanDirection) {
		NoDirection,
		XDirection,
		YDirection,
	};
	static PanDirection dir;
	
	if (sender.state == UIGestureRecognizerStateBegan) {
		dir = NoDirection;
		
		transitionOriginX = [sender translationInView:self].x;
		transitionOriginY = [sender translationInView:self].y;
		
		noticeViewY = self.planTableView.noticeView.y;
		weatherViewY = self.planTableView.weatherView.y;
		planTableViewY = self.planTableView.y;
		backgroundWeatherViewY = self.backgroundWeatherView.y;
	}
	
	if (sender.state == UIGestureRecognizerStateChanged) {
		
		CGPoint translation = [sender translationInView:self];
		double translationX = translation.x;
		double translationY = translation.y;
		if (dir == NoDirection) {
			if (ABS(translationX - transitionOriginX) < ABS(translationY - transitionOriginY)) {
				dir = YDirection;
			}
			else{
				dir = XDirection;
			}
		}
		
		if (dir == XDirection) {
//			NSLog(@"XDirection");
			
		}
		
		if (dir == YDirection) {
//			NSLog(@"YDirection");
			double globalAlpha = 1 - ABS(self.planTableView.y - planTableViewY)/100;
			if (self.planTableView.y - planTableViewY > 0) {
				self.planTableView.alpha = globalAlpha;
				[self viewController].navigationController.navigationBar.alpha = globalAlpha;
				self.backgroundWeatherView.alpha = 1 - globalAlpha;
			}
			
			self.planTableView.y += translationY/2;
			self.planTableView.weatherView.y -= translationY/3;
			self.backgroundWeatherView.y -= translationY/6;
			
		}
		
		
		[sender setTranslation:CGPointZero inView:self];
	}
	
	if (sender.state == UIGestureRecognizerStateEnded) {
		dir = NoDirection;

		
		[UIView animateWithDuration:0.3 animations:^{
			self.planTableView.noticeView.y = noticeViewY;
			self.planTableView.weatherView.y = weatherViewY;
			self.backgroundWeatherView.y = backgroundWeatherViewY;
			self.planTableView.y = planTableViewY;
			
			self.planTableView.alpha = 1;
			self.planTableView.weatherView.alpha =1;
			self.planTableView.noticeView.alpha =1;
			[self viewController].navigationController.navigationBar.alpha = 1;
			self.backgroundWeatherView.alpha = 0;
			
			if (self.planTableView.noticeView.y - noticeViewY <= 0) {
				self.backgroundWeatherView.alpha = 0;
			}
		} completion:^(BOOL finished) {
		}];
	}
	
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

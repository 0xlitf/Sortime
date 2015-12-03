//
//  AleatTableView.m
//  Sortime
//
//  Created by Calcifer on 15/11/28.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "AlertTableView.h"

@interface AlertTableView()

@property (nonatomic, strong) UIView *noticeView;

@end

@implementation AlertTableView

- (instancetype)init{
	if (self = [super init]) {
		self.separatorStyle = nil;
		[self createSubviews];
	}
	return self;
}

- (void)createSubviews{
	UIView *noticeView = [UIView new];
	[self addSubview:noticeView];
	[noticeView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerX.equalTo(self.mas_centerX);
		make.centerY.equalTo(self.mas_centerY).with.offset(-70);
	}];
	self.noticeView = noticeView;
	
	UIImageView *noticeImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_blank"]];
	[self.noticeView addSubview:noticeImageView];
	noticeImageView.size = noticeImageView.image.size;
	[noticeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerX.equalTo(self.noticeView);
		make.centerY.equalTo(self.noticeView);
	}];
	
	UILabel *label = [UILabel new];
	label.text = @"没有收到消息哟";
	label.font = [UIFont fontWithName:@"Helvetica" size:12];
	label.textColor = [UIColor lightGrayColor];
	[self.noticeView addSubview:label];
	[label mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerX.equalTo(self.noticeView.mas_centerX);
		make.top.equalTo(noticeImageView.mas_bottom);
	}];
	
	
	
	
	
}


@end

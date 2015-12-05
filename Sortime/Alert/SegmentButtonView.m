//
//  SegmentButtonView.m
//  Sortime
//
//  Created by Calcifer on 15/11/28.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "SegmentButtonView.h"



@interface SegmentButtonView ()


@property (nonatomic, strong) UIButton *scheduleButton;
@property (nonatomic, strong) UIButton *friendInviteButton;

@end

@implementation SegmentButtonView

- (instancetype)init {
	if (self = [super init]) {
		[self createSubviews];
	}
	return self;
}

- (void)createSubviews {
	
	self.pageType = ScheduleType;
	
	
	UIView *lineView = [[UIView alloc] init];
	[self addSubview:lineView];
	lineView.backgroundColor = [UIColor lightGrayColor];
	[lineView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.bottom.right.equalTo(self);
		make.height.equalTo(@0.5);
	}];
	
	UIView *segmentlineView = [[UIView alloc] init];
	[self addSubview:segmentlineView];
	segmentlineView.backgroundColor = [UIColor lightGrayColor];
	[segmentlineView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerX.equalTo(self);
		make.centerY.equalTo(self);
		make.height.equalTo(@20);
		make.width.equalTo(@0.5);
	}];
	
	UIButton *scheduleButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[scheduleButton setTitle:@"日程安排" forState:UIControlStateNormal];
	[scheduleButton setTitleColor:kLightBlueColor forState:UIControlStateNormal];
	[self addSubview:scheduleButton];
	scheduleButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:12];
	[scheduleButton mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.top.equalTo(self);
		make.bottom.equalTo(lineView.mas_top);
		make.right.equalTo(segmentlineView.mas_left);
	}];
	self.scheduleButton = scheduleButton;
	
	UIButton *friendInviteButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[friendInviteButton setTitle:@"好友邀请" forState:UIControlStateNormal];
	[friendInviteButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
	[self addSubview:friendInviteButton];
	friendInviteButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:12];
	[friendInviteButton mas_makeConstraints:^(MASConstraintMaker *make) {
		make.right.top.equalTo(self);
		make.bottom.equalTo(lineView.mas_top);
		make.left.equalTo(segmentlineView.mas_right);
	}];
	self.friendInviteButton = friendInviteButton;
	
	
	
	[scheduleButton bk_addEventHandler:^(id sender) {
		NSLog(@"scheduleButton");
		self.pageType = ScheduleType;
		
		scheduleButton.selected = YES;
		friendInviteButton.selected = NO;
		[scheduleButton setTitleColor:kLightBlueColor forState:UIControlStateNormal];
		[friendInviteButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
		
	} forControlEvents:UIControlEventTouchUpInside];
	
	[friendInviteButton bk_addEventHandler:^(id sender) {
		NSLog(@"friendInviteButton");
		self.pageType = FriendInviteType;
		
		scheduleButton.selected = NO;
		friendInviteButton.selected = YES;
		
		[friendInviteButton setTitleColor:kLightBlueColor forState:UIControlStateNormal];
		[scheduleButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
		
	} forControlEvents:UIControlEventTouchUpInside];
	
	
	
	
	
	
	
	
	
	
}

@end

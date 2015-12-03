//
//  CalendarListPageNoticeView.m
//  Sortime
//
//  Created by Calcifer on 15/11/25.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "CalendarListPageNoticeView.h"
#import "UIView+Extension.h"
#import "Masonry.h"

@implementation CalendarListPageNoticeView

- (instancetype)initWithFrame:(CGRect)frame{
	if (self = [super initWithFrame:frame]) {
		
		[self createView];
	}
	return self;
}

- (void)createView{
	self.backgroundColor = [UIColor whiteColor];
	
	UIImageView *noticeImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_blank_today"]];
	[self addSubview:noticeImage];
	noticeImage.size = noticeImage.image.size;
	[noticeImage mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(@50);
		make.centerX.equalTo(self.mas_centerX);
	}];
	self.image = noticeImage;
	
	UILabel *noticeLabel = [UILabel new];
	noticeLabel.textColor = [UIColor grayColor];
	NSString *labelText = @"为今天的出行\n做一个完美的计划吧";
	noticeLabel.numberOfLines = 2;
	noticeLabel.font = [UIFont fontWithName:@"Helvetica" size:12];
	
	NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
	NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
	[paragraphStyle setLineSpacing:10];//调整行间距
	
	[attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
	noticeLabel.attributedText = attributedString;
	
	[self addSubview:noticeLabel];
	[noticeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(noticeImage.mas_bottom).with.offset(10);
		make.left.equalTo(noticeImage.mas_left);
	}];
	self.label = noticeLabel;
	
}

- (void)hideNotice{
	self.image.hidden = YES;
	self.label.hidden = YES;
}

- (void)showNotice{
	self.image.hidden = NO;
	self.label.hidden = NO;
}

@end

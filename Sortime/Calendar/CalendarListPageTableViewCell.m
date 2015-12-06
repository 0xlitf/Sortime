//
//  CalendarListPageTableViewCell.m
//  Sortime
//
//  Created by Calcifer on 15/11/28.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "CalendarListPageTableViewCell.h"

@interface CalendarListPageTableViewCell()

@property (nonatomic, weak) UIView *view;



@end


@implementation CalendarListPageTableViewCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		[self createSubviews];
		self.selectionStyle = UITableViewCellSelectionStyleNone;
	}
	return self;
	
}

- (void)createSubviews{
	UIView *view = [[UIView alloc] init];
	[self addSubview:view];
	[view mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.equalTo(self);
	}];
	self.view = view;
	UIView *colorView = [[UIView alloc] init];
	
	colorView.backgroundColor = kLightBlueColor;
	[self.view addSubview:colorView];
	[colorView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(@0);
		make.centerY.equalTo(self.mas_centerY);
		make.width.equalTo(@3);
		make.height.equalTo([NSNumber numberWithFloat:self.height/3]);
	}];
	self.colorView = colorView;
	
	UIView *imageContentView = [[UIView alloc] init];
	[self.view addSubview:imageContentView];
	[imageContentView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(@30);
		make.centerY.equalTo(self.mas_centerY);
	}];
	self.imageContentView = imageContentView;
	
	UIImageView *typeImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"calendar_dropview_icon_work"]];
	typeImage.size = typeImage.image.size;
	[self.imageContentView addSubview:typeImage];
	[typeImage mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerX.equalTo(imageContentView.mas_centerX);
		make.centerY.equalTo(imageContentView.mas_centerY);
	}];
	self.typeImage = typeImage;
	
	UILabel *startTimeLabel = [[UILabel alloc] init];
	startTimeLabel.text = @"13:00";
	startTimeLabel.font = [UIFont fontWithName:@"Helvetica" size:12];
	startTimeLabel.textColor = [UIColor blackColor];
	[self.view addSubview:startTimeLabel];
	[startTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(@60);
		make.bottom.equalTo(self.view.mas_centerY);
	}];
	self.startTimeLabel = startTimeLabel;
	
	
	UILabel *endTimeLabel = [[UILabel alloc] init];
	endTimeLabel.text = @"14:00";
	endTimeLabel.font = [UIFont fontWithName:@"Helvetica" size:12];
	endTimeLabel.textColor = [UIColor blackColor];
	[self.view addSubview:endTimeLabel];
	[endTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(@60);
		make.top.equalTo(self.view.mas_centerY);
	}];
	self.endTimeLabel = endTimeLabel;
	
	
	UILabel *contentLabel = [[UILabel alloc] init];
	contentLabel.text = @"早睡早起";
	contentLabel.font = [UIFont fontWithName:@"Helvetica" size:12];
	contentLabel.textColor = [UIColor blackColor];
	[self.view addSubview:contentLabel];
	[contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(@100);
		make.right.equalTo(self.view);
		make.centerY.equalTo(self.view.mas_centerY);
	}];
	self.contentLabel = contentLabel;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

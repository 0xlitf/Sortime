//
//  SmartAddTitleView.m
//  Sortime
//
//  Created by Calcifer on 15/11/26.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "SmartAddTitleView.h"
@interface SmartAddTitleView ()

@end


@implementation SmartAddTitleView

- (instancetype)init {
	if (self = [super init]) {
		[self createSubviews];
	}
	return self;
}

- (void)createSubviews {
	[self createTitleView];
	[self createDetailView];
	[self createVoiceInputView];
	
	
}

- (void)createTitleView {
	//titleView
	UIView *titleView = [UIView new];
	titleView.backgroundColor = kLightBlueColor;
	[self addSubview:titleView];
	[titleView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(@44);
		make.left.right.equalTo(self);
		make.height.equalTo(@60);
	}];
	
	UIView *titleImageView = [UIView new];
	titleImageView.backgroundColor = [UIColor clearColor];
	[titleView addSubview:titleImageView];
	[titleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.left.bottom.equalTo(titleView);
		make.width.equalTo(titleView.mas_height);
	}];
	
	UIImageView *kindView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_work"]];
	kindView.size = kindView.image.size;
	[titleImageView addSubview:kindView];
	[kindView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.center.equalTo(kindView.superview);
	}];
	
	UIView *triangleContentView = [UIView new];
	[titleImageView addSubview:triangleContentView];
	[triangleContentView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.equalTo(kindView);
	}];
	
	UIImageView *selectedTriangle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_triangle_selected"]];
	selectedTriangle.size = selectedTriangle.image.size;
	[triangleContentView addSubview:selectedTriangle];
	[selectedTriangle mas_makeConstraints:^(MASConstraintMaker *make) {
		make.right.bottom.equalTo(selectedTriangle.superview);
	}];
	
	UIImageView *unselectedTriangle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_triangle"]];
	unselectedTriangle.size = unselectedTriangle.image.size;
	[triangleContentView addSubview:unselectedTriangle];
	[unselectedTriangle mas_makeConstraints:^(MASConstraintMaker *make) {
		make.right.bottom.equalTo(unselectedTriangle.superview);
	}];
	
	
	UITextField *titleTextField = [UITextField new];
	titleTextField.backgroundColor = [UIColor clearColor];
	[titleView addSubview:titleTextField];
	titleTextField.tag = 3;
	[titleTextField mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(titleImageView.mas_right).with.offset(5);
		make.right.equalTo(titleView);
		make.centerY.equalTo(titleView.mas_centerY);
	}];
	titleTextField.text = @"";
	titleTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
	self.titleTextField = titleTextField;
	
	self.titleView = titleView;
}

- (void)createDetailView {
	//detailView
	UIView *detailView = [UIView new];
	detailView.backgroundColor = [UIColor colorWithRed:0.961 green:0.973 blue:0.980 alpha:1.00];
	[self addSubview:detailView];
	[detailView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self.titleView.mas_bottom);
		make.left.right.equalTo(self);
		make.height.equalTo(@211.5);
	}];
	
	UILabel *label = [[UILabel alloc] init];
	label.text = @"我们会自动识别您的输入";
	label.textColor = [UIColor colorWithRed:0.843 green:0.854 blue:0.862 alpha:1.00];
	label.font = [UIFont fontWithName:@"Helvetica" size:13];
	[detailView addSubview:label];
	[label mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.left.equalTo(detailView).with.offset(5);
	}];
	
	UIButton *keyboardButton = [[UIButton alloc] init];
	[keyboardButton setBackgroundImage:[UIImage imageNamed:@"icon_keyboard"] forState:UIControlStateNormal];
	keyboardButton.size = keyboardButton.currentBackgroundImage.size;
	[detailView addSubview:keyboardButton];
	[keyboardButton mas_makeConstraints:^(MASConstraintMaker *make) {
		make.right.equalTo(detailView.mas_right).with.offset(-10);
		make.bottom.equalTo(detailView.mas_bottom).with.offset(-5);
	}];
	
	UIButton *longPressButton = [[UIButton alloc] init];
	[longPressButton setBackgroundImage:[UIImage imageNamed:@"icon_voice"] forState:UIControlStateNormal];
	
	
	[detailView addSubview:longPressButton];
	[longPressButton mas_makeConstraints:^(MASConstraintMaker *make) {
		make.right.equalTo(detailView.mas_right).with.offset(-10);
		make.bottom.equalTo(detailView.mas_bottom).with.offset(-5);
	}];
	
	
	
	
	self.detailView = detailView;
}

- (void)createVoiceInputView {
	//voiceInputView
	UIView *voiceInputView = [UIView new];
	voiceInputView.backgroundColor = [UIColor whiteColor];
	[self addSubview:voiceInputView];
	[voiceInputView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self.detailView.mas_bottom);
		make.left.right.bottom.equalTo(self);
	}];
	
	UILabel *firstLabel = [[UILabel alloc] init];
	firstLabel.text = @"长按语音说话\n不说具体时间，即可创建待办";
	firstLabel.textColor = kLightBlueColor;
	firstLabel.font = [UIFont fontWithName:@"Helvetica" size:12];
	firstLabel.numberOfLines = 1;
	firstLabel.textAlignment = NSTextAlignmentCenter;
	[voiceInputView addSubview:firstLabel];
	[firstLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(firstLabel.superview).with.offset(15);
		make.centerX.equalTo(firstLabel.superview);
	}];
	
	UILabel *secondLabel = [[UILabel alloc] init];
	secondLabel.text = @"不说具体时间，即可创建待办";
	secondLabel.textColor = [UIColor colorWithRed:0.843 green:0.854 blue:0.862 alpha:1.00];
	secondLabel.font = [UIFont fontWithName:@"Helvetica" size:12];
	secondLabel.numberOfLines = 1;
	secondLabel.textAlignment = NSTextAlignmentCenter;
	[voiceInputView addSubview:secondLabel];
	[secondLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(secondLabel.superview).with.offset(40);
		make.centerX.equalTo(secondLabel.superview);
	}];
	
	
	
	
	UIView *voiceContentView = [[UIView alloc] init];
	[voiceInputView addSubview:voiceContentView];
	voiceContentView.backgroundColor = kLightBlueColor;
	[voiceContentView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(voiceContentView.superview).with.offset(100);
		make.centerX.equalTo(voiceContentView.superview);
		make.width.equalTo(@80);
		make.height.equalTo(@80);
	}];
	voiceContentView.layer.cornerRadius = 40;
	
	UIButton *voiceButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[voiceContentView addSubview:voiceButton];
	[voiceButton setBackgroundImage:[UIImage imageNamed:@"icon_voiceButton"] forState:UIControlStateNormal];//icon_longPress_voice
	[voiceButton setBackgroundImage:[UIImage imageNamed:@"icon_voiceButton"] forState:UIControlStateHighlighted];
	voiceButton.size = voiceButton.currentBackgroundImage.size;
	[voiceButton mas_makeConstraints:^(MASConstraintMaker *make) {
		make.center.equalTo(voiceButton.superview);
	}];
	
	
	
	UIView *voiceContentBackgroundView = [[UIView alloc] init];
	[voiceInputView addSubview:voiceContentBackgroundView];
	voiceContentBackgroundView.backgroundColor = kLightBlueColor;
	[voiceContentBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.center.equalTo(voiceContentView);
		make.width.equalTo(@120);
		make.height.equalTo(@120);
	}];
	voiceContentBackgroundView.layer.cornerRadius = 60;
	voiceContentBackgroundView.hidden = YES;
	
	
	
	
	
	
	self.voiceInputView = voiceInputView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
	UITextField *field = [self.titleView viewWithTag:3];
	[field endEditing:YES];
}


@end

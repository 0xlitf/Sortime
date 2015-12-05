//
//  MainTabBarItem.m
//  Sortime
//
//  Created by Calcifer on 15/11/24.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "MainTabBar.h"

@interface MainTabBar ()
@property (nonatomic,weak) UIButton *plusBtn;

@end

@implementation MainTabBar

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		self.tintColor = kLightBlueColor;
		self.barTintColor = [UIColor whiteColor];
		
		UIButton *plusBtn = [[UIButton alloc] init];
		[plusBtn setBackgroundImage:[UIImage imageNamed:@"TabItemAddEvent"] forState:UIControlStateNormal];
		plusBtn.size = plusBtn.currentBackgroundImage.size;
		[plusBtn bk_addEventHandler:^(id sender) {
			if (self.plusBtnClickBlock) {
				self.plusBtnClickBlock();
			}
		} forControlEvents:UIControlEventTouchUpInside];
		[plusBtn sizeToFit];
		[self addSubview:plusBtn];
		self.plusBtn = plusBtn;
		
	}
	return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	self.plusBtn.centerX = self.width * 0.5;
	self.plusBtn.centerY = self.height * 0.5;
	
	CGFloat tabbarButtonW = self.width / 3;
	CGFloat tabbarButtonIndex = 0;
	for (UIView *child in self.subviews) {
		Class class = NSClassFromString(@"UITabBarButton");
		if ([child isKindOfClass:class]) {
			
			child.width = tabbarButtonW;
			child.x = tabbarButtonIndex * tabbarButtonW;
			tabbarButtonIndex++;
			if (tabbarButtonIndex == 1) {
				tabbarButtonIndex++;
			}
		}
	}
	[self bringSubviewToFront:self.plusBtn];
}
@end
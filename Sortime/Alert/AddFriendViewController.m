//
//  AddFriendViewController.m
//  Sortime
//
//  Created by Calcifer on 15/11/29.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "AddFriendViewController.h"

@implementation AddFriendViewController

- (instancetype)init{
	if (self = [super init]) {
		[self createSubviews];
		[self createBackBarButtonItem];
		self.hidesBottomBarWhenPushed = YES;

	}
	return self;
}

- (void)createSubviews{
	UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] bk_initWithImage:[UIImage imageNamed:@"icon_qrcode"] style:UIBarButtonItemStylePlain handler:^(id sender) {
		NSLog(@"2D Code");


	}];
	self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}

-(void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	
}
@end

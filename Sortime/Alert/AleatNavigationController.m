//
//  NotificationNavigationController.m
//  Sortime
//
//  Created by Calcifer on 15/11/23.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "AleatNavigationController.h"

@interface AleatNavigationController ()

@end

@implementation AleatNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle{
	return UIStatusBarStyleLightContent;
}

- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	self.navigationController.navigationBar.tintColor = [UIColor clearColor];
	
}




@end




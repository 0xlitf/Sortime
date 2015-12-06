//
//  AddPlanViewController.m
//  Sortime
//
//  Created by Calcifer on 15/11/25.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "SmartAddViewController.h"
#import "SmartAddTitleView.h"
#import "DataBaseManager.h"
#import "FMDataBase.h"

@interface SmartAddViewController ()

@end

@implementation SmartAddViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	UIView *view = [UIView new];
	self.view = view;
	self.view.backgroundColor=[UIColor whiteColor];
	[self createSubviews];
	[self createBarButtonItem];
	
}

- (void)createSubviews {
	SmartAddTitleView *smartAddTitleView = [SmartAddTitleView new];
	[self.view addSubview:smartAddTitleView];
	self.smartAddTitleView = smartAddTitleView;
	[smartAddTitleView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.equalTo(self.view);
	}];
}


#pragma mark -save plan into database
- (void)createBarButtonItem {
	UIBarButtonItem *doneButtonItem = [[UIBarButtonItem alloc] bk_initWithImage:[UIImage imageNamed:@"icon_save"] style:UIBarButtonItemStylePlain handler:^(id sender) {
		FMDatabase *db = [[DataBaseManager defaultManager] database];
		if ([db open]) {
			NSLog(@"database open success");
			int result = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS addPlan (id integer PRIMARY KEY AUTOINCREMENT, deltaDay integer NOT NULL, name text NOT NULL);"];
			if (result) {
				NSLog(@"create table success");
				int insertResult = [db executeUpdate:@"insert into addPlan (deltaDay, name) values (?,?);", @0, self.smartAddTitleView.titleTextField.text];
				if (insertResult) {
					NSLog(@"insert success");
				}
			}
			else{
				NSLog(@"create table error");
			}
		}
		else{
			NSLog(@"database open error");
		}
		[self dismissViewControllerAnimated:YES completion:^{
			[[NSNotificationCenter defaultCenter] postNotificationName:@"reloadTableViewData" object:nil];
		}];
	}];
	self.navigationItem.rightBarButtonItem = doneButtonItem;
	
	UIBarButtonItem *cancelButtonItem = [[UIBarButtonItem alloc] bk_initWithImage:[UIImage imageNamed:@"icon_popup_close"] style:UIBarButtonItemStylePlain handler:^(id sender) {
		[self dismissViewControllerAnimated:YES completion:^{
			
		}];
	}];
	self.navigationItem.leftBarButtonItem = cancelButtonItem;
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	self.navigationItem.leftBarButtonItem.tintColor = [UIColor colorWithWhite:0.67 alpha:1];
	self.navigationItem.rightBarButtonItem.tintColor = [UIColor colorWithRed:0.000 green:0.480 blue:1.000 alpha:1.00];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden
{
	return YES;
}




@end

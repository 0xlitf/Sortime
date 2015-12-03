//
//  CalendarListPageViewController.m
//  Sortime
//
//  Created by Calcifer on 15/12/2.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "CalendarListPageViewController.h"
#import "CalendarListPageTableView.h"
#import "CalendarListPageTableViewCell.h"
#import "CalendarListView.h"
#import "CalendarListPageNoticeView.h"
#import "CalendarListPageView.h"



@interface CalendarListPageViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation CalendarListPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self createSubviews];

}

-(void)viewWillAppear:(BOOL)animated{
	if ([self tableView:self.listPageView.planTableView numberOfRowsInSection:0] != 0) {
		[self.listPageView.planTableView.noticeView hideNotice];
	}
	if (self.changePageBlock) {
		NSLog(@"completed");
		self.changePageBlock((int)self.deltaDayValue);
	}
}

- (void)createSubviews{
	CalendarListPageView *listPageView = [[CalendarListPageView alloc] init];
	[self.view addSubview:listPageView];
	listPageView.panGesture.delegate = self;
	listPageView.planTableView.delegate = self;
	listPageView.planTableView.dataSource = self;
	[listPageView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.equalTo(self.view);
	}];
	
	
	self.listPageView = listPageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	if (self.deltaDayValue == -1) {
		return 0;
	}
	
	return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	static NSString *ID = @"cell";
	CalendarListPageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
	if (!cell) {
		cell = [[CalendarListPageTableViewCell alloc] init];
	}
	
	

	
	return cell;
}




#pragma mark resolve UITableView and UIPageViewController panGesture Conflict
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(nonnull UIGestureRecognizer *)otherGestureRecognizer {
	if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
		CGPoint translation = [(UIPanGestureRecognizer *)gestureRecognizer translationInView:self.view];
		return fabs(translation.x) > fabs(translation.y);
	}
	return YES;
}


@end

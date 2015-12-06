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
#import "DataBaseManager.h"


@interface CalendarListPageViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation CalendarListPageViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self createSubviews];
	self.listPageView.planTableView.delegate = self;
}

-(void)viewWillAppear:(BOOL)animated {
	if ([self tableView:self.listPageView.planTableView numberOfRowsInSection:0] != 0) {
		[self.listPageView.planTableView.noticeView hideNotice];
	}
}

- (void)createSubviews {
	CalendarListPageView *listPageView = [[CalendarListPageView alloc] init];
	[self.view addSubview:listPageView];
	
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



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	FMDatabase *db = [[DataBaseManager defaultManager] database];
	FMResultSet *result = [db executeQueryWithFormat:@"select count(*) from addPlan where deltaDay = %ld",self.deltaDayValue];
	
		while ([result next]) {
			NSLog(@"%d",[result intForColumnIndex:0]);
			return [result intForColumnIndex:0];
		}
		return 0;
	
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *ID = @"cell";
	CalendarListPageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
	if (!cell) {
		cell = [[CalendarListPageTableViewCell alloc] init];
	}
	FMDatabase *db = [[DataBaseManager defaultManager] database];
	FMResultSet *result = [db executeQueryWithFormat:@"select * from addPlan where deltaDay = %ld",self.deltaDayValue];
	
	NSLog(@"deltaDayValue:%ld",self.deltaDayValue);
	NSMutableArray *array = [NSMutableArray array];
	NSInteger count;
	while ([result next]) {
		NSString *name = [result stringForColumn:@"name"];
		int delta = [result intForColumn:@"deltaDay"];
		count = [result intForColumnIndex:0];
		
		NSDictionary *dict = @{
							   @"name":name,
							   @"delta":[NSNumber numberWithInt:delta]
							   };

		[array addObject:dict];
		
		NSLog(@"%@ %d",	name, delta);
		NSLog(@"%d",[result intForColumnIndex:0]);
	}
	cell.contentLabel.text = [array[indexPath.row] objectForKey:@"name"];

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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
	if (self.listPageView.planTableView.contentOffset.y < 0) {
		float alpha = 1 + (self.listPageView.planTableView.contentOffset.y)/100;
		self.listPageView.planTableView.alpha = alpha;
		self.listPageView.backgroundWeatherView.alpha = 1;//1- alpha;
		self.listPageView.backgroundWeatherView.y = 100 + self.listPageView.planTableView.contentOffset.y / 2;
		self.view.window.rootViewController.navigationController.navigationBar.alpha = alpha;
		[[NSNotificationCenter defaultCenter] postNotificationName:@"changeNavigationBarAlpha" object:[NSString stringWithFormat:@"%f",alpha]];
	}
	
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView NS_AVAILABLE_IOS(3_2){
	
}// any zoom scale changes

// called on start of dragging (may require some time and or distance to move)

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
	
	
}
// called on finger up if the user dragged. velocity is in points/millisecond. targetContentOffset may be changed to adjust where the scroll view comes to rest
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0){
	
}
// called on finger up if the user dragged. decelerate is true if it will continue moving afterwards
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
	
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
	
}// called on finger up as we are moving
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
	
}// called when scroll view grinds to a halt

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
	
}// called when setContentOffset/scrollRectVisible:animated: finishes. not called if not animating


- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view NS_AVAILABLE_IOS(3_2){
	
}// called before the scroll view begins zooming its content
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale {
	
}// scale between minimum and maximum. called after any 'bounce' animations


- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
	
}// called when scrolling animation finished. may be called immediately if already at top




@end

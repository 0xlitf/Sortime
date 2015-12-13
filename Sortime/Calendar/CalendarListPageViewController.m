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
#import "CalendarListPageWeatherModel.h"
#import "CalendarListPageWeatherView.h"
#import "NSDate+CalciferExtension.h"


@interface CalendarListPageViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation CalendarListPageViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self createSubviews];
	self.listPageView.planTableView.delegate = self;
	
	NSDate *currentDate = [NSDate days:self.deltaDayValue Before:[NSDate date]];
	if (self.deltaDayValue == 0) {
		self.listPageView.planTableView.weatherView.dayLabel.text = @"今天  ";
	}
	else{
		NSLog(@"%@",currentDate);
		self.listPageView.planTableView.weatherView.dayLabel.text = [NSString stringWithFormat:@"%ld.%ld.%ld  ",currentDate.yearValue,currentDate.monthValue,currentDate.dayValue];
		self.listPageView.planTableView.weatherView.calendarLabel.text = [NSString getChineseCalendarWithDate:currentDate];
	}
	
	NSDateComponents *componets = [[NSCalendar autoupdatingCurrentCalendar] components:NSCalendarUnitWeekday fromDate:currentDate];
	int weekday = (int)[componets weekday];//a就是星期几，1代表星期日，2代表星期一，后面依次
	NSLog(@"weekday:%d",weekday);
	NSString *weekdayStr;
	switch (weekday) {
  case 7:
			weekdayStr = @"星期一";
			break;
  case 1:
			weekdayStr = @"星期二";
			break;
  case 2:
			weekdayStr = @"星期三";
			break;
  case 3:
			weekdayStr = @"星期四";
			break;
  case 4:
			weekdayStr = @"星期五";
			break;
  case 5:
			weekdayStr = @"星期六";
			break;
  case 6:
			weekdayStr = @"星期日";
			break;
  default:
			break;
	}
	self.listPageView.planTableView.weatherView.dayLabel.text = [self.listPageView.planTableView.weatherView.dayLabel.text stringByAppendingString:weekdayStr];
	NSLog(@"%@",self.listPageView.planTableView.weatherView.dayLabel.text);
}

-(void)viewWillAppear:(BOOL)animated {
	if ([self tableView:self.listPageView.planTableView numberOfRowsInSection:0] != 0) {
		[self.listPageView.planTableView.noticeView hideNotice];
	}
}

- (void)createSubviews {
	CalendarListPageView *listPageView = [[CalendarListPageView alloc] init];
	[self.view addSubview:listPageView];
	
	
	NSString *httpUrl = @"http://apis.baidu.com/heweather/weather/free";
	NSString *httpArg = @"city=beijing";
	if (self.deltaDayValue == 0) {
		[self request: httpUrl withHttpArg: httpArg];
	}
	
	listPageView.planTableView.delegate = self;
	listPageView.planTableView.dataSource = self;
	
	[listPageView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.equalTo(self.view);
	}];
	
	self.listPageView = listPageView;
}


-(void)request: (NSString*)httpUrl withHttpArg: (NSString*)HttpArg  {
	NSString *urlStr = [[NSString alloc]initWithFormat: @"%@?%@", httpUrl, HttpArg];
	NSURL *url = [NSURL URLWithString: urlStr];
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 10];
	[request setHTTPMethod: @"GET"];
	[request addValue: @"a3a22fe96529123f87fae1455cd51e2a" forHTTPHeaderField: @"apikey"];
	NSOperationQueue *queue = [[NSOperationQueue alloc] init];
	[NSURLConnection sendAsynchronousRequest: request
									   queue: queue
						   completionHandler: ^(NSURLResponse *response, NSData *data, NSError *error){
							   if (error) {
								   NSLog(@"Httperror: %@%ld", error.localizedDescription, error.code);
							   } else {
								   NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];
								   NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
								   //								   NSLog(@"HttpResponseCode:%ld", responseCode);
								   //								   NSLog(@"HttpResponseBody %@",responseString);
								   NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
								   CalendarListPageWeatherModel *model = [MTLJSONAdapter modelOfClass:[CalendarListPageWeatherModel class] fromJSONDictionary:[[dict objectForKey:@"HeWeather data service 3.0"] firstObject] error:nil];
								   NSLog(@"%@",model);
								   
								   dispatch_async(dispatch_get_main_queue(), ^{
									   
									   NSLog(@"%@",NSCalendarIdentifierGregorian);
									   self.listPageView.planTableView.weatherView.weatherLabel.text = model.cond_tex;
									   self.listPageView.planTableView.weatherView.locationLabel.text = model.city;
									   self.listPageView.planTableView.weatherView.windLabel.text = [NSString stringWithFormat:@"%@ %@",model.wind_dir,model.wind_sc];
									   self.listPageView.planTableView.weatherView.pMLabel.text = [NSString stringWithFormat:@"PM2.5 %@",model.pm25];
									   self.listPageView.planTableView.weatherView.imageIcon.image = [UIImage imageNamed:model.cond_tex];
								   });
							   }
						   }];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	FMDatabase *db = [[DataBaseManager defaultManager] database];
	FMResultSet *rs = [db executeQueryWithFormat:@"select count(*) from addPlan where deltaDay = %ld",self.deltaDayValue];
	while ([rs next]) {
		return [rs intForColumnIndex:0];
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
	}
	[db close];
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

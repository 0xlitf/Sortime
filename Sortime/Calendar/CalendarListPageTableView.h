//
//  CalendarListPageTableView.h
//  Sortime
//
//  Created by Calcifer on 15/11/27.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  CalendarListPageWeatherView;
@class CalendarListPageNoticeView;
@interface CalendarListPageTableView : UITableView

@property (nonatomic, weak) CalendarListPageWeatherView *weatherView;
@property (nonatomic, weak) CalendarListPageNoticeView *noticeView;

@property (nonatomic, weak, nullable) id <UITableViewDataSource> dataSource;
@property (nonatomic, weak, nullable) id <UITableViewDelegate> delegate;



@end

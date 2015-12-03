//
//  CalendarListPageView.h
//  Sortime
//
//  Created by Calcifer on 15/11/25.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import <UIKit/UIKit.h>


@class CalendarListPageTableView;
@interface CalendarListPageView : UIView

@property (nonatomic, weak) UIView *backgroundWeatherView;

@property (nonatomic, weak) CalendarListPageTableView *planTableView;

@property (nonatomic, weak) UIPanGestureRecognizer *panGesture;


@end

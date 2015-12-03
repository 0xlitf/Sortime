//
//  CalendarTitleView.h
//  Sortime
//
//  Created by Calcifer on 15/11/30.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarTitleView : UIView
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *arrowButton;
@property (nonatomic, copy) void (^titleTaped)();
- (void)showLeftArrow;
- (void)showRightArrow;
@end

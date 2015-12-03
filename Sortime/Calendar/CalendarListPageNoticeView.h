//
//  CalendarListPageNoticeView.h
//  Sortime
//
//  Created by Calcifer on 15/11/25.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarListPageNoticeView : UIView

@property (nonatomic, weak) UIImageView *image;
@property (nonatomic, weak) UILabel *label;

- (void)hideNotice;
- (void)showNotice;


@end

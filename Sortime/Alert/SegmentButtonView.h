//
//  SegmentButtonView.h
//  Sortime
//
//  Created by Calcifer on 15/11/28.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, AlertTableViewType){
	ScheduleType,
	FriendInviteType
};

@interface SegmentButtonView : UIView

@property (nonatomic, assign) AlertTableViewType pageType;

@end

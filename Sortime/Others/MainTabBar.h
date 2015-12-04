//
//  MainTabBarItem.h
//  Sortime
//
//  Created by Calcifer on 15/11/24.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^PlusBtnClickBlock)();

@interface MainTabBar : UITabBar

@property (nonatomic, copy)PlusBtnClickBlock plusBtnClickBlock;

@end

//
//  SettingModel.h
//  TabbedFramework
//
//  Created by Calcifer on 15/11/3.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^SettingModelOption)();
@interface SettingModel : NSObject
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *subTitle;
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) SettingModelOption option;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;

@end

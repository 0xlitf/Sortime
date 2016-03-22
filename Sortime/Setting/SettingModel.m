//
//  SettingModel.m
//  TabbedFramework
//
//  Created by Calcifer on 15/11/3.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "SettingModel.h"

@implementation SettingModel

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title
{
    SettingModel *model = [[self alloc] init];
    
    model.icon = icon;
    model.title = title;
    
    return model;
}


@end

//
//  SettingArrowModel.m
//  TabbedFramework
//
//  Created by Calcifer on 15/11/3.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "SettingArrowModel.h"

@implementation SettingArrowModel

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destinationViewController:(Class)destination
{
    SettingArrowModel *model = [[self alloc] init];
    
    model.icon = icon;
    model.title = title;
    model.destinationViewController = destination;
    return model;
}

@end

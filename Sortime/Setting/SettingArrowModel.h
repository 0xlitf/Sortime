//
//  SettingArrowModel.h
//  TabbedFramework
//
//  Created by Calcifer on 15/11/3.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SettingModel.h"

@interface SettingArrowModel : SettingModel
@property (nonatomic,assign) Class destinationViewController;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destinationViewController:(Class)destination;


@end

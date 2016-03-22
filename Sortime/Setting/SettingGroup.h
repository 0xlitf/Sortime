//
//  SettingGroup.h
//  TabbedFramework
//
//  Created by Calcifer on 15/11/3.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingGroup : NSObject
@property (nonatomic,copy) NSString *header;
@property (nonatomic,strong) NSArray *models;
@property (nonatomic,copy) NSString *footer;
@end

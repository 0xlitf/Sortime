//
//  SettingLabelModel.m
//  TabbedFramework
//
//  Created by Calcifer on 15/11/3.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "SettingLabelModel.h"
#import "SaveTool.h"

@implementation SettingLabelModel
- (void)setText:(NSString *)text
{
    _text = text;
    
    [SaveTool setObject:text forKey:self.title];
}

- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    
    _text = [SaveTool objectForKey:self.title];
}
@end

//
//  SaveTool.m
//  TabbedFramework
//
//  Created by Calcifer on 15/11/4.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "SaveTool.h"

@implementation SaveTool
+ (void)setObject:(id)value forKey:(NSString *)defaultName{
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

+ (id)objectForKey:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
}
@end

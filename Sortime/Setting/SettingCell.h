//
//  SettingCell.h
//  Sortime
//
//  Created by Calcifer on 15/12/13.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingModel.h"

@interface SettingCell : UITableViewCell
@property (nonatomic, strong) SettingModel *item;

@property (nonatomic, strong) NSIndexPath *indexPath;


+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end

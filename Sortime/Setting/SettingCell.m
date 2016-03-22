//
//  SettingCell.m
//  Sortime
//
//  Created by Calcifer on 15/12/13.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//


#import "SettingCell.h"
#import "SettingArrowModel.h"
#import "SettingModel.h"
#import "SettingLabelModel.h"
#import "SettingSwitchModel.h"

@interface SettingCell ()

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UISwitch *switchView;
@property (nonatomic, strong) UILabel *labelView;

@property (nonatomic, weak) UIView *divider;

@end

@implementation SettingCell


- (void)setItem:(SettingModel *)item
{
	_item = item;
	// 1.设置cell的子控件的数据
	[self setUpData];
	// 2.设置右边视图
	[self setUpAccessoryView];
}

// 设置cell的子控件的数据
- (void)setUpData
{
	if (_item.icon.length) {
		
		self.imageView.image = [UIImage imageNamed:_item.icon];
	}
	self.textLabel.text = _item.title;
	
	self.detailTextLabel.text = _item.subTitle;
}

// 设置右边视图
- (void)setUpAccessoryView
{
	if ([_item isKindOfClass:[SettingArrowModel class]]) { // 箭头
		self.accessoryView = self.imgView;
//		self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		self.selectionStyle = UITableViewCellSelectionStyleDefault;
	}else if ([_item isKindOfClass:[SettingSwitchModel class]]){ // Switch
		self.accessoryView = self.switchView;
		self.selectionStyle = UITableViewCellSelectionStyleNone;
	}else if ([_item isKindOfClass:[SettingLabelModel class]]){
		self.accessoryView = self.labelView;
		
		SettingLabelModel *labelItem = (SettingLabelModel *)_item;
		self.labelView.text = labelItem.text;
		self.selectionStyle = UITableViewCellSelectionStyleDefault;
	}else{
		self.accessoryView = nil;
		self.selectionStyle = UITableViewCellSelectionStyleDefault;
	}
}

#warning 快速创建cell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
	static NSString *ID = @"cell";
	SettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
	
	if (cell == nil) {
		cell = [[SettingCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
	}
	
	return cell;
}

#warning 判断分割线是否需要显示
- (void)setIndexPath:(NSIndexPath *)indexPath
{
	_indexPath = indexPath;
	
	self.divider.hidden = indexPath.row == 0;
	
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
		
		// 设置背景
		[self setUpBg];
		// 清空子视图的背景
		[self setSubViews];
		
	}
	
	return self;
}
#warning 设置背景
- (void)setUpBg
{
	// 设置背景图片
	UIView *bg = [[UIView alloc] init];
	bg.backgroundColor = [UIColor whiteColor];
	self.backgroundView = bg;
	
	// 设置选中的背景图片
	UIView *selectedBg = [[UIView alloc] init];
	selectedBg.backgroundColor = [UIColor whiteColor];
	self.selectedBackgroundView = selectedBg;
}

#warning 清空子控件的背景颜色
- (void)setSubViews
{
	self.textLabel.backgroundColor = [UIColor clearColor];
	self.detailTextLabel.backgroundColor = [UIColor clearColor];
}


#warning 适配ios6的cell
- (void)setFrame:(CGRect)frame
{
	
	//    if (!ios7) {
	//
	//        frame.size.width += 20;
	//        frame.origin.x -= 10;
	//    }
	
	[super setFrame:frame];
}

#warning 设置分割线的frame
- (void)layoutSubviews
{
	[super layoutSubviews];
	
	CGFloat dividerX = self.textLabel.frame.origin.x;
	CGFloat dividerY = 0;
	CGFloat dividerH = 1;
	CGFloat dividerW = 320;
	
	self.divider.frame = CGRectMake(dividerX, dividerY, dividerW, dividerH);
}

- (UIView *)divider
{
	if (_divider == nil) {
		//        if (!ios7) { // 不是ios7才需要创建分割线
		//            UIView *divider  = [[UIView alloc] init];
		//            divider.backgroundColor = [UIColor blackColor];
		//            divider.alpha = 0.2;
		//
		//            [self.contentView addSubview:divider];
		//            _divider = divider;
		//        }
	}
	
	return _divider;
}

- (UILabel *)labelView
{
	if (_labelView == nil) {
		_labelView = [[UILabel alloc] init];
		_labelView.bounds = CGRectMake(0, 0, 100, 44);
		_labelView.textColor = [UIColor redColor];
		_labelView.textAlignment = NSTextAlignmentRight;
	}
	return _labelView;
}

- (UIImageView *)imgView
{
	if (_imgView == nil) {
		_imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_RecurrenceCustom_more"]];
	}
	return _imgView;
}

- (UISwitch *)switchView
{
	if (_switchView == nil) {
		
		_switchView = [[UISwitch alloc] init];
	}
	return _switchView;
}


@end


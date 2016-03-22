//
//  BaseTableViewController.m
//  TabbedFramework
//
//  Created by Calcifer on 15/11/3.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "BaseTableViewController.h"
#import "SettingGroup.h"
#import "SettingCell.h"
#import "SettingModel.h"
#import "SettingArrowModel.h"
#import "SettingLabelModel.h"
#import "SettingSwitchModel.h"
#import "UITableView+FDTemplateLayoutCell.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (NSMutableArray *)dataList{
	if (!_dataList) {
		_dataList = [NSMutableArray array];
	}
	return _dataList;
}
- (id)init{
	return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
	[super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	if (indexPath.section == 0) {
		return 70;
	}
	return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
	if (section == 0) {
		return 0;
	}

	return 20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
	return 0;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
	return self.dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
	SettingGroup *group = self.dataList[section];
	return group.models.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *ID = @"cell";
	SettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
	if (!cell) {
		cell = [[SettingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
	}
	// Configure the cell...
	SettingGroup *group =self.dataList[indexPath.section];
	SettingModel *model = group.models[indexPath.row];
	cell.imageView.image = [UIImage imageNamed:model.icon];
	cell.textLabel.text = model.title;
	cell.item = model;
	
	return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
	// Return NO if you do not want the specified item to be editable.
	return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	if (editingStyle == UITableViewCellEditingStyleDelete) {
		// Delete the row from the data source
		[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
	} else if (editingStyle == UITableViewCellEditingStyleInsert) {
		// Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
	}   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
	// Return NO if you do not want the item to be re-orderable.
	return YES;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	// Get the new view controller using [segue destinationViewController].
	// Pass the selected object to the new view controller.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	SettingGroup *group = self.dataList[indexPath.section];
	SettingModel *model = group.models[indexPath.row];
	if (model.option) {
		model.option();
		return;
	}
	NSLog(@"model class is %@",[model class]);
	if ([model isKindOfClass:[SettingArrowModel class]]) {
		SettingArrowModel *arrowModel = (SettingArrowModel *)model;
		if (arrowModel.destinationViewController) {
			UIViewController *vc = [[arrowModel.destinationViewController alloc] init];
			vc.title = model.title;
			[self.navigationController pushViewController:vc animated:YES];
		}
	}
}

-(void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
	self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
	[self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
	return UIStatusBarStyleLightContent;
}

@end

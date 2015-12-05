//
//  DataBaseManager.h
//  Sortime
//
//  Created by Calcifer on 15/12/4.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDataBase.h"
#import "FMDatabaseQueue.h"

@interface DataBaseManager : NSObject

@property(nonatomic, strong) FMDatabase*           database;

@property(nonatomic, strong) FMDatabaseQueue*      databaseQueue;
///数据库相关的子线程----相关操作都放在这个子线程中-----崩溃容易查找问题。
@property(nonatomic, strong) dispatch_queue_t databaseSyncQueue;

instance_interface(DataBaseManager, defaultManager)

///数据库相关操作放在这个的子线程里。
/**
 *  dispatch_async([DataBaseManager syncDatabaseQueue], ^{
 
 });
 */
+ (dispatch_queue_t)syncDatabaseQueue;

/**
 *  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
 [DataBaseManager syschronizeDBFile];
 */
///同步数据库文件。启动应用的时候放在子线程里面执行下。第一次安装新建DB。

+ (void)syschronizeDBFile;


@end





//测试
//因为是全局的，尽量把所有的数据库操作都放在事务里面。
//[wSelf selectDataBaseComplete:^(BOOL complete) {
//    if(complete){
//        [ProgressHUD dismiss];
//        [wSelf.tableView reloadData];
//    }else{
//        [ProgressHUD showError:NSLocalizedString(@"历史列表加载失败", @"") delay:1];
//    }
//}];
//
//- (void)selectDataBaseComplete:(void (^)(BOOL complete))response{
//    dispatch_async([DataBaseManager syncDatabaseQueue], ^{
//        [[[DataBaseManager defaultManager] databaseQueue] inTransaction:^(FMDatabase *db, BOOL *rollback) {
//            _cyclingRecords = [NSMutableArray arrayWithArray:[ActivityManager getAllFinishedCyclingRecordsInDatabase:db]];
//        }];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            if(_cyclingRecords.count > 0){
//                response(YES);
//            }else{
//                response(NO);
//            }
//        });
//    });
//}
//
//在catch 里面 回滚。
//+ (NSArray*)samplesWithActivityIdentifier:(NSString*)activityId{
//    __block FMResultSet* result;
//    NSMutableArray* array = [[NSMutableArray alloc] init];
//    [[[DataBaseManager defaultManager] databaseQueue] inTransaction:^(FMDatabase *db, BOOL *rollback) {
//        @try {
//            if(activityId == nil){
//                result = [[[DataBaseManager defaultManager] database] executeQuery:@"select * from record_points_table where is_synced = ?", @NO];
//            }else{
//                result = [db executeQuery:@"select * from record_points_table where activity_id = ? order by distance asc", activityId];
//            }
//        }
//        @catch (NSException *exception) {
//            NSLog(@"roll back: 12");
//            *rollback = YES;
//        }
//        @finally {
//            while ([result next]) {
//                Sample* s = [[SmapleManager defaultManager] sampleWithDictionary:[result resultDictionary]];
//                [array addObject:s];
//            }
//        }
//    }];
//    return array;
//}


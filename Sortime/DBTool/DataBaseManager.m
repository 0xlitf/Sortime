//
//  DataBaseManager.m
//  Sortime
//
//  Created by Calcifer on 15/12/4.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "DataBaseManager.h"

#define DBFileName   @"Sortime.db"
@implementation DataBaseManager
instance_implementation(DataBaseManager, defaultManager)

#pragma mark - syschronize the db file when the app init at first time
/*
 dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
 [DataBaseManager syschronizeDBFile];
 });
 */

+ (void)syschronizeDBFile
{
	NSFileManager * fileManager = [NSFileManager defaultManager];
	NSString* document = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
	NSString * dbFile = [document stringByAppendingPathComponent:DBFileName];
	NSLog(@"%@",dbFile);
	
	
	FMDatabase *db = [FMDatabase databaseWithPath:dbFile];
	if ([db open]) {
		NSLog(@"ok");
	}
	
	if (![fileManager fileExistsAtPath:dbFile]) {
		NSLog(@"create database");
	}else{
		NSLog(@"database exist");
	}
	
}

- (id)init {
	if(self = [super init]) {
		self.database = [FMDatabase databaseWithPath:[DataBaseManager dbFilePath]];
		self.databaseQueue = [FMDatabaseQueue databaseQueueWithPath:[DataBaseManager dbFilePath]];
		self.databaseSyncQueue = dispatch_queue_create("database.queue", DISPATCH_QUEUE_SERIAL);
	}
	return self;
}

+ (dispatch_queue_t)syncDatabaseQueue {
	return [[DataBaseManager defaultManager] databaseSyncQueue];
}

#pragma mark - 数据库文件路径
+ (NSString *)dbFilePath
{
	NSString * dbFile = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:DBFileName];
	if ([[NSFileManager defaultManager] fileExistsAtPath:dbFile]) {
		return dbFile;
	}
	return nil;
}

- (FMDatabase*)database {
	self.database = [FMDatabase databaseWithPath:[DataBaseManager dbFilePath]];
	if (![_database open]) {
		return nil;
	}
	return _database;
}

- (FMDatabaseQueue*)databaseQueue {
	_databaseQueue = [FMDatabaseQueue databaseQueueWithPath:[DataBaseManager dbFilePath]];
	return _databaseQueue;
}

@end
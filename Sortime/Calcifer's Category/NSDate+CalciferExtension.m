//
//  NSDate+CalciferExtension.m
//  Sortime
//
//  Created by Calcifer on 15/11/25.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "NSDate+CalciferExtension.h"

@implementation NSDate (CalciferExtension)



+ (instancetype)days:(NSInteger)days Before:(NSDate *)date {
	;
	
	
	return [self dateWithTimeInterval:days*24*60*60 sinceDate:date];
}



- (NSInteger)yearValue {
	NSDateFormatter *dateFormatter = [NSDateFormatter new];
	[dateFormatter setDateFormat:@"yyyy"];
	NSInteger year = [[dateFormatter stringFromDate:self] intValue];
	return year;
}

- (NSInteger)monthValue {
	NSDateFormatter *dateFormatter = [NSDateFormatter new];
	[dateFormatter setDateFormat:@"MM"];
	NSInteger month = [[dateFormatter stringFromDate:self] intValue];
	return month;
}

- (NSInteger)dayValue {
	NSDateFormatter *dateFormatter = [NSDateFormatter new];
	[dateFormatter setDateFormat:@"dd"];
	NSInteger day = [[dateFormatter stringFromDate:self] intValue];
	return day;
}

- (NSInteger)hourValue {
	NSDateFormatter *dateFormatter = [NSDateFormatter new];
	[dateFormatter setDateFormat:@"HH"];
	NSInteger hour = [[dateFormatter stringFromDate:self] intValue];
	return hour;
}

- (NSInteger)minuteValue {
	NSDateFormatter *dateFormatter = [NSDateFormatter new];
	[dateFormatter setDateFormat:@"mm"];
	NSInteger minute = [[dateFormatter stringFromDate:self] intValue];
	return minute;
}

- (NSInteger)secondValue {
	NSDateFormatter *dateFormatter = [NSDateFormatter new];
	[dateFormatter setDateFormat:@"ss"];
	NSInteger second = [[dateFormatter stringFromDate:self] intValue];
	return second;
}

@end

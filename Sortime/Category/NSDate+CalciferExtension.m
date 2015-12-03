//
//  NSDate+CalciferExtension.m
//  Sortime
//
//  Created by Calcifer on 15/11/25.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "NSDate+CalciferExtension.h"

@implementation NSDate (CalciferExtension)



+ (instancetype)days:(int)days Before:(NSDate *)date {
	return nil;
}



- (int)yearValue {
	NSDateFormatter *dateFormatter = [NSDateFormatter new];
	[dateFormatter setDateFormat:@"yyyy"];
	int year = [[dateFormatter stringFromDate:self] intValue];
	return year;
}

- (int)monthValue {
	NSDateFormatter *dateFormatter = [NSDateFormatter new];
	[dateFormatter setDateFormat:@"MM"];
	int month = [[dateFormatter stringFromDate:self] intValue];
	return month;
}

- (int)dayValue {
	NSDateFormatter *dateFormatter = [NSDateFormatter new];
	[dateFormatter setDateFormat:@"dd"];
	int day = [[dateFormatter stringFromDate:self] intValue];
	return day;
}

- (int)hourValue {
	NSDateFormatter *dateFormatter = [NSDateFormatter new];
	[dateFormatter setDateFormat:@"HH"];
	int hour = [[dateFormatter stringFromDate:self] intValue];
	return hour;
}

- (int)minuteValue {
	NSDateFormatter *dateFormatter = [NSDateFormatter new];
	[dateFormatter setDateFormat:@"mm"];
	int minute = [[dateFormatter stringFromDate:self] intValue];
	return minute;
}

- (int)secondValue {
	NSDateFormatter *dateFormatter = [NSDateFormatter new];
	[dateFormatter setDateFormat:@"ss"];
	int second = [[dateFormatter stringFromDate:self] intValue];
	return second;
}

@end

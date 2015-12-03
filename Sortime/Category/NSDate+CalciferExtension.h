//
//  NSDate+CalciferExtension.h
//  Sortime
//
//  Created by Calcifer on 15/11/25.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate(CalciferExtension)
@property (nonatomic, assign) int yearValue;
@property (nonatomic, assign) int monthValue;
@property (nonatomic, assign) int dayValue;
@property (nonatomic, assign) int hourValue;
@property (nonatomic, assign) int minuteValue;
@property (nonatomic, assign) int secondValue;



+ (instancetype)days:(int)days Before:(NSDate *)date;

@end

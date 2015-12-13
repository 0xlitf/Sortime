//
//  NSString+ChineseCalendar.h
//  Sortime
//
//  Created by Calcifer on 15/12/12.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(ChineseCalendar)
/*
 * @DO 获取指定日期的农历日期
 * @param date [指定日期]
 * @return (NSString)[指定日期的农历字符串]
 */
+(NSString*)getChineseCalendarWithDate:(NSDate *)date;
@end

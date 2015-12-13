//
//  CalendarListPageWeatherModel.m
//  Sortime
//
//  Created by Calcifer on 15/11/25.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "CalendarListPageWeatherModel.h"
#import "UIKit/UIKit.h"
//@implementation CalendarListPageWeatherModel
//
//- (instancetype)init {
//	if (self = [super init]) {
//		_imageName = [NSString stringWithFormat:@"暴雪"];
//		_locationLabelStr = [NSString stringWithFormat:@"海淀"];
//		_windLabelStr = [NSString stringWithFormat:@"无持续风向微风"];
//		_pMLabelStr = [NSString stringWithFormat:@"PM2.5 34"];
//		_dayLabelStr = [NSString stringWithFormat:@"今天 星期一"];
//		_calendarLabelStr = [NSString stringWithFormat:@"农历十月十二"];
//		_weatherLabelStr = [NSString stringWithFormat:@"晴 -6℃/0℃"];
//	}
//	return self;
//}
//
//@end
@interface CalendarListPageWeatherModel()

/*
 @property (nonatomic, copy) NSString *cnty;//中国
 @property (nonatomic, copy) NSString *city;//北京
 @property (nonatomic, copy) NSString *wind_dir;//无持续风向
 @property (nonatomic, copy) NSString *wind_sc;//微风
 @property (nonatomic, copy) NSString *pm25;//pm2.5
 @property (nonatomic, copy) NSString *tmp;//温度
 
 */

@end

@implementation CalendarListPageWeatherModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
			 @"cnty": @"basic.cnty",
			 @"city": @"basic.city",
			 @"wind_dir": @"now.wind.dir",
			 @"wind_sc": @"now.wind.sc",
			 @"pm25": @"aqi.city.pm25",
			 @"tmp": @"now.tmp",
			 @"cond_tex": @"now.cond.txt",
			 };
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary{
	
	return self;
}


@end

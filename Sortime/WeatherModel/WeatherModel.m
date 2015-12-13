//
//  WeatherModel.m
//  Sortime
//
//  Created by Calcifer on 15/12/12.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "WeatherModel.h"

@interface WeatherModel()

/*
 @property (nonatomic, copy) NSString *cnty;//中国
 @property (nonatomic, copy) NSString *city;//北京
 @property (nonatomic, copy) NSString *wind_dir;//无持续风向
 @property (nonatomic, copy) NSString *wind_sc;//微风
 @property (nonatomic, copy) NSString *pm25;//pm2.5
 @property (nonatomic, copy) NSString *tmp;//温度
 
 */

@end

@implementation WeatherModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
			 @"cnty": @"basic.cnty",
			 @"city": @"basic.city",
			 @"wind_dir": @"now.wind.dir",
			 @"wind_sc": @"now.wind.sc",
			 @"pm25": @"aqi.city.pm25",
			 @"tmp": @"now.tmp",
			 };
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary{
	
	return self;
}


@end

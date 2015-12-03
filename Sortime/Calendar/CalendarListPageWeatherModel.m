//
//  CalendarListPageWeatherModel.m
//  Sortime
//
//  Created by Calcifer on 15/11/25.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import "CalendarListPageWeatherModel.h"
#import "UIKit/UIKit.h"
@implementation CalendarListPageWeatherModel

- (instancetype)init {
	if (self = [super init]) {
		_imageName = [NSString stringWithFormat:@"暴雪"];
		_locationLabelStr = [NSString stringWithFormat:@"海淀"];
		_windLabelStr = [NSString stringWithFormat:@"无持续风向微风"];
		_pMLabelStr = [NSString stringWithFormat:@"PM2.5 34"];
		_dayLabelStr = [NSString stringWithFormat:@"今天 星期一"];
		_calendarLabelStr = [NSString stringWithFormat:@"农历十月十二"];
		_weatherLabelStr = [NSString stringWithFormat:@"晴 -6℃/0℃"];
	}
	return self;
}

@end

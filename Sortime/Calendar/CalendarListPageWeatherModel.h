//
//  CalendarListPageWeatherModel.h
//  Sortime
//
//  Created by Calcifer on 15/11/25.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

//#import <Foundation/Foundation.h>
//@class UIImage;
//@interface CalendarListPageWeatherModel : NSObject
//@property (nonatomic, copy) NSString *imageName;
//@property (nonatomic, copy) NSString *locationLabelStr;
//@property (nonatomic, copy) NSString *windLabelStr;
//@property (nonatomic, copy) NSString *pMLabelStr;
//@property (nonatomic, copy) NSString *dayLabelStr;
//@property (nonatomic, copy) NSString *calendarLabelStr;
//@property (nonatomic, copy) NSString *weatherLabelStr;
//@end
#import <Foundation/Foundation.h>
#import "Mantle.h"
@protocol MTLJSONSerializing;
@interface CalendarListPageWeatherModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSString *cnty;//中国
@property (nonatomic, copy) NSString *city;//北京
@property (nonatomic, copy) NSString *cond_tex;//天气
@property (nonatomic, copy) NSString *wind_dir;//无持续风向
@property (nonatomic, copy) NSString *wind_sc;//微风
@property (nonatomic, copy) NSString *pm25;//pm2.5
@property (nonatomic, copy) NSString *tmp;//温度



- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
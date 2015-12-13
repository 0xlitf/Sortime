//
//  WeatherModel.h
//  Sortime
//
//  Created by Calcifer on 15/12/12.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mantle.h"
@protocol MTLJSONSerializing;
@interface WeatherModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSString *cnty;//中国
@property (nonatomic, copy) NSString *city;//北京
@property (nonatomic, copy) NSString *wind_dir;//无持续风向
@property (nonatomic, copy) NSString *wind_sc;//微风
@property (nonatomic, copy) NSString *pm25;//pm2.5
@property (nonatomic, copy) NSString *tmp;//温度


- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

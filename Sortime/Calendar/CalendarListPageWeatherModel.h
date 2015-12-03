//
//  CalendarListPageWeatherModel.h
//  Sortime
//
//  Created by Calcifer on 15/11/25.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UIImage;
@interface CalendarListPageWeatherModel : NSObject
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *locationLabelStr;
@property (nonatomic, copy) NSString *windLabelStr;
@property (nonatomic, copy) NSString *pMLabelStr;
@property (nonatomic, copy) NSString *dayLabelStr;
@property (nonatomic, copy) NSString *calendarLabelStr;
@property (nonatomic, copy) NSString *weatherLabelStr;
@end

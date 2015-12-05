//
//  NSDate+CalciferExtension.h
//  Sortime
//
//  Created by Calcifer on 15/11/25.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (CalciferExtension)
@property (nonatomic, assign) NSInteger yearValue;
@property (nonatomic, assign) NSInteger monthValue;
@property (nonatomic, assign) NSInteger dayValue;
@property (nonatomic, assign) NSInteger hourValue;
@property (nonatomic, assign) NSInteger minuteValue;
@property (nonatomic, assign) NSInteger secondValue;



+ (instancetype)days:(NSInteger)days Before:(NSDate *)date;

@end

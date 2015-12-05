//
//  UIImage+Extension.h
//  Sortime
//
//  Created by Calcifer on 15/11/30.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIImage (Extension)
- (UIImage *)imageAtRect:(CGRect)rect;
- (UIImage *)imageByScalingProportionallyToMinimumSize:(CGSize)targetSize;
- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;
- (UIImage *)imageByScalingToSize:(CGSize)targetSize;
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;

@end;
//
//  CCF_Extension.h
//  Sortime
//
//  Created by Calcifer on 15/12/5.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;
@end

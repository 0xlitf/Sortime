//
//  NSArray+NTLJSONKeyPath.h
//  Sortime
//
//  Created by Calcifer on 15/12/12.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray(NTLJSONKeyPath)

- (id)mtl_valueForJSONKeyPath:(NSString *)JSONKeyPath success:(BOOL *)success error:(NSError **)error;

@end

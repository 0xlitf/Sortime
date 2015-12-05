//
//  Singleton.h
//  Sortime
//
//  Created by Calcifer on 15/12/5.
//  Copyright © 2015年 com.Carcifer. All rights reserved.
//

#ifndef Singleton_h
#define Singleton_h

//单例化一个类 instanceMothed:单例的方法名称
#define instance_interface(className, instanceMothed)   \
\
+(instancetype)instanceMothed;

//实现方法
#define instance_implementation(className, instanceMothed)   \
\
static className *_instance; \
\
+(instancetype)instanceMothed \
{   static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc]init]; \
}); \
return _instance; \
} \
\
+(id)allocWithZone:(struct _NSZone *)zone { \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
\
-(id)copyWithZone:(NSZone *)zone { \
return _instance; \
}

#endif /* Singleton_h */

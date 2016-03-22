//
//  NSDictionary+MTLJSONKeyPath.m
//  Mantle
//
//  Created by Robert Böhnke on 19/03/14.
//  Copyright (c) 2014 GitHub. All rights reserved.
//

#import "NSDictionary+MTLJSONKeyPath.h"
#import "Mantle/NSArray+NTLJSONKeyPath.h"
#import "MTLJSONAdapter.h"

@implementation NSDictionary (MTLJSONKeyPath)
- (id)mtl_valueForJSONKeyPath:(NSString *)JSONKeyPath success:(BOOL *)success error:(NSError **)error {
	NSArray *components = [JSONKeyPath componentsSeparatedByString:@"."];
	
	id result = self;
	for (NSString *component in components) {
		// Check the result before resolving the key path component to not
		// affect the last value of the path.
		if (result == nil || result == NSNull.null) break;
		
		// 1. 这里增加了对 result 是否为数组的判断，如果是数组，就不要返回 nil 了
		if (![result isKindOfClass:NSDictionary.class] && ![result isKindOfClass:[NSArray class]]) {
			if (error != NULL) {
				NSDictionary *userInfo = @{
										   NSLocalizedDescriptionKey: NSLocalizedString(@"Invalid JSON dictionary", @""),
										   NSLocalizedFailureReasonErrorKey: [NSString stringWithFormat:NSLocalizedString(@"JSON key path %1$@ could not resolved because an incompatible JSON dictionary was supplied: \"%2$@\"", @""), JSONKeyPath, self]
										   };
				
				*error = [NSError errorWithDomain:MTLJSONAdapterErrorDomain code:MTLJSONAdapterErrorInvalidJSONDictionary userInfo:userInfo];
			}
			
			if (success != NULL) *success = NO;
			
			return nil;
		}
		
		//2. 判断 result 的类型，执行相应的方法
		if ([result isKindOfClass:NSDictionary.class]) {
			result = result[component];
		} else if ([result isKindOfClass:[NSArray class]]) {
			result = [(NSArray *)result mtl_valueForJSONKeyPath:component success:success error:error];
		}
		
	}
	
	if (success != NULL) *success = YES;
	
	return result;
}

//- (id)mtl_valueForJSONKeyPath:(NSString *)JSONKeyPath success:(BOOL *)success error:(NSError **)error {
//	NSArray *components = [JSONKeyPath componentsSeparatedByString:@"."];
//
//	id result = self;
//	for (NSString *component in components) {
//		// Check the result before resolving the key path component to not
//		// affect the last value of the path.
//		if (result == nil || result == NSNull.null) break;
//
//		if (![result isKindOfClass:NSDictionary.class]) {
//			if (error != NULL) {
//				NSDictionary *userInfo = @{
//					NSLocalizedDescriptionKey: NSLocalizedString(@"Invalid JSON dictionary", @""),
//					NSLocalizedFailureReasonErrorKey: [NSString stringWithFormat:NSLocalizedString(@"JSON key path %1$@ could not resolved because an incompatible JSON dictionary was supplied: \"%2$@\"", @""), JSONKeyPath, self]
//				};
//
//				*error = [NSError errorWithDomain:MTLJSONAdapterErrorDomain code:MTLJSONAdapterErrorInvalidJSONDictionary userInfo:userInfo];
//			}
//
//			if (success != NULL) *success = NO;
//
//			return nil;
//		}
//
//		result = result[component];
//	}
//
//	if (success != NULL) *success = YES;
//
//	return result;
//}

@end

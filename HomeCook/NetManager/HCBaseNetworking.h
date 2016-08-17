//
//  HCBaseNetworking.h
//  HomeCook
//
//  Created by tarena on 16/8/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HCBaseNetworking : NSObject

+ (id)GET:(NSString *)path parameters:(NSDictionary *)parameters completionHandler:(void(^)(id responseObj, NSError *error))completionHandler;

+ (id)POST:(NSString *)path parameters:(NSDictionary *)parameters completionHandler:(void(^)(id responseObj, NSError *error))completionHandler;

@end

//
//  HCNetManager.m
//  HomeCook
//
//  Created by tarena on 16/8/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HCNetManager.h"

@implementation HCNetManager

+ (id)getAdModelCompletionHandler:(void (^)(HCAdModel *, NSError *))completionHandler {
    
    NSMutableDictionary *paramDic = [NSMutableDictionary new];
    [paramDic setObject:@"110100" forKey:@"_cityid"];
    [paramDic setObject:@"1A3FAB1E-0FF5-471D-AE0F-4ED1E5B55DF3" forKey:@"_device"];
    [paramDic setObject:@"91577D73-DDF9-4151-BB86-AA3596963582" forKey:@"_idfa"];
    [paramDic setObject:@"10.0" forKey:@"_osversion"];
    [paramDic setObject:@"iOS" forKey:@"_platform"];
    [paramDic setObject:@"375*667" forKey:@"_screen"];
    [paramDic setObject:@"2016-08-16 08:20:50" forKey:@"_time"];
    [paramDic setObject:@"2.9.1" forKey:@"_version"];
    [paramDic setObject:@"116.469235297309,39.88134792751736" forKey:@"coordinate"];
    [paramDic setObject:@"0" forKey:@"type"];
    [paramDic setObject:@"116.469235297309,39.88134792751736" forKey:@"user_coordinate"];
    
    return [self POST:kAdPath parameters:paramDic completionHandler:^(id responseObj, NSError *error) {
        !completionHandler?:completionHandler([HCAdModel parse:responseObj], error);
    }];

}

+ (id)getActivityModelCompletionHandler:(void (^)(HCActivityModel *, NSError *))completionHandler {
    NSMutableDictionary *paramDic = [NSMutableDictionary new];
    [paramDic setObject:@"110100" forKey:@"cityId"];
    [paramDic setObject:@"1A3FAB1E-0FF5-471D-AE0F-4ED1E5B55DF3" forKey:@"device"];
    [paramDic setObject:@"91577D73-DDF9-4151-BB86-AA3596963582" forKey:@"idfa"];
    [paramDic setObject:@"10.0" forKey:@"osVersion"];
    [paramDic setObject:@"iOS" forKey:@"platform"];
    [paramDic setObject:@"375*667" forKey:@"screen"];
    [paramDic setObject:@"2016-08-16 08:20:50" forKey:@"time"];
    [paramDic setObject:@"2.9.1" forKey:@"version"];
    [paramDic setObject:@"116.469235297309,39.88134792751736" forKey:@"coordinate"];
    [paramDic setObject:@"116.469235297309,39.88134792751736" forKey:@"user_coordinate"];
    
    return [self POST:kActivityPath parameters:paramDic completionHandler:^(id responseObj, NSError *error) {
        !completionHandler?:completionHandler([HCActivityModel parse:responseObj], error);
    }];

}

@end

//
//  HCBaseNetworking.m
//  HomeCook
//
//  Created by tarena on 16/8/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HCBaseNetworking.h"

@implementation HCBaseNetworking

+ (id)GET:(NSString *)path parameters:(NSDictionary *)parameters completionHandler:(void (^)(id, NSError *))completionHandler {
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
    return [manager GET:path parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", task.currentRequest.URL.absoluteString);
        //缓存
        NSString *cachePath = [docPath stringByAppendingPathComponent:task.currentRequest.URL.absoluteString.md5String];
        [[NSOperationQueue new] addOperationWithBlock:^{
            [NSKeyedArchiver archiveRootObject:responseObject toFile:cachePath];
        }];
        !completionHandler?:completionHandler(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", task.currentRequest.URL.absoluteString);
        NSLog(@"%@", error);
        //读缓存
        NSString *cachePath = [docPath stringByAppendingPathComponent:task.currentRequest.URL.absoluteString.md5String];
        id responseObj = [NSKeyedUnarchiver unarchiveObjectWithFile:cachePath];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            if (responseObj) {
                !completionHandler?:completionHandler(responseObj, nil);
            } else {
                !completionHandler?:completionHandler(nil, error);
            }
        }];
        
    }];
}

+ (id)POST:(NSString *)path parameters:(NSDictionary *)parameters completionHandler:(void (^)(id, NSError *))completionHandler {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
    return [manager POST:path parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", task.currentRequest.URL.absoluteString);
        !completionHandler?:completionHandler(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", task.currentRequest.URL.absoluteString);
        NSLog(@"%@", error);
        !completionHandler?:completionHandler(nil, error);
    }];

}

@end

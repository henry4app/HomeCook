//
//  AppDelegate.m
//  HomeCook
//
//  Created by tarena on 16/8/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "HCNetManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self configSystem:launchOptions];
    [HCNetManager getAdModelCompletionHandler:^(HCAdModel *model, NSError *error) {
        NSLog(@"");
    }];
    return YES;
}



@end

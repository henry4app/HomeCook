//
//  HCNetManager.h
//  HomeCook
//
//  Created by tarena on 16/8/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HCBaseNetworking.h"
#import "HCAdModel.h"


@interface HCNetManager : HCBaseNetworking

// 主页广告
+ (id)getAdModelCompletionHandler:(void(^)(HCAdModel *model, NSError *error))completionHandler;

@end

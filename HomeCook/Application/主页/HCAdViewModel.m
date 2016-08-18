//
//  HCAdViewModel.m
//  HomeCook
//
//  Created by tarena on 16/8/17.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HCAdViewModel.h"

@implementation HCAdViewModel

- (NSInteger)items {
    return _dataList.count;
}

- (NSURL *)imageURL:(NSInteger)index {
    return _dataList[index].image_url.hc_URL;
}

- (NSURL *)jumpURL:(NSInteger)index {
    return _dataList[index].jump_url.hc_URL;
}

- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler {
    
    __block int total = 2;
    
    [HCNetManager getAdModelCompletionHandler:^(HCAdModel *model, NSError *error) {
        total--;
        self.dataList = model.data.list;
        if (total == 0) {
            !completionHandler ? : completionHandler(error);
        }
        
        
    }];
    
    [HCNetManager getActivityModelCompletionHandler:^(HCActivityModel *model, NSError *error) {
        total--;
        self.activityDataList = model.data.list;
        if (total == 0) {
            !completionHandler ? : completionHandler(error);
        }
    }];
    
    
}

- (NSURL *)activityImgURL:(NSInteger)index {
    return self.activityDataList[index].imageUrl.hc_URL;
}

- (NSURL *)activityJumpURL:(NSInteger)index {
    return self.activityDataList[index].jumpUrl.hc_URL;
}

- (NSString *)activityTitle:(NSInteger)index {
    return self.activityDataList[index].title;
}

@end

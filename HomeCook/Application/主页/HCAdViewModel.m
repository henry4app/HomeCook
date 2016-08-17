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
    
    self.dataTask = [HCNetManager getAdModelCompletionHandler:^(HCAdModel *model, NSError *error) {
        self.dataList = model.data.list;
        !completionHandler ? : completionHandler(error);
    }];
    
    
}

@end

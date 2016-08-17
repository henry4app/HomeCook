//
//  HCAdModel.m
//  HomeCook
//
//  Created by tarena on 16/8/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HCAdModel.h"

@implementation HCAdModel

@end

@implementation HCAdDataModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"list": [HCAdDataListModel class]};
}

@end


@implementation HCAdDataListModel

@end



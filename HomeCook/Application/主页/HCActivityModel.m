//
//  HCActivityModel.m
//  HomeCook
//
//  Created by tarena on 16/8/18.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HCActivityModel.h"

@implementation HCActivityModel

@end

@implementation HCActivityDataModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"list":[HCActivityDataListModel class]};
}

@end


@implementation HCActivityDataListModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"ID":@"id"};
}

@end



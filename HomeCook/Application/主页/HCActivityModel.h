//
//  HCActivityModel.h
//  HomeCook
//
//  Created by tarena on 16/8/18.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HCActivityDataModel,HCActivityDataListModel;
@interface HCActivityModel : NSObject


@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) HCActivityDataModel *data;

@property (nonatomic, assign) NSInteger code;


@end
@interface HCActivityDataModel : NSObject

@property (nonatomic, strong) NSArray<HCActivityDataListModel *> *list;

@end

@interface HCActivityDataListModel : NSObject
// id->ID
@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, assign) NSInteger showDot;

@property (nonatomic, assign) NSInteger dotType;

@property (nonatomic, copy) NSString *dotVersion;

@property (nonatomic, copy) NSString *dotMsg;

@property (nonatomic, copy) NSString *imageUrl;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) NSInteger action;

@property (nonatomic, copy) NSString *jumpUrl;

@property (nonatomic, assign) NSInteger cityId;

@property (nonatomic, copy) NSString *content;

@end


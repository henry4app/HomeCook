//
//  HCAdModel.h
//  HomeCook
//
//  Created by tarena on 16/8/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HCAdDataModel,HCAdDataListModel;
@interface HCAdModel : NSObject


@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) HCAdDataModel *data;

@property (nonatomic, assign) NSInteger code;


@end
@interface HCAdDataModel : NSObject

@property (nonatomic, strong) NSArray<HCAdDataListModel *> *list;

@end

@interface HCAdDataListModel : NSObject

@property (nonatomic, assign) NSInteger focus_id;

@property (nonatomic, copy) NSString *jump_url;

@property (nonatomic, copy) NSString *image_url;
// description -> desc
@property (nonatomic, copy) NSString *desc;

@property (nonatomic, assign) NSInteger position;

@property (nonatomic, assign) NSInteger action;

@end


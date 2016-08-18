//
//  HCAdViewModel.h
//  HomeCook
//
//  Created by tarena on 16/8/17.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "HCAdModel.h"
#import "HCNetManager.h"
#import "HCActivityModel.h"

@interface HCAdViewModel : BaseViewModel

@property (nonatomic) NSInteger items;
- (NSURL *)imageURL:(NSInteger)index;
- (NSURL *)jumpURL:(NSInteger)index;

@property (nonatomic) NSArray<HCAdDataListModel *> *dataList;

- (NSURL *)activityImgURL:(NSInteger)index;
- (NSURL *)activityJumpURL:(NSInteger)index;
- (NSString *)activityTitle:(NSInteger)index;

@property (nonatomic) NSArray<HCActivityDataListModel *> *activityDataList;

@end

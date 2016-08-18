//
//  UIScrollView+Refresh.m
//  HomeCook
//
//  Created by tarena on 16/8/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "UIScrollView+Refresh.h"
#import "HCRefreshGifHeader.h"
@implementation UIScrollView (Refresh)

- (void)addHeaderRefresh:(void(^)())block {
    MJRefreshGifHeader *header = [HCRefreshGifHeader headerWithRefreshingBlock:block];
    
    NSArray *imageNames = @[@"pot_00000",
                            @"pot_00001",
                            @"pot_00002",
                            @"pot_00003",
                            @"pot_00004",
                            @"pot_00005",
                            @"pot_00006",
                            @"pot_00007",
                            @"pot_00008",
                            @"pot_00009",
                            @"pot_00010",
                            @"pot_00011"];
    
    UIImage *idleImage = [UIImage imageNamed:@"pot_00000"];
    NSArray *idleImages = @[idleImage];
    
    NSMutableArray *pullingImages = [NSMutableArray new];
    [imageNames enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImage *image = [UIImage imageNamed:obj];
        
        [pullingImages addObject:image];
    }];
    
    [header setImages:idleImages forState:MJRefreshStateIdle];
    [header setImages:pullingImages forState:MJRefreshStatePulling];
    [header setImages:pullingImages forState:MJRefreshStateRefreshing];
    header.lastUpdatedTimeLabel.hidden = YES;
    [header setTitle:@"小锅小灶・上门审核・健康认证・人保保险" forState:MJRefreshStateIdle];
    [header setTitle:@"小锅小灶・上门审核・健康认证・人保保险" forState:MJRefreshStateRefreshing];
    [header setTitle:@"小锅小灶・上门审核・健康认证・人保保险" forState:MJRefreshStatePulling];
    header.stateLabel.font = [UIFont systemFontOfSize:12];
    header.stateLabel.textColor = kRGB(249, 209, 88, 1);
    
    
    self.mj_header = header;

}



- (void)addFooterRefresh:(void(^)())block {
    self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:block];
}

- (void)beginHeaderRefresh {
    [self.mj_header beginRefreshing];

}
- (void)endHeaderRefresh {
    [self.mj_header endRefreshing];
}

- (void)endFooterRefresh {
    [self.mj_header endRefreshing];
}

@end

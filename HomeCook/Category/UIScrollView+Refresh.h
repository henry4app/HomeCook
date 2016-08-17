//
//  UIScrollView+Refresh.h
//  HomeCook
//
//  Created by tarena on 16/8/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Refresh)

- (void)addHeaderRefresh:(void(^)())block;
- (void)addFooterRefresh:(void(^)())block;

- (void)beginHeaderRefresh;
- (void)endHeaderRefresh;

- (void)endFooterRefresh;

@end

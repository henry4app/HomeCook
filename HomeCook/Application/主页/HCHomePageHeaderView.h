//
//  HCHomePageHeaderView.h
//  HomeCook
//
//  Created by tarena on 16/8/17.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HCHomePageHeaderView;

@protocol HCAdViewDataSource <NSObject>

- (NSInteger)numberOfItemsInAdView:(HCHomePageHeaderView *)view;
- (NSURL *)iconURLForItemInAdView:(HCHomePageHeaderView *)view atIndex:(NSInteger)index;
- (NSURL *)iconURLForItemsInActivityView:(HCHomePageHeaderView *)view atIndex:(NSInteger)index;
- (NSString *)titleForItemsInActivityView:(HCHomePageHeaderView *)view atIndex:(NSInteger)index;


@end

@protocol HCAdViewDelegate <NSObject>

- (void)adView:(HCHomePageHeaderView *)view didSelectIconAtIndex:(NSInteger)index;

//- (void)adView:(HCHomePageHeaderView *)view didSelectActivityIconAtIndex:(NSInteger)index handler:(void(^)(id))handler;
@end


@interface HCHomePageHeaderView : UIView<iCarouselDataSource, iCarouselDelegate>

@property (nonatomic) iCarousel *ic;
@property (nonatomic) UIPageControl *pageControl;

@property (nonatomic, weak) id<HCAdViewDataSource> dataSource;
@property (nonatomic, weak) id<HCAdViewDelegate> delegate;

- (void)reloadData;

@property (nonatomic) NSTimer *timer;

@property (nonatomic) NSArray<UIImageView *> *activityImageViewList;
@property (nonatomic) NSArray<UILabel *> *activityLabelList;



@end

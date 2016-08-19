//
//  HCHomePageHeaderView.m
//  HomeCook
//
//  Created by tarena on 16/8/17.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HCHomePageHeaderView.h"


@implementation HCHomePageHeaderView

- (iCarousel *)ic {
    if (!_ic) {
        _ic = [self viewWithTag:100];
        _ic.pagingEnabled = YES;
    }
    return _ic;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [self viewWithTag:200];
    }
    return _pageControl;
}

- (void)awakeFromNib {
    [self ic];
    [self pageControl];
    [self activityImageViewList];
    [self activityLabelList];
    [self headerBtnList];

}

- (NSArray<UIButton *> *)headerBtnList {
    if(_headerBtnList == nil) {
        NSMutableArray *tmpArr = [NSMutableArray new];
        for (int i = 20; i <= 25; i++) {
            UIButton *button = [self viewWithTag:i];
            [tmpArr addObject:button];
            [button addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return _headerBtnList;
}

- (NSArray<UIImageView *> *)activityImageViewList {
    if (!_activityLabelList) {
        NSMutableArray *tmpArr = [NSMutableArray new];
        for (int i = 1; i <= 6 ; i++) {
            UIImageView *imageView = [self viewWithTag:i];
            [tmpArr addObject:imageView];
        }
        _activityImageViewList = tmpArr.mutableCopy;
    }
    return _activityImageViewList;
}

- (NSArray<UILabel *> *)activityLabelList {
    if (!_activityLabelList) {
        NSMutableArray *tmpArr = [NSMutableArray new];
        for (int i = 10; i <= 13; i++) {
            UILabel *label = [self viewWithTag:i];
            [tmpArr addObject:label];
        }
        _activityLabelList = tmpArr.mutableCopy;
    }
    return _activityLabelList;
}

#pragma mark - iCarouselDataSource

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    if ([_dataSource respondsToSelector:@selector(numberOfItemsInAdView:)]) {
        return [_dataSource numberOfItemsInAdView:self];
    }
    return 0;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view {
    if (view == nil) {
        view = [[UIImageView alloc] initWithFrame:carousel.bounds];
    }
    if ([_dataSource respondsToSelector:@selector(iconURLForItemInAdView:atIndex:)]) {
        [((UIImageView *)view) setImageWithURL:[_dataSource iconURLForItemInAdView:self atIndex:index] placeholder:nil];
    }
    return view;
}

#pragma mark - iCarouselDelegate

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel {
    _pageControl.currentPage = carousel.currentItemIndex;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index {
    if ([_delegate respondsToSelector:@selector(carousel:didSelectItemAtIndex:)]) {
        [_delegate adView:self didSelectIconAtIndex:index];

    }
}


- (void)btnClicked:(UIButton *)button {
    //NSLog(@"%ld", button.tag);
    NSInteger index = button.tag - 20;
    if ([_delegate respondsToSelector:@selector(adView:didSelectActivityIconAtIndex:)]) {
        [_delegate adView:self didSelectActivityIconAtIndex:index];
    }
}


- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value {
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}

#pragma mark - Method
- (void)reloadData {
    if ([_dataSource respondsToSelector:@selector(numberOfItemsInAdView:)]) {
        _pageControl.numberOfPages = [_dataSource numberOfItemsInAdView:self];
    }
    [_ic reloadData];
    
    [self setImage];
    [self setTitle];
    
    [_timer invalidate];
    _timer = nil;
    _timer = [NSTimer bk_scheduledTimerWithTimeInterval:2 block:^(NSTimer *timer) {
        [self.ic scrollToItemAtIndex:_ic.currentItemIndex + 1 animated:YES];
    } repeats:YES];
}

- (void)setImage {
    NSUInteger count = self.activityImageViewList.count;
    if ([_dataSource respondsToSelector:@selector(iconURLForItemsInActivityView:atIndex:)]) {
        for (int i = 0; i < count; i++) {
            [self.activityImageViewList[i] setImageWithURL:[_dataSource iconURLForItemsInActivityView:self atIndex:i] placeholder:nil];
        }
    }
   
}

- (void)setTitle {
    NSUInteger count = self.activityLabelList.count;
    if ([_dataSource respondsToSelector:@selector(titleForItemsInActivityView:atIndex:)]) {
        for (int i = 0; i < count; i++) {
            self.activityLabelList[i].text = [_dataSource titleForItemsInActivityView:self atIndex:i];
        }
    }
}







@end

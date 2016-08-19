//
//  HCHomePageViewController.m
//  HomeCook
//
//  Created by tarena on 16/8/17.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HCHomePageViewController.h"
#import "HCHomePageHeaderView.h"
#import "HCAdViewModel.h"
#import "HCPopADViewController.h"
#import "HCAdPresentingAnimator.h"
#import "HCAdDismissingAnimator.h"

@interface HCHomePageViewController ()<UIViewControllerTransitioningDelegate, UITableViewDelegate, UITableViewDataSource, HCAdViewDataSource, HCAdViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet HCHomePageHeaderView *headerView;
@property (nonatomic) HCAdViewModel *adViewModel;
@end

@implementation HCHomePageViewController

#pragma mark - UIViewControllerTransitioningDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [HCAdPresentingAnimator new];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [HCAdDismissingAnimator new];
}

#pragma mark - HCAdViewDataSource

- (NSInteger)numberOfItemsInAdView:(HCHomePageHeaderView *)view {
    return self.adViewModel.items;
}

- (NSURL *)iconURLForItemInAdView:(HCHomePageHeaderView *)view atIndex:(NSInteger)index {
    return [self.adViewModel imageURL:index];
}

- (NSURL *)iconURLForItemsInActivityView:(HCHomePageHeaderView *)view atIndex:(NSInteger)index {
    return [self.adViewModel activityImgURL:index];
}

- (NSString *)titleForItemsInActivityView:(HCHomePageHeaderView *)view atIndex:(NSInteger)index {
    return [self.adViewModel activityTitle:index];
}

#pragma mark - HCAdViewDelegate

- (void)adView:(HCHomePageHeaderView *)view didSelectIconAtIndex:(NSInteger)index {
    NSLog(@"%@", [self.adViewModel jumpURL:index]);
}

- (void)adView:(HCHomePageHeaderView *)view didSelectActivityIconAtIndex:(NSInteger)index {
    NSLog(@"%@", [self.adViewModel activityTitle:index]);
    NSLog(@"%@", [self.adViewModel activityJumpURL:index]);
}


#pragma mark - Lazy load

- (HCAdViewModel *)adViewModel {
    if (!_adViewModel) {
        _adViewModel = [HCAdViewModel new];
    }
    return _adViewModel;
}




#pragma mark - View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    HCPopADViewController *PopADVC = [HCPopADViewController new];
    PopADVC.transitioningDelegate = self;
    PopADVC.modalPresentationStyle = UIModalPresentationCustom;
    [self.navigationController presentViewController:PopADVC animated:YES completion:nil];
    
    _headerView.delegate = self;
    _headerView.dataSource = self;
    
    MJWeakSelf
    [self.tableView addHeaderRefresh:^{
        [weakSelf.adViewModel getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
            [weakSelf.headerView reloadData];
            
            [weakSelf.tableView reloadData];
            
            [weakSelf.tableView endHeaderRefresh];
            if (error) {
                [self.view showWarning:@"网络异常"];
            }
            
            
        }];
    }];
    [self.tableView beginHeaderRefresh];
    
    
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

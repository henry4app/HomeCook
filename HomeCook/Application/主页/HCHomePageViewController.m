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

@interface HCHomePageViewController ()<UITableViewDelegate, UITableViewDataSource, HCAdViewDataSource, HCAdViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet HCHomePageHeaderView *headerView;
@property (nonatomic) HCAdViewModel *adViewModel;
@end

@implementation HCHomePageViewController
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

    
    [_headerView.activityImageViewList[0] bk_whenTapped:^{
        NSLog(@"%@", [self.adViewModel activityJumpURL:0]);
    }];
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

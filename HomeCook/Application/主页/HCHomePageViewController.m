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

@interface HCHomePageViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet HCHomePageHeaderView *headerView;
@property (nonatomic) HCAdViewModel *adViewModel;
@end

@implementation HCHomePageViewController

- (HCAdViewModel *)adViewModel {
    if (!_adViewModel) {
        _adViewModel = [HCAdViewModel new];
    }
    return _adViewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MJWeakSelf
    [self.tableView addHeaderRefresh:^{
        [weakSelf.adViewModel getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
            [weakSelf.tableView reloadData];
            [weakSelf.tableView endHeaderRefresh];
            NSLog(@"");
        }];
    }];
    [self.tableView beginHeaderRefresh];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

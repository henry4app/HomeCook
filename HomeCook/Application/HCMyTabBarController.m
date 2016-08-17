//
//  HCMyTabBarController.m
//  HomeCook
//
//  Created by tarena on 16/8/17.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HCMyTabBarController.h"

@interface HCMyTabBarController ()

@end

@implementation HCMyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureTabBar];

}

- (void)configureTabBar {

    [UITabBar appearance].tintColor = HCMainColor;
    [UITabBar appearance].barTintColor = [UIColor whiteColor];
    
    //主页
    UIStoryboard *home = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
    UIViewController *homeController = [home instantiateInitialViewController];
    //发现
    UIStoryboard *discover = [UIStoryboard storyboardWithName:@"Discover" bundle:nil];
    UIViewController *discoverController = [discover instantiateInitialViewController];
    //我的
    UIStoryboard *mine = [UIStoryboard storyboardWithName:@"Mine" bundle:nil];
    UIViewController *mineController = [mine instantiateInitialViewController];
    
    //此处改用Storyboard设置title以及image
//    mineController.title = @"我的";
//    mineController.tabBarItem.image = [UIImage imageNamed:@"my_unsel"];
//    mineController.tabBarItem.selectedImage = [UIImage imageNamed:@"my_sel"];
    
    self.viewControllers = @[homeController,discoverController,mineController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

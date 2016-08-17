//
//  UIView+HUD.h
//  HomeCook
//
//  Created by tarena on 16/8/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HUD)

- (void)showHUD;
- (void)hideHUD;
- (void)showWarning:(NSString *)msg;

@end

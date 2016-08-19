//
//  HCAdPresentingAnimator.m
//  HomeCook
//
//  Created by tarena on 16/8/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HCAdPresentingAnimator.h"

@implementation HCAdPresentingAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.5f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *containerView = transitionContext.containerView;
    
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    fromView.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
    fromView.userInteractionEnabled = NO;
    
    UIView *dimmingView = [[UIView alloc] initWithFrame:fromView.bounds];
    dimmingView.backgroundColor = kRGB(0, 0, 0, 1);
    dimmingView.layer.opacity = 0.0;
    NSLog(@"width %f,height %f", dimmingView.frame.size.width, dimmingView.frame.size.height);
    
    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    // 560 * 750
    CGFloat width = CGRectGetWidth(containerView.bounds) * 0.75;
    CGFloat height = width * 750 / 560;
    toView.frame = CGRectMake(0, 0, width, height);
    toView.center = CGPointMake(containerView.center.x, -containerView.center.y);
    
    [containerView addSubview:dimmingView];
    [containerView addSubview:toView];
    
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    positionAnimation.toValue = @(containerView.center.y);
    positionAnimation.springBounciness = 10;
    
    [positionAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
    
    POPBasicAnimation *opacityAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    opacityAnimation.toValue = @(0.8);
    
    
    [toView.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
    [dimmingView.layer pop_addAnimation:opacityAnimation forKey:@"opacityAnimation"];
}

@end

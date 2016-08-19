//
//  HCAdDismissingAnimator.m
//  HomeCook
//
//  Created by tarena on 16/8/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HCAdDismissingAnimator.h"

@implementation HCAdDismissingAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.5f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.view.tintAdjustmentMode = UIViewTintAdjustmentModeNormal;
    toVC.view.userInteractionEnabled = YES;
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    __block UIView *dimmingView;
    [transitionContext.containerView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.layer.opacity < 1.f) {
            dimmingView = obj;
            *stop = YES;
        }
    }];
    
    POPBasicAnimation *opacityAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    opacityAnimation.toValue = @0;
    
    POPBasicAnimation *offScreenAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    offScreenAnimation.toValue = @(-fromVC.view.layer.position.y);
    [offScreenAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
    [fromVC.view.layer pop_addAnimation:offScreenAnimation forKey:@"offScreenAnimation"];
    [dimmingView.layer pop_addAnimation:opacityAnimation forKey:@"opacityAnimation"];
}

@end

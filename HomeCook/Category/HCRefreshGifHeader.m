//
//  HCRefreshGifHeader.m
//  HomeCook
//
//  Created by tarena on 16/8/18.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HCRefreshGifHeader.h"

@implementation HCRefreshGifHeader

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)placeSubviews {
    [super placeSubviews];
    self.gifView.frame = CGRectMake(self.frame.size.width / 2 - 20, 0, 46, 46);
    self.gifView.contentMode = UIViewContentModeScaleAspectFill;
    CGRect labelFrame = self.stateLabel.frame;
    labelFrame.origin.y = 20;

    self.stateLabel.frame = labelFrame;

}

@end

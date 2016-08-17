//
//  NSString+URL.m
//  HomeCook
//
//  Created by tarena on 16/8/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NSString+URL.h"

@implementation NSString (URL)

- (NSURL *)hc_URL {
    return [NSURL URLWithString:self];
}

@end

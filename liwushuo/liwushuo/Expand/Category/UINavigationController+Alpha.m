//
//  UINavigationController+Alpha.m
//  liwushuo
//
//  Created by lee on 2017/12/25.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "UINavigationController+Alpha.h"

@implementation UINavigationController (Alpha)

static char overlayKey;

- (UIView *)overlay
{
    return objc_getAssociatedObject(self, &overlayKey);
}

- (void)setOverlay:(UIView *)overlay
{
    objc_setAssociatedObject(self, &overlayKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

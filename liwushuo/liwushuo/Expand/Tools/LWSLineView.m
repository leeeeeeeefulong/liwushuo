//
//  LWSLineView.m
//  liwushuo
//
//  Created by PinelliaZeit on 2018/1/27.
//  Copyright © 2018年 Pinellia Zeit. All rights reserved.
//

#import "LWSLineView.h"

@implementation LWSLineView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self baseUI];
    }
    return self;
}

- (void)baseUI
{
    self.backgroundColor = rgba(240, 230, 230, 1.0);
}

@end

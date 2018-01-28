//
//  LWSShareViewCell.m
//  liwushuo
//
//  Created by PinelliaZeit on 2018/1/26.
//  Copyright © 2018年 Pinellia Zeit. All rights reserved.
//

#import "LWSShareViewCell.h"

@implementation LWSShareViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self drawUI];
    }
    return self;
         
}

- (void)drawUI
{
    UIImageView *imageV = [[UIImageView alloc] init];
    [self addSubview:imageV];
    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(25);
        make.centerX.equalTo(self);
        make.height.with.mas_equalTo(@36);
    }];
    self.imageV = imageV;
    
    UILabel *title = [[UILabel alloc] init];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageV.mas_bottom).offset(6);
        make.centerX.equalTo(self);
    }];
    title.textColor = rgba(155, 150, 150, 1.0);
    title.font = [UIFont fontWithName:@"PingFangSC-Regular" size:11];
    title.textAlignment = NSTextAlignmentCenter;
    self.title = title;
}
@end


//
//  LWSMeImageBubbleView.m
//  liwushuo
//
//  Created by lee on 2017/12/29.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSMeImageBubbleView.h"

@implementation LWSMeImageBubbleView

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
    UIImageView *imageView = [[UIImageView alloc] init];
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(@24);
        make.top.equalTo(self).offset(2);
        make.centerX.equalTo(self);
    }];
    self.imageView = imageView;
    
    UILabel *title = [[UILabel alloc] init];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView.mas_bottom).offset(3);
        make.centerX.equalTo(self);
    }];
    title.textColor = rgba(50, 30, 30, 1.0);
    title.textAlignment = NSTextAlignmentCenter;
    title.font = [UIFont fontWithName:@"PingFangSC-Light" size:11];
    self.titleLabel = title;
    
    UILabel *bageCount = [[UILabel alloc] init];
    [self addSubview:bageCount];
    [bageCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(@12);
        make.left.equalTo(imageView.mas_right);
        make.top.equalTo(imageView.mas_top).offset(-2);
    }];
    bageCount.textColor = rgba(255, 255, 255, 1.0);
    bageCount.textAlignment = NSTextAlignmentCenter;
    bageCount.font = [UIFont fontWithName:@"Helvetica-Bold" size:9];
    bageCount.backgroundColor = rgba(255, 66, 88, 1.0);
    bageCount.layer.cornerRadius = 6.0;
    bageCount.layer.masksToBounds = YES;
    bageCount.hidden = YES;
    self.bageCountLabel = bageCount;
    
    UITapGestureRecognizer *tapGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickAction)];
    [self addGestureRecognizer:tapGest];
    
}

- (void)clickAction
{
    !_clickBlock ? : _clickBlock();
}

@end


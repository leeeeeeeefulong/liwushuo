//
//  LWSGiftCategoryReusableView.m
//  liwushuo
//
//  Created by lee on 2017/12/18.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSGiftCategoryReusableView.h"

@interface LWSGiftCategoryReusableView ()

@property (nonatomic, strong) UIView *leftLineView;
@property (nonatomic, strong) UIView *rightLineView;

@end

@implementation LWSGiftCategoryReusableView

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
    self.titleLabel = [[UILabel alloc] init];
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    self.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    self.titleLabel.textColor = RGBA(142, 142, 147, 1.0);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    self.leftLineView = [[UIView alloc] init];
    [self addSubview:self.leftLineView];
    [self.leftLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(8);
        make.right.equalTo(self.titleLabel.mas_left).offset(-8);
        make.centerY.equalTo(self.titleLabel);
        make.height.mas_equalTo(@0.5555);
    }];
    self.leftLineView.backgroundColor = rgba(224, 224, 224, 1.0);
    
    self.rightLineView = [[UIView alloc] init];
    [self addSubview:self.rightLineView];
    [self.rightLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-8);
        make.left.equalTo(self.titleLabel.mas_right).offset(8);
        make.centerY.height.equalTo(self.leftLineView);
    }];
    self.rightLineView.backgroundColor = self.leftLineView.backgroundColor;
    
}
@end

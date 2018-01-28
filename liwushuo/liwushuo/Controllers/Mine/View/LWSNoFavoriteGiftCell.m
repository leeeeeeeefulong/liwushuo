//
//  LWSNoFavoriteGiftCell.m
//  liwushuo
//
//  Created by lee on 2017/12/29.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSNoFavoriteGiftCell.h"

@interface LWSNoFavoriteGiftCell ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation LWSNoFavoriteGiftCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.image = [UIImage imageNamed:@"btn_like_default_24x24_"];
        self.titleLabel.text = @"暂无喜欢";
        self.backgroundColor = rgba(250, 245, 245, 1.0);
    }
    return self;
}


#pragma mark - Getts
- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        [self addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.centerY.equalTo(self).offset(-10);
            make.width.height.mas_equalTo(20);
        }];
    }
    return _imageView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imageView.mas_bottom).offset(3);
            make.centerX.equalTo(self);
        }];
        _titleLabel.textColor = rgba(160, 150, 150, 1.0);
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:9];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
@end

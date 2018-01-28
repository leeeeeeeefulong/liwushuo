//
//  LWSGiftCategoryCell.m
//  liwushuo
//
//  Created by lee on 2017/12/15.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSGiftCategoryCell.h"
#import "Subcategories.h"
@implementation LWSGiftCategoryCell


- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imageView.mas_bottom).offset(9);
            make.centerX.equalTo(self);
        }];
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = RGBA(51, 51, 51, 1.0);
    }
    return _titleLabel;
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        [self addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self);
            make.height.mas_equalTo(@98);
        }];
    }
    return _imageView;
}

- (void)setModel:(Subcategories *)model
{
    _model = model;
    self.titleLabel.text = model.name;
    [self.imageView setImageWithURL:[NSURL URLWithString:model.iconUrl]
                          completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) { }
        usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
}

@end

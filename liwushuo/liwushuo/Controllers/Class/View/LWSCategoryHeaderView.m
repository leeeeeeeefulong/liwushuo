//
//  LWSCategoryHeaderView.m
//  liwushuo
//
//  Created by lee on 2017/12/14.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSCategoryHeaderView.h"

@implementation LWSCategoryHeaderView

#pragma mark - button Click Event
- (void)buttonClick:(UIButton *)button
{
    !self.headButtonClickBlock ? : self.headButtonClickBlock(button);
}

- (UILabel *)headTitleLabel
{
    if (!_headTitleLabel) {
        _headTitleLabel = [[UILabel alloc] init];
        [self addSubview:_headTitleLabel];
        [_headTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(12);
            make.centerY.equalTo(self);
        }];
        _headTitleLabel.textColor = RGBA(140, 120, 120, 1.0);
        _headTitleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _headTitleLabel.textAlignment = NSTextAlignmentNatural;
    }
    return _headTitleLabel;
}

- (UIButton *)headFullGroupButton
{
    if (!_headFullGroupButton) {
        
        _headFullGroupButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_headFullGroupButton];
        [_headFullGroupButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-9);
            make.centerY.equalTo(self);
            make.height.equalTo(self);
        }];
        [_headFullGroupButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_headFullGroupButton setTitleColor:rgba(80, 60, 60, 1.0) forState:UIControlStateNormal];
        [_headFullGroupButton setTitle:@"查看全部" forState:UIControlStateNormal];
        [_headFullGroupButton setImage:[UIImage imageNamed:@"btn_arrow_right_12x12_"] forState:UIControlStateNormal];
        _headFullGroupButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _headFullGroupButton.titleLabel.textAlignment = NSTextAlignmentLeft;
        _headFullGroupButton.titleEdgeInsets = UIEdgeInsetsMake(0, -17, 0, 0);
        _headFullGroupButton.imageEdgeInsets = UIEdgeInsetsMake(0, 53, 0, -53);
    }
    return _headFullGroupButton;
}

@end

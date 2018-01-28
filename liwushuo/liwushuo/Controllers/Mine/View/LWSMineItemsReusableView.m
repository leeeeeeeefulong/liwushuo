//
//  LWSMineItemsReusableView.m
//  liwushuo
//
//  Created by lee on 2017/12/29.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSMineItemsReusableView.h"
#import "LWSFavoriteLists.h"
@interface LWSMineItemsReusableView()

@property (nonatomic, strong) UILabel *titleLable;

@property (nonatomic, strong) UILabel *defaultLabel;

@property (nonatomic, strong) UILabel *itemsCountLabel;

@property (nonatomic, strong) UIImageView *arrowImageView;

@end

@implementation LWSMineItemsReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = rgba(255, 254, 254, 1.0);
    }
    return self;
}

- (void)setModel:(LWSFavoriteLists *)model
{
    _model = model;
    self.titleLable.text = model.name;
    self.defaultLabel.hidden = !model.defaultFavoriteList;
    self.itemsCountLabel.text = [NSString stringWithFormat:@"共%.f个",model.itemsCount];
    self.arrowImageView.image = [UIImage imageNamed:@"btn_arrow_right_12x12_"];
}

#pragma mark - Getts
- (UILabel *)titleLable
{
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] init];
        [self addSubview:_titleLable];
        [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(30);
            make.left.equalTo(self).offset(16.56);
        }];
        _titleLable.textColor = rgba(50, 30, 30, 1.0);
        _titleLable.textAlignment = NSTextAlignmentNatural;
        _titleLable.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
    }
    return _titleLable;
}

- (UILabel *)defaultLabel
{
    if (!_defaultLabel) {
        _defaultLabel = [[UILabel alloc] init];
        [self addSubview:_defaultLabel];
        [_defaultLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLable.mas_right).offset(4);
            make.centerY.equalTo(self.titleLable);
            make.width.mas_equalTo(@28);
            make.height.mas_equalTo(@15);
        }];
        _defaultLabel.text = @"默认";
        _defaultLabel.backgroundColor = rgba(245, 240, 240, 1.0);
        _defaultLabel.textColor = rgba(80, 60, 60, 1.0);
        _defaultLabel.textAlignment = NSTextAlignmentCenter;
        _defaultLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:9];
        _defaultLabel.layer.cornerRadius = 2.0;
        _defaultLabel.layer.masksToBounds = YES;
        
    }
    return _defaultLabel;
}

- (UILabel *)itemsCountLabel
{
    if (!_itemsCountLabel) {
        _itemsCountLabel = [[UILabel alloc] init];
        [self addSubview:_itemsCountLabel];
        [_itemsCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLable.mas_bottom).offset(2);
            make.left.equalTo(self.titleLable);
        }];
        _itemsCountLabel.textColor = rgba(160, 150, 150, 1.0);
        _itemsCountLabel.textAlignment = NSTextAlignmentNatural;
        _itemsCountLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:9];
    }
    return _itemsCountLabel;
}

- (UIImageView *)arrowImageView
{
    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc] init];
        [self addSubview:_arrowImageView];
        [_arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-18);
            make.centerY.equalTo(self.titleLable);
            make.width.height.mas_equalTo(@16);
        }];
    }
    return _arrowImageView;
}
@end

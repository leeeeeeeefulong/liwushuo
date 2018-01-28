//
//  LWSRankListItemCell.m
//  liwushuo
//
//  Created by lee on 2017/12/13.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSRankListItemCell.h"
#import "LWSRankListModel.h"
#import "LWSRecommendItems.h"
@implementation LWSRankListItemCell


- (void)configRankListItemModel:(LWSRankListModel *)model
{
    self.backgroundColor = RGB(255, 254, 254);
    [self.itemImageView setImageWithURL:[NSURL URLWithString:model.coverImageUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
    } usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.itemTitleLabel.text = model.shortDescription;
    self.itemDescriptionLabel.text = model.name;
    self.itemPriceLabel.text = [NSString stringWithFormat:@"￥%@",model.price];
}

- (void)setItems:(LWSRecommendItems *)items
{
    _items = items;
    self.backgroundColor = RGB(255, 254, 254);
    [self.itemImageView setImageWithURL:[NSURL URLWithString:items.coverImageUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
    } usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.itemTitleLabel.text = items.shortDescription;
    self.itemDescriptionLabel.text = items.name;
    self.itemPriceLabel.text = [NSString stringWithFormat:@"￥%@",items.price];
}

- (FLAnimatedImageView *)itemImageView
{
    if (!_itemImageView) {
        _itemImageView = [[FLAnimatedImageView alloc] init];
        [self addSubview:_itemImageView];
        [_itemImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self);
            make.height.equalTo(_itemImageView.mas_width);
        }];
        
    }
    return _itemImageView;
}

- (UILabel *)itemTitleLabel
{
    if (!_itemTitleLabel) {
        _itemTitleLabel = [[UILabel alloc] init];
        [self addSubview:_itemTitleLabel];
        [_itemTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self).offset(9);
            make.top.equalTo(self.itemImageView.mas_bottom).offset(6);
        }];
        _itemTitleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _itemTitleLabel.textColor = RGBA(50, 30, 30, 1.0);
        _itemTitleLabel.textAlignment = NSTextAlignmentNatural;

    }
    return _itemTitleLabel;
}

- (UILabel *)itemDescriptionLabel
{
    if (!_itemDescriptionLabel) {
        _itemDescriptionLabel = [[UILabel alloc] init];
        [self addSubview:_itemDescriptionLabel];
        [_itemDescriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self).offset(9);
            make.top.equalTo(self.itemImageView.mas_bottom).offset(25);
        }];
        _itemDescriptionLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _itemDescriptionLabel.textColor = RGBA(160, 150, 150, 1.0);
        _itemDescriptionLabel.textAlignment = NSTextAlignmentNatural;
        _itemDescriptionLabel.numberOfLines = 2;
        
    }
    return _itemDescriptionLabel;
}

- (UILabel *)itemPriceLabel
{
    if (!_itemPriceLabel) {
        _itemPriceLabel = [[UILabel alloc] init];
        [self addSubview:_itemPriceLabel];
        [_itemPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self).offset(-9);
            make.left.right.equalTo(self.itemDescriptionLabel);
        }];
        _itemPriceLabel.textColor = RGBA(255, 45, 71, 1.0);
        _itemPriceLabel.font = [UIFont fontWithName:@"Helvetica-Light" size:13];
        _itemDescriptionLabel.textAlignment = NSTextAlignmentNatural;
    }
    return _itemPriceLabel;
}
@end

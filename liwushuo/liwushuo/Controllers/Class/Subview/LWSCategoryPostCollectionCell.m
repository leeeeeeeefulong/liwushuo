//
//  LWSCategoryPostCollectionCell.m
//  liwushuo
//
//  Created by lee on 2017/12/14.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSCategoryPostCollectionCell.h"
#import "LWSColumns.h"
@implementation LWSCategoryPostCollectionCell


- (void)configPostCollectionModel:(LWSColumns *)model
{
    [self.itemImageView setImageWithURL:[NSURL URLWithString:model.coverImageUrl] placeholderImage:[UIImage imageNamed:@"placeholderimage_big_80x69_"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
    } usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//    self.itemContainView.backgroundColor = [UIColor flatOrangeColor];
    self.viewTitleLabel.text = model.title;
    self.viewTypeLabel.text = model.category;
    self.viewNameLable.text = model.author;
}

- (UIImageView *)itemImageView
{
    if (!_itemImageView) {
        _itemImageView = [[UIImageView alloc] init];
        [self addSubview:_itemImageView];
        [_itemImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.equalTo(self);
//            make.centerY.equalTo(self);
            make.width.mas_equalTo(@130);
        }];
    }
    return _itemImageView;
}

- (UIView *)itemContainView
{
    if (!_itemContainView) {
        _itemContainView = [[UIView alloc] init];
        [self addSubview:_itemContainView];
        [_itemContainView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self);
            make.height.mas_equalTo(@56);
            make.left.equalTo(self.itemImageView.mas_right);
            make.centerY.equalTo(self.itemImageView);
        }];
       
    }
    return _itemContainView;
    
}

- (UILabel *)viewTitleLabel
{
    if (!_viewTitleLabel) {
        _viewTitleLabel = [[UILabel alloc] init];
        [self.itemContainView addSubview:_viewTitleLabel];
        [_viewTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.itemContainView).offset(10);
            make.right.mas_lessThanOrEqualTo(self.itemContainView);
            make.top.equalTo(self.itemContainView);
        }];
        _viewTitleLabel.textColor = rgba(50, 30, 30, 1.0);
        _viewTitleLabel.textAlignment = NSTextAlignmentNatural;
        _viewTitleLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:14];
    }
    return _viewTitleLabel;
}

- (UILabel *)viewTypeLabel
{
    if (!_viewTypeLabel) {
        _viewTypeLabel = [[UILabel alloc] init];
        [self.itemContainView addSubview:_viewTypeLabel];
        [_viewTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.viewTitleLabel);
            make.right.mas_lessThanOrEqualTo(self.itemContainView);
            make.top.equalTo(self.viewTitleLabel.mas_bottom).offset(6);
        }];
        _viewTypeLabel.textColor = rgba(160, 150, 150, 1.0);
        _viewTypeLabel.textAlignment = NSTextAlignmentNatural;
        _viewTypeLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:11];
    }
    return _viewTypeLabel;

}

- (UILabel *)viewNameLable
{
    if (!_viewNameLable) {
        _viewNameLable = [[UILabel alloc] init];
        [self.itemContainView addSubview:_viewNameLable];
        [_viewNameLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.viewTitleLabel);
            make.right.mas_lessThanOrEqualTo(self.itemContainView);
            make.top.equalTo(self.viewTypeLabel.mas_bottom).offset(6);
        }];
        _viewNameLable.textColor = rgba(160, 150, 150, 1.0);
        _viewNameLable.textAlignment = NSTextAlignmentNatural;
        _viewNameLable.font = [UIFont fontWithName:@"PingFangSC-Regular" size:11];
    }
    return _viewNameLable;
}
@end

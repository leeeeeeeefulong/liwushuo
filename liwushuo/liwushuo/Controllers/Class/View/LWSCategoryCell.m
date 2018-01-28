//
//  LWSCategoryCell.m
//  liwushuo
//
//  Created by lee on 2017/12/14.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSCategoryCell.h"
#import "LWSChannels.h"
@implementation LWSCategoryCell

- (void)configCategoryModel:(LWSChannels *)model
{
    [self.itemImageView setImageWithURL:[NSURL URLWithString:model.coverImageUrl] placeholderImage:[UIImage imageNamed:@"placeholderimage_big_80x69_"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
    } usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
}

- (UIImageView *)itemImageView
{
    if (!_itemImageView) {
        _itemImageView = [[UIImageView alloc] init];
        [self addSubview:_itemImageView];
        [_itemImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.equalTo(self);
        }];
    }
    return _itemImageView;
}
@end

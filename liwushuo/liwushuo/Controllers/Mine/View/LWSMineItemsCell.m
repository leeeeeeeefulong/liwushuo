
//
//  LWSMineItemsCell.m
//  liwushuo
//
//  Created by lee on 2017/12/29.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSMineItemsCell.h"

#import "LWSItems.h"

@interface LWSMineItemsCell ()

@property (nonatomic, strong) UIImageView *itemImageView;

@end

@implementation LWSMineItemsCell

- (void)setModel:(LWSItems *)model
{
    _model = model;
    self.backgroundColor = rgba(250, 245, 245, 1.0);
    NSArray *strArr = [model.coverWebpUrl componentsSeparatedByString:@"?"];
    NSString *imageUrl = strArr[0];
    
    [self.itemImageView setImageWithURL:[NSURL URLWithString:imageUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
    } usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
}

#pragma mark - Getts
- (UIImageView *)itemImageView
{
    if (!_itemImageView) {
        _itemImageView = [[UIImageView alloc] init];
        [self addSubview:_itemImageView];
        [_itemImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        _itemImageView.backgroundColor = rgba(240, 235, 235, 1.0);
    }
    return _itemImageView;
}

@end

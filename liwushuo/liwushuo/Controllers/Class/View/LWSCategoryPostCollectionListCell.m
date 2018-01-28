//
//  LWSCategoryPostCollectionListCell.m
//  liwushuo
//
//  Created by lee on 2017/12/14.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSCategoryPostCollectionListCell.h"

@implementation LWSCategoryPostCollectionListCell

- (LWSCategoryPostCollectionListView *)itemListView
{
    if (!_itemListView) {
        _itemListView = [[LWSCategoryPostCollectionListView alloc] init];
        [self addSubview:_itemListView];
        [_itemListView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.equalTo(self);
        }];
    }
    return _itemListView;
}
@end

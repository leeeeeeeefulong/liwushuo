//
//  LWSRankListItemCell.h
//  liwushuo
//
//  Created by lee on 2017/12/13.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LWSRankListModel,LWSRecommendItems;
@interface LWSRankListItemCell : UICollectionViewCell

@property (nonatomic, strong) FLAnimatedImageView *itemImageView;
@property (nonatomic, strong) UILabel *itemTitleLabel;
@property (nonatomic, strong) UILabel *itemDescriptionLabel;
@property (nonatomic, strong) UILabel *itemPriceLabel;
@property (nonatomic, strong) UILabel *topLabel;
@property (nonatomic, strong) LWSRecommendItems *items;

- (void)configRankListItemModel:(LWSRankListModel *)model;


@end

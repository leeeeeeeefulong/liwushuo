//
//  LWSCategoryPostCollectionCell.h
//  liwushuo
//
//  Created by lee on 2017/12/14.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LWSColumns;
@interface LWSCategoryPostCollectionCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *itemImageView;

@property (nonatomic, strong) UIView *itemContainView;

@property (nonatomic, strong) UILabel *viewTitleLabel;

@property (nonatomic, strong) UILabel *viewTypeLabel;

@property (nonatomic, strong) UILabel *viewNameLable;

- (void)configPostCollectionModel:(LWSColumns *)model;
@end

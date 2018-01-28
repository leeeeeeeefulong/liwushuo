//
//  LWSGiftCategoryCell.h
//  liwushuo
//
//  Created by lee on 2017/12/15.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Subcategories;
@interface LWSGiftCategoryCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) Subcategories *model;

@end

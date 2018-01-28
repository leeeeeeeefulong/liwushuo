//
//  LWSCategoryCell.h
//  liwushuo
//
//  Created by lee on 2017/12/14.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LWSChannels;
@interface LWSCategoryCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *itemImageView;

- (void)configCategoryModel:(LWSChannels *)model;
@end

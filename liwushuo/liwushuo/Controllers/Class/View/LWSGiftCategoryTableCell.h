//
//  LWSGiftCategoryTableCell.h
//  liwushuo
//
//  Created by lee on 2017/12/15.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const kGiftTableCell = @"kGiftTableCell";

@class Categories;
@interface LWSGiftCategoryTableCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *indicatorView;
@property (nonatomic, strong) UIView *lineView;

- (void)configGiftCellModel:(Categories *)model;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end

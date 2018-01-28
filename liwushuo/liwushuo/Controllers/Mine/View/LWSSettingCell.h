//
//  LWSSettingCell.h
//  liwushuo
//
//  Created by lee on 2017/12/30.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const kSettingViewCell = @"kSettingViewCell";
@interface LWSSettingCell : UITableViewCell

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *rightLabel;

@property (nonatomic, strong) UIImageView *arrowImageView;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end

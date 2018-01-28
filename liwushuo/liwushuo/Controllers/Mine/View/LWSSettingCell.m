//
//  LWSSettingCell.m
//  liwushuo
//
//  Created by lee on 2017/12/30.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSSettingCell.h"

@implementation LWSSettingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    LWSSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:kSettingViewCell];
    if (!cell) {
        cell = [[LWSSettingCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:kSettingViewCell];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self drawUI];
    }
    return self;
}

- (void)drawUI
{
    
    self.iconImageView = [[UIImageView alloc] init];
    [self addSubview:self.iconImageView];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(@24);
        make.left.equalTo(self).offset(15);
        make.centerY.equalTo(self);
    }];
    
    self.titleLabel = [[UILabel alloc] init];
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).offset(15);
        make.centerY.equalTo(self);
    }];
    self.titleLabel.textColor = rgba(50, 30, 30, 1.0);
    self.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    
    self.rightLabel = [[UILabel alloc] init];
    [self addSubview:self.rightLabel];
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-30);
        make.centerY.equalTo(self);
    }];
    self.rightLabel.textColor = rgba(80, 60, 60, 1.0);
    self.rightLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    
    self.arrowImageView = [[UIImageView alloc] init];
    [self addSubview:self.arrowImageView];
    [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@5);
        make.height.mas_equalTo(@8);
        make.right.equalTo(self).offset(-15);
        make.centerY.equalTo(self);
    }];
    self.arrowImageView.image = [UIImage imageNamed:@"category_postcollectionseeall_5x8_"];

}
@end

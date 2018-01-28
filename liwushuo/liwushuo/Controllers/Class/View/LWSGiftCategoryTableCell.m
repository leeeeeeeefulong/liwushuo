//
//  LWSGiftCategoryTableCell.m
//  liwushuo
//
//  Created by lee on 2017/12/15.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSGiftCategoryTableCell.h"

@implementation LWSGiftCategoryTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    
    LWSGiftCategoryTableCell *cell = [tableView dequeueReusableCellWithIdentifier:kGiftTableCell];
    if (!cell) {
        cell = [[LWSGiftCategoryTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kGiftTableCell];
    }
    return cell;
    
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self drawUI];
    }
    return self;
}

- (void)drawUI
{
    UILabel *label = [[UILabel alloc] init];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    label.textColor = RGBA(51, 51, 51, 1.0);
    label.highlightedTextColor = RGB(255, 45, 71);
    self.titleLabel = label;
    
    UIView *indicatorView = [[UIView alloc] init];
    [self addSubview:indicatorView];
    [indicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(self);
        make.width.mas_equalTo(@3);
    }];
    indicatorView.backgroundColor = RGBA(255, 0, 0, 1.0);
    self.indicatorView = indicatorView;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    self.backgroundColor = selected ? [UIColor whiteColor] : RGB(246, 246, 247);
    self.highlighted = selected;
    self.titleLabel.highlighted = selected;
    self.indicatorView.hidden = !selected;
    
    // Configure the view for the selected state
}


@end

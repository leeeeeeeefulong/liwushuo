//
//  LWSMePostColumnCell.m
//  liwushuo
//
//  Created by PinelliaZeit on 2018/1/27.
//  Copyright © 2018年 Pinellia Zeit. All rights reserved.
//

#import "LWSMePostColumnCell.h"
#import "LWSColumns.h"
@interface LWSMePostColumnCell ()

@property (nonatomic, strong) UIImageView *columnImageView; // 图片
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UILabel *columnTitleLable;  // 标题 靠脸吃饭
@property (nonatomic, strong) UILabel *columnAuthorLabel;  // 用户 灰姑娘
@property (nonatomic, strong) UILabel *columnTextLabel;    // 类型 礼物
@property (nonatomic, strong) UIButton *columnFollowBtn;
@end

@implementation LWSMePostColumnCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setModel:(LWSColumns *)model
{
    _model = model;
    [self.columnImageView setImageWithURL:[NSURL URLWithString:model.coverImageUrl] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.columnTitleLable.text = model.title;
    self.columnTextLabel.text = model.subtitle;
    self.columnAuthorLabel.text = model.author;
    self.columnFollowBtn.selected = NO;
}

- (UIImageView *)columnImageView
{
    if (!_columnImageView) {
        _columnImageView = [[UIImageView alloc] init];
        [self addSubview:_columnImageView];
        [_columnImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.equalTo(self);
            make.width.mas_equalTo(@130);
        }];
        
    }
    return _columnImageView;
}

- (UIButton *)columnFollowBtn
{
    if (!_columnFollowBtn) {
        _columnFollowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_columnFollowBtn];
        [_columnFollowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(@54);
            make.height.mas_equalTo(@26);
            make.right.equalTo(self).offset(-2);
            make.top.equalTo(self.columnTitleLable);
        }];
        [_columnFollowBtn setTitle:@"+关注" forState:UIControlStateNormal];
        [_columnFollowBtn setTitleColor:rgba(255, 45, 71, 1.0) forState:UIControlStateNormal];
        [_columnFollowBtn setTitleColor:rgba(150, 150, 150, 1.0) forState:UIControlStateSelected];
        _columnFollowBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:11];
        _columnFollowBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
        _columnFollowBtn.layer.borderWidth = 0.333;
        _columnFollowBtn.layer.borderColor = rgba(255, 179, 187, 1.0).CGColor;
        _columnFollowBtn.layer.cornerRadius = 2;
        _columnFollowBtn.layer.masksToBounds = YES;
    }
    return _columnFollowBtn;
}

- (UIView *)containerView
{
    if (!_containerView) {
        _containerView = [[UIView alloc] init];
        [self addSubview:_containerView];
        [_containerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.right.equalTo(self);
            make.height.mas_equalTo(@56);
            make.left.equalTo(self.columnImageView.mas_right);
        }];
    }
    return _containerView;
}
- (UILabel *)columnTitleLable
{
    if (!_columnTitleLable) {
        _columnTitleLable = [[UILabel alloc] init];
        [self.containerView addSubview:_columnTitleLable];
        [_columnTitleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.containerView).offset(10);
            make.top.equalTo(self.containerView);
            make.right.lessThanOrEqualTo(self.containerView);
        }];
        _columnTitleLable.textColor = rgba(50, 30, 30, 1.0);
        _columnTitleLable.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:14];
        _columnTitleLable.textAlignment = NSTextAlignmentNatural;
    }
    return _columnTitleLable;
}

- (UILabel *)columnTextLabel
{
    if (!_columnTextLabel) {
        _columnTextLabel = [[UILabel alloc] init];
        [self.containerView addSubview:_columnTextLabel];
        [_columnTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.columnTitleLable);
            make.top.equalTo(self.columnTitleLable.mas_baseline).offset(10);
            make.right.equalTo(self.columnFollowBtn.mas_right).offset(-10);

        }];
        
        _columnTextLabel.textColor = rgba(160, 150, 150, 1.0);
        _columnTextLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:11];
        _columnTextLabel.textAlignment = NSTextAlignmentNatural;
    }
    return _columnTextLabel;
}

- (UILabel *)columnAuthorLabel
{
    if (!_columnAuthorLabel) {
        _columnAuthorLabel = [[UILabel alloc] init];
        [self.containerView addSubview:_columnAuthorLabel];
        [_columnAuthorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.columnTitleLable);
            make.top.equalTo(self.columnTextLabel.mas_baseline).offset(6);
            make.right.equalTo(self.columnFollowBtn.mas_left).offset(-10);
        }];
        _columnAuthorLabel.textColor = rgba(160, 150, 150, 1.0);
        _columnAuthorLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:11];
        _columnAuthorLabel.textAlignment = NSTextAlignmentNatural;
    }
    return _columnAuthorLabel;
}



@end

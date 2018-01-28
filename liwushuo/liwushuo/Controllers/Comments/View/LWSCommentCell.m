//
//  LWSCommentCell.m
//  liwushuo
//
//  Created by lee on 2018/1/3.
//  Copyright © 2018年 Pinellia Zeit. All rights reserved.
//

#import "LWSCommentCell.h"
#import "LWSCommentsdata.h"

@interface LWSCommentCell ()

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) UIButton *goodButton;

@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UIView *topLineView;

@property (nonatomic, strong) UIView *bottomLineView;

@end

@implementation LWSCommentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        [self drawUI];
    }
    return self;
}

- (void)drawUI
{
    UIView *topLineView = [[UIView alloc] init];
    [self addSubview:topLineView];
    [topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.mas_equalTo(@0.3333);
    }];
    topLineView.backgroundColor = rgba(240, 230, 230, 1.0);
    self.topLineView = topLineView;
    
    UIView *bottomLineView = [[UIView alloc] init];
    [self addSubview:bottomLineView];
    [topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self);
        make.height.mas_equalTo(@0.3333);
    }];
    bottomLineView.backgroundColor = rgba(240, 230, 230, 1.0);
    self.bottomLineView = bottomLineView;
}

- (void)setModel:(LWSComments *)model
{
    _model = model;
    
    [self.iconImageView setImageWithURL:[NSURL URLWithString:model.user.avatarUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
    } usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    self.nameLabel.text = model.user.nickname;
    self.timeLabel.text = @"1月2号";
    self.contentLabel.text = model.content;
    [self.goodButton setTitle:[NSString stringWithFormat:@" %.f",model.likesCount] forState:UIControlStateNormal];
}


#pragma mark - Getts
- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        [self addSubview:_iconImageView];
        [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10);
            make.top.equalTo(self.topLineView).offset(11.67);
            make.height.mas_equalTo(@34);
            make.width.mas_equalTo(@34);
            
        }];
        _iconImageView.layer.cornerRadius = 17.0;
        _iconImageView.layer.masksToBounds = YES;
    }
    return _iconImageView;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        [self addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageView.mas_right).offset(16);
            make.top.equalTo(self).offset(12);
        }];
        _nameLabel.textColor = rgba(80, 60, 60, 1.0);
        _nameLabel.font = [UIFont fontWithName:@"PingFangSC-Semibild" size:13];
    }
    return _nameLabel;
}

- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        [self addSubview:_timeLabel];
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel);
            make.top.equalTo(self.nameLabel.mas_bottom).offset(5);
            make.right.equalTo(self.nameLabel);
        }];
        _timeLabel.textColor = rgba(160, 150, 150, 1.0);
        _timeLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:10];
    }
    return _timeLabel;
}

- (UIButton *)goodButton
{
    if (!_goodButton) {
        _goodButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_goodButton];
        [_goodButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.equalTo(self);
            make.width.height.mas_equalTo(@50);
        }];
        [_goodButton setImage:[UIImage imageNamed:@"icon_praise_grey_15x15_"] forState:UIControlStateNormal];
        [_goodButton setImage:[UIImage imageNamed:@"icon_praise_red_15x15_"] forState:UIControlStateSelected];
        _goodButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
        [_goodButton setTitleColor:rgba(102, 102, 102, 1.0) forState:UIControlStateNormal];
    }
    return _goodButton;
}

- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        [self addSubview:_contentLabel];
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel);
            make.top.equalTo(self.timeLabel.mas_bottom).offset(10);
            make.right.equalTo(self).offset(-20);
            make.bottom.equalTo(self.bottomLineView).offset(-10);
        }];
        _contentLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
        _contentLabel.textAlignment = NSTextAlignmentJustified;
        _contentLabel.textColor = rgba(80, 60, 60, 1.0);
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}

- (UIView *)topLineView
{
    if (!_topLineView) {
        _topLineView = [[UIView alloc] init];
        [self addSubview:_topLineView];
        [_topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self);
            make.height.mas_equalTo(@0.3333);
        }];
        _topLineView.backgroundColor = rgba(240, 230, 230, 1.0);
    }
    return _topLineView;
}

- (UIView *)bottomLineView
{
    if (!_bottomLineView) {
        _bottomLineView = [[UIView alloc] init];
        [self addSubview:_bottomLineView];
        [_bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self);
            make.height.mas_equalTo(@0.3333);
        }];
    _bottomLineView.backgroundColor = rgba(240, 230, 230, 1.0);
    }
    return _bottomLineView;
}


@end

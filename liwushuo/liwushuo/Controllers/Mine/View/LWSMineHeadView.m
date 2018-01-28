//
//  LWSMineHeadView.m
//  liwushuo
//
//  Created by lee on 2017/12/29.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSMineHeadView.h"
#import "LWSMeTextBubbleView.h"
#import "LWSMineInfoModel.h"
#import "LWSMePromotionsControl.h"
@interface LWSMineHeadView ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) LWSMeTextBubbleView *msgView;
@property (nonatomic, strong) LWSMeTextBubbleView *follwoView;
@property (nonatomic, strong) LWSMeTextBubbleView *creditView;

@end

@implementation LWSMineHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = rgba(255, 254, 254, 1.0);
//        self.backgroundColor = [UIColor flatRedColorDark];
        [self drawUI];
    }
    return self;
}

- (void)setModel:(LWSMineInfoModel *)model
{
    _model = model;
    [self.iconImageView setImageWithURL:[NSURL URLWithString:model.avatarUrl] placeholderImage:[UIImage imageNamed:@"user_info_boy_70x70_"]  completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
    } usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    self.msgView.textTitleLabel.text = @"新消息";
    self.msgView.textCountLabel.text = [NSString stringWithFormat:@"%.f",model.role];
    
    self.follwoView.textTitleLabel.text = @"关注";
    self.follwoView.textCountLabel.text = [NSString stringWithFormat:@"%.f",model.followColumnsCount];
    
    self.creditView.textTitleLabel.text = @"积分";
    self.creditView.textCountLabel.text = [NSString stringWithFormat:@"%.f",model.credit];
    
}

- (void)drawUI
{
    UIView *containView = [[UIView alloc] init];
    [self addSubview:containView];
    [containView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.mas_equalTo(@182);
    }];
    
    /// 头像
    UIImageView *headIconImageView = [[UIImageView alloc] init];
    [containView addSubview:headIconImageView];
    [headIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(containView).offset(20);
        make.height.width.mas_equalTo(@68);
    }];
    self.iconImageView = headIconImageView;
    
    UIButton *iconButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [containView addSubview:iconButton];
    [iconButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.width.height.equalTo(headIconImageView);
    }];
    
    LWSMeTextBubbleView *newMsgView = [[LWSMeTextBubbleView alloc] init];
    [containView addSubview:newMsgView];
    [newMsgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(containView).offset(40);
        make.right.equalTo(containView).offset(-20);
        make.height.mas_equalTo(@35);
        make.width.mas_equalTo(@42);
    }];
    self.msgView = newMsgView;
    
    UIView *rightLineView = [[UIView alloc] init];
    [containView addSubview:rightLineView];
    [rightLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(containView).offset(50);
        make.right.equalTo(containView).offset(-77);
        make.height.mas_equalTo(@15);
        make.width.mas_equalTo(@0.3333);
    }];
    rightLineView.backgroundColor = rgba(240, 230, 230, 1.0);
    
    LWSMeTextBubbleView *followCountView = [[LWSMeTextBubbleView alloc] init];
    [containView addSubview:followCountView];
    [followCountView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(rightLineView.mas_left).offset(-35);
        make.width.bottom.height.equalTo(newMsgView);
    }];
    self.follwoView = followCountView;
    
    UIView *leftLineView = [[UIView alloc] init];
    [containView addSubview:leftLineView];
    [leftLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.height.width.equalTo(rightLineView);
        make.right.equalTo(containView).offset(-149);
    }];
    leftLineView.backgroundColor = rgba(240, 230, 230, 1.0);
    
    LWSMeTextBubbleView *creditView = [[LWSMeTextBubbleView alloc] init];
    [containView addSubview:creditView];
    [creditView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(leftLineView.mas_left).offset(-35);
        make.bottom.width.height.equalTo(newMsgView);
    }];
    self.creditView = creditView;
    
    LWSMePromotionsControl *promotionsControl = [[LWSMePromotionsControl alloc] init];
    [containView addSubview:promotionsControl];
    [promotionsControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(containView).offset(20);
        make.right.equalTo(containView).offset(-20);
        make.height.mas_equalTo(@43);
        make.bottom.equalTo(containView).offset(-18);
    }];
    
    UIView *colorView = [[UIView alloc] init];
    [self addSubview:colorView];
    [colorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.equalTo(self);
        make.height.mas_equalTo(@10);
        make.top.equalTo(containView.mas_bottom);
    }];
    colorView.backgroundColor = rgba(250, 245, 245, 1.0);
    
}


@end

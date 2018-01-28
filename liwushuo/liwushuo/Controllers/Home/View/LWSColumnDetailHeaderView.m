
//
//  LWSColumnDetailHeaderView.m
//  liwushuo
//
//  Created by lee on 2017/12/21.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSColumnDetailHeaderView.h"
#import "LWSData.h"
@interface LWSColumnDetailHeaderView()

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIButton *likeButton;

@property (nonatomic, strong) UIButton *favoriteButton;
@end

@implementation LWSColumnDetailHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self drawUI];
    }
    return self;
}

- (void)drawUI
{
    self.imageView = [[UIImageView alloc] init];
    [self addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self);
    }];
    
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    UIView *maskView = [[UIView alloc] init];
    [self addSubview:maskView];
    [maskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self);
    }];
    maskView.backgroundColor = rgba(0, 0, 0, 0.078);
    
    self.titleLabel = [[UILabel alloc] init];
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(65);
    }];
    self.titleLabel.textAlignment = NSTextAlignmentNatural;
    self.titleLabel.textColor = rgba(60, 60, 60, 1.0);
    self.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:21];
    
    
    self.likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.likeButton];
    [self.likeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(8);
        make.centerX.equalTo(self);
    }];
    [self.likeButton setImage:[UIImage imageNamed:@"baichuan_navigation_favorites_selected_21x21_"] forState:UIControlStateNormal];
    self.likeButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
    [self.likeButton setTitleColor:rgba(255, 255, 255, 1.0) forState:UIControlStateNormal];
    
    self.favoriteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.favoriteButton];
    [self.favoriteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.likeButton.mas_bottom).offset(7);
        make.centerX.equalTo(self);
        make.width.mas_equalTo(@58);
        make.height.mas_equalTo(@28);
    }];
    [self.favoriteButton setBackgroundColor:rgba(255, 45, 71, 0.9)];
    self.favoriteButton.layer.cornerRadius = 2;
    self.favoriteButton.layer.masksToBounds = YES;
    self.favoriteButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    [self.favoriteButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.favoriteButton setTitle:@"+关注" forState:UIControlStateNormal];
    
}

- (void)setData:(LWSData *)data
{
    _data = data;
    [self.imageView setImageWithURL:[NSURL URLWithString:data.coverImageUrl] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.titleLabel.text = data.title;
    [self.likeButton setTitle:[NSString stringWithFormat:@"  %.f人喜欢",data.likesCount] forState:UIControlStateNormal];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
//    self.imageView.frame  = CGRectMake(0, 0, self.width, self.height);
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

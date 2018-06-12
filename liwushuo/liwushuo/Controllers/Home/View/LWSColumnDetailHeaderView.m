
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

@property (nonatomic, strong) UILabel *textLabel;

@property (nonatomic, strong) UIButton *likeButton;

@property (nonatomic, strong) UIButton *favoriteButton;
@end

@implementation LWSColumnDetailHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self drawUI];
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(@(Main_Screen_Width));
        }];
    }
    return self;
}

- (void)drawUI
{
    self.imageView = [[UIImageView alloc] init];
    [self addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.mas_equalTo(@180);
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
    
    UIView *descriptionView = [[UIView alloc] init];
    [self addSubview:descriptionView];
    [descriptionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.top.equalTo(self.imageView.mas_bottom);
    }];
    descriptionView.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    [descriptionView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(@9);
    }];
    titleLabel.textColor = rgba(120, 120, 120, 1.0);
    titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    titleLabel.text = @"简介";
    
    UIView *lineView = UI_UILineView();
    [descriptionView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(12);
        make.left.right.equalTo(descriptionView);
        make.height.mas_equalTo(@0.3333);
        make.centerX.equalTo(descriptionView);
    }];
    
    
    UIView *bottomView = [[UIView alloc] init];
    [descriptionView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_baseline).offset(9);
        make.left.right.equalTo(descriptionView);
    }];
    
    UILabel *textLaebl = [[UILabel alloc] init];
    [bottomView addSubview:textLaebl];
    [textLaebl mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(titleLabel);
//        make.top.equalTo(lineView.mas_baseline).offset(9);
//        make.right.equalTo(self).offset(-9);
//        make.bottom.equalTo(descriptionView);
        make.edges.equalTo(bottomView).insets(UIEdgeInsetsMake(2, 9, 9, 9));
    }];
    textLaebl.textColor = rgba(90, 90, 90, 1.0);
    textLaebl.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    textLaebl.numberOfLines = 0;
    self.textLabel = textLaebl;
    
    UIView *lastView = [[UIView alloc] init];
    [descriptionView addSubview:lastView];
    [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(descriptionView);
        make.height.mas_equalTo(@10);
        make.top.equalTo(bottomView.mas_bottom);
    }];
    lastView.backgroundColor = BackgroundColor;
    
}




- (void)setData:(LWSData *)data
{
    _data = data;
    [self.imageView setImageWithURL:[NSURL URLWithString:data.coverImageUrl] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.titleLabel.text = data.title;
    [self.likeButton setTitle:[NSString stringWithFormat:@"  %.f人喜欢",data.likesCount] forState:UIControlStateNormal];
    self.textLabel.text = data.dataDescription;
    
    [self setNeedsLayout];
    
    [self layoutIfNeeded];
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

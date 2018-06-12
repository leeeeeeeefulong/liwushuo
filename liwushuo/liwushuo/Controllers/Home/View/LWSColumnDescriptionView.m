
//
//  LWSColumnDescriptionView.m
//  liwushuo
//
//  Created by lee on 2017/12/21.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSColumnDescriptionView.h"

@interface LWSColumnDescriptionView ()

@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UIView *containView;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UIButton *seeAllBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containViewWidth;

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIButton *likeButton;

@property (nonatomic, strong) UIButton *favoriteButton;

@end

@implementation LWSColumnDescriptionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self baseUI];
    }
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.containViewWidth.constant = Main_Screen_Width;
    self.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)baseUI
{
    self.backgroundColor = [UIColor whiteColor];
    self.titleLable = [[UILabel alloc] initWithFrame:CGRectMake(11, 13, 100, 14)];
    self.titleLable.textColor = rgba(120, 120, 120, 1.0);
    self.titleLable.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    self.titleLable.text = @"简介";
    [self addSubview:self.titleLable];

    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.titleLable.frame) + 12, self.width, 0.3333)];
    lineView.backgroundColor = rgba(235, 235, 235, 1.0);
    [self addSubview:lineView];
    
    CGFloat btnW = 100.0f;
    CGFloat btnH = 32.0f;
    CGFloat btnX = self.width - btnW;
    CGFloat btnY = self.height - btnH;
    
    self.seeAllBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.seeAllBtn setFrame:CGRectMake(btnX, btnY, btnW, btnH)];
    [self.seeAllBtn setTitle:@"查看全部" forState:UIControlStateNormal];
//    self.seeAllBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    self.seeAllBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.seeAllBtn setTitleColor:rgba(120, 120, 120, 1.0) forState:UIControlStateNormal];
    [self addSubview:self.seeAllBtn];
    
    
}

@end

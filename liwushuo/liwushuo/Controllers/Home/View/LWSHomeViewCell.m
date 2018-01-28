
//
//  LWSHomeViewCell.m
//  liwushuo
//
//  Created by lee on 2017/12/7.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSHomeViewCell.h"

@interface LWSHomeViewCell()

@property (nonatomic, strong) UIView *containerView;
/// 头像
@property (nonatomic, strong) UIImageView *iconImageView;

/// 昵称
@property (nonatomic, strong) UILabel *nameLabel;

/// 签名
@property (nonatomic, strong) UILabel *signatureLabel;

/// 内容图片
@property (nonatomic, strong) UIImageView *contentImageView;

/// 内容标题
@property (nonatomic, strong) UILabel *contentLabel;

/// 内容介绍
@property (nonatomic, strong) UILabel *introductionLabel;

/// 分类标签
@property (nonatomic, strong) UILabel *tagLabel;

@property (nonatomic, strong) UIButton *tagButton;
/// 喜欢按钮
@property (nonatomic, strong) UIButton *likeButton;

/// 分割线
@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, getter=isHeightCaculated) BOOL heightCaculated;

@end
@implementation LWSHomeViewCell


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        [self.contentView addSubview:self.contentView];
        self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
        self.heightCaculated = NO;
        [self.contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
        
            make.width.mas_equalTo(@(Main_Screen_Width));
        }];
        
    }
    return self;
}

- (void)configCellModel:(Items *)model
{
    
    self.backgroundColor = [UIColor whiteColor];
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.author.avatarUrl] placeholderImage:[UIImage imageNamed:@"Card-Stack"]];
    [self.contentImageView sd_setImageWithURL:[NSURL URLWithString:model.coverImageUrl] placeholderImage:[UIImage imageNamed:@"Card-Stack"]];
    self.nameLabel.text = model.author.nickname;
    self.signatureLabel.text = model.author.introduction;
    self.contentLabel.text = model.title;
    self.introductionLabel.text = model.introduction;
    self.lineView.backgroundColor = RGBA(240, 230, 230, 1.0);
    
    // 防止在更多数据中， column 为空
    if (model.column.title) {
        NSString *title = [NSString stringWithFormat:@"栏目 %@",model.column.title];
        NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:title];
        NSRange range = [title rangeOfString:model.column.title];
        [attString addAttributes:@{NSForegroundColorAttributeName : RGB(50, 50, 40)} range:range];
        [self.tagButton setAttributedTitle:attString forState:UIControlStateNormal];
    }
    [self.likeButton setTitle:[NSString stringWithFormat:@" %.f",model.likesCount] forState:UIControlStateNormal];
}

- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
//    [super preferredLayoutAttributesFittingAttributes:layoutAttributes];
    
    if (!self.isHeightCaculated) {
            // 暂时不用
        self.heightCaculated = YES;
    }
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    CGSize size = [self.contentView systemLayoutSizeFittingSize:layoutAttributes.size withHorizontalFittingPriority:UILayoutPriorityRequired verticalFittingPriority:UILayoutPriorityFittingSizeLevel];
    CGRect newFrame = layoutAttributes.frame;
    newFrame.size.height = ceilf(size.height);
    layoutAttributes.frame = newFrame;
    
    NSLog(@"cell size %@",NSStringFromCGSize(size));
    
    return layoutAttributes;
}
#pragma mark - customAction
- (void)typeClickAction
{
//    !self.typeClickBlcok ? : self.typeClickBlcok();
    if (self.typeClickBlcok) {
        self.typeClickBlcok();
    }
    
}

#pragma mark - lazy load

- (UIView *)containerView
{
    if (!_containerView) {
        _containerView = [[UIView alloc] init];
        [self.contentView addSubview:_containerView];
        [_containerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }
    return _containerView;
}
- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        [self.containerView addSubview:_iconImageView];
        [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.containerView).offset(15);
            make.width.height.mas_equalTo(@36);
        }];
        _iconImageView.contentMode = UIViewContentModeScaleAspectFill;
        _iconImageView.layer.cornerRadius = 18;
        _iconImageView.layer.masksToBounds = YES;
    }
    return _iconImageView;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        
        _nameLabel = [[UILabel alloc] init];
        [self.containerView addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageView.mas_right).offset(10);
            make.top.equalTo(self.iconImageView);
            make.right.equalTo(self.containerView).offset(-15);
            make.height.mas_equalTo(@18);
        }];
        _nameLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:13];
        _nameLabel.textColor = RGBA(50, 30, 30, 1.0);
    }
    return _nameLabel;
}

- (UILabel *)signatureLabel
{
    if (!_signatureLabel) {
        
        _signatureLabel = [[UILabel alloc] init];
        [self.containerView addSubview:_signatureLabel];
        [_signatureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.nameLabel);

            make.bottom.equalTo(self.iconImageView);
        }];
        _signatureLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:11];
        _signatureLabel.textColor = RGBA(160, 150, 150, 1.0);
        
    }
    return _signatureLabel;
}

- (UIImageView *)contentImageView
{
    if (!_contentImageView) {
        
        _contentImageView = [[UIImageView alloc] init];
        [self.containerView addSubview:_contentImageView];
        [_contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconImageView.mas_bottom).offset(16);
            make.left.mas_equalTo(@15);
            make.right.mas_equalTo(@(-15));
            make.height.mas_equalTo(@211);
        }];
        _contentImageView.contentMode = UIViewContentModeScaleAspectFill;
        _contentImageView.clipsToBounds = YES;
    }
    return _contentImageView;
}

- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        [self.containerView addSubview:_contentLabel];
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentImageView.mas_bottom).offset(20);
            make.left.right.equalTo(self.contentImageView);
//            make.bottom.equalTo(self.signatureLabel.mas_top).offset(-12);
//            make.height.mas_equalTo(@20);
        }];
        _contentLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:18];
        _contentLabel.textColor = RGBA(80, 60, 60, 1.0);
        _contentLabel.textAlignment = NSTextAlignmentNatural;
        _contentLabel.numberOfLines = 0;

    }
    return _contentLabel;
}

- (UILabel *)introductionLabel
{
    if (!_introductionLabel) {
        _introductionLabel = [[UILabel alloc] init];
        [self.containerView addSubview:_introductionLabel];
        [_introductionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentLabel.mas_bottom).offset(12);
            make.left.right.equalTo(self.contentImageView);
            make.centerX.equalTo(self.containerView);
        }];
        _introductionLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:12];
        _introductionLabel.textColor = RGBA(160, 150, 150, 1.0);
        _introductionLabel.textAlignment = NSTextAlignmentNatural;
        _introductionLabel.numberOfLines = 2;
    }
    return _introductionLabel;
}

- (UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        [self.containerView addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.bottom.equalTo(self.contentView).offset(-40);
            make.left.right.equalTo(self.contentImageView);
            make.height.mas_equalTo(@0.33333);
            make.top.equalTo(self.introductionLabel.mas_bottom).offset(20);
        }];
    }
    return _lineView;
}
- (UILabel *)tagLabel
{
    if (!_tagLabel) {
        _tagLabel = [[UILabel alloc] init];
        [self.containerView addSubview:_tagLabel];
        [_tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentImageView);
            make.bottom.equalTo(self.containerView).offset(-12);
        }];
        _tagLabel.textColor = rgba(140, 120, 120, 1.0);
        _tagLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:11];
        _tagLabel.textAlignment = NSTextAlignmentNatural;
        _tagLabel.userInteractionEnabled = YES;
    }
    return _tagLabel;
}

- (UIButton *)tagButton
{
    if (!_tagButton) {
        _tagButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.containerView addSubview:_tagButton];
        [_tagButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentImageView);
//            make.centerY.equalTo(self.likeButton);
            make.height.mas_equalTo(@40);
            make.bottom.equalTo(self.containerView);
            make.top.equalTo(self.lineView.mas_bottom);
        }];
        _tagButton.titleLabel.textColor = rgba(140, 120, 120, 1.0);
        _tagButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:11];
        _tagButton.titleLabel.textAlignment = NSTextAlignmentNatural;
        [_tagButton addTarget:self action:@selector(typeClickAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tagButton;
}

- (UIButton *)likeButton
{
    if (!_likeButton) {
        _likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.containerView addSubview:_likeButton];
        [_likeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentImageView);
//            make.bottom.mas_equalTo(self.contentView).offset(-12);
            make.centerY.equalTo(self.tagButton);
        }];
        _likeButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Light" size:11];
        _likeButton.titleLabel.textAlignment = NSTextAlignmentNatural;
        [_likeButton setImage:[UIImage imageNamed:@"feed_favorite_icon_12x12_"] forState:UIControlStateNormal];
        [_likeButton setTitleColor:RGBA(160, 150, 150, 1.0) forState:UIControlStateNormal];
    }
    return _likeButton;
}

@end

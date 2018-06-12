
//
//  LWSHomeViewCell.m
//  liwushuo
//
//  Created by lee on 2017/12/7.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSHomeViewCell.h"

@interface LWSHomeViewCell()

@property (nonatomic, strong) UIView *bottomView;
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


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        
    }
    return self;
}

- (void)setModel:(Items *)model
{
    self.backgroundColor = [UIColor whiteColor];
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.author.avatarUrl] placeholderImage:nil options:SDWebImageTransformAnimatedImage completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
    }];
    [self.contentImageView sd_setImageWithURL:[NSURL URLWithString:model.coverImageUrl] placeholderImage:nil options:SDWebImageProgressiveDownload completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
    }];
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
    self.bottomView.backgroundColor = BackgroundColor;
    
}
- (void)configCellModel:(Items *)model
{
    

}

//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    self.contentLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 30;
//    self.introductionLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 30;
//    [super layoutSubviews];
//}

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

// 头像
- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconImageView];
        [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.contentView).offset(15);
            make.width.height.mas_equalTo(@36);

        }];
        _iconImageView.contentMode = UIViewContentModeScaleAspectFill;
        _iconImageView.layer.cornerRadius = 18;
        _iconImageView.layer.masksToBounds = YES;
    }
    return _iconImageView;
}

// 昵称
- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        
        _nameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageView.mas_right).offset(10);
            make.top.equalTo(self.iconImageView);
            make.right.equalTo(self.contentView).offset(-15);
            make.height.mas_equalTo(@18);
        }];
        _nameLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:13];
        _nameLabel.textColor = RGBA(50, 30, 30, 1.0);
    }
    return _nameLabel;
}
// 个性签名
- (UILabel *)signatureLabel
{
    if (!_signatureLabel) {
        
        _signatureLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_signatureLabel];
        [_signatureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.nameLabel);
//            make.top.equalTo(self.nameLabel.mas_bottom).offset(5);
            make.bottom.equalTo(self.iconImageView);
        }];
        _signatureLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:11];
        _signatureLabel.textColor = RGBA(160, 150, 150, 1.0);
        
    }
    return _signatureLabel;
}

// 图片
- (UIImageView *)contentImageView
{
    if (!_contentImageView) {
        
        _contentImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_contentImageView];
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

// 内容标题
- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_contentLabel];
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentImageView.mas_bottom).offset(10);
//            make.left.right.equalTo(self.contentImageView);
            make.width.mas_equalTo(self.contentView.mas_width).offset(-30);
            make.centerX.equalTo(self.contentView);
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
// 描述按钮
- (UILabel *)introductionLabel
{
    if (!_introductionLabel) {
        _introductionLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_introductionLabel];
        [_introductionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentLabel.mas_bottom).offset(12);
            make.left.right.equalTo(self.contentImageView);
//            make.centerX.equalTo(self.contentView);
            
        }];
        _introductionLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:12];
        _introductionLabel.textColor = RGBA(160, 150, 150, 1.0);
        _introductionLabel.textAlignment = NSTextAlignmentNatural;
        _introductionLabel.numberOfLines = 0;
    }
    return _introductionLabel;
}

//分割线
- (UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        [self.contentView addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.bottom.equalTo(self.contentView).offset(-40);
            make.top.equalTo(self.introductionLabel.mas_bottom).offset(10);
            make.left.right.equalTo(self.contentImageView);
            make.height.mas_equalTo(@0.33333);
            
        }];
    }
    return _lineView;
}

- (UILabel *)tagLabel
{
    if (!_tagLabel) {
        _tagLabel = [[UILabel alloc] init];
//        [self.contentView addSubview:_tagLabel];
        [_tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentImageView);
            make.top.equalTo(self.lineView.mas_bottom).offset(10);
            make.bottom.equalTo(self.contentView).offset(-12);
        }];
        _tagLabel.textColor = rgba(140, 120, 120, 1.0);
        _tagLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:11];
        _tagLabel.textAlignment = NSTextAlignmentNatural;
        _tagLabel.userInteractionEnabled = YES;
    }
    return _tagLabel;
}

// tag 按钮
- (UIButton *)tagButton
{
    if (!_tagButton) {
        _tagButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_tagButton];
        [_tagButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.lineView.mas_bottom);
            make.left.equalTo(self.contentImageView);
//            make.centerY.equalTo(self.likeButton);
            make.height.mas_equalTo(@40);
            //            make.bottom.equalTo(self.contentView);
        }];
        _tagButton.titleLabel.textColor = rgba(140, 120, 120, 1.0);
        _tagButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:11];
        _tagButton.titleLabel.textAlignment = NSTextAlignmentNatural;
        [_tagButton addTarget:self action:@selector(typeClickAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tagButton;
}

//点赞按钮
- (UIButton *)likeButton
{
    if (!_likeButton) {
        _likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_likeButton];
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

// 底部分隔 view
- (UIView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [[UIView alloc] init];
        [self.contentView addSubview:_bottomView];
        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.tagButton.mas_bottom).priorityHigh();
            make.left.right.bottom.equalTo(self.contentView);
            make.height.mas_equalTo(@10);
            
        }];
    }
    return _bottomView;
}

@end

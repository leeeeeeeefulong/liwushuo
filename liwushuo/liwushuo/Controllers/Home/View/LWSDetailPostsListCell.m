//
//  LWSDetailPostsListCell.m
//  liwushuo
//
//  Created by lee on 2017/12/20.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSDetailPostsListCell.h"
#import "LWSPosts.h"
#import "Author.h"
@interface LWSDetailPostsListCell ()

/// 昵称
@property (nonatomic, strong) UILabel *nameLabel;

/// 内容图片
@property (nonatomic, strong) UIImageView *contentImageView;

/// 喜欢按钮
@property (nonatomic, strong) UIButton *likeButton;
/// 时间
@property (nonatomic, strong) UILabel *timeLabel;

/// 标题
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation LWSDetailPostsListCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    LWSDetailPostsListCell *cell = [tableView dequeueReusableCellWithIdentifier:kDetailPostsListCell];
    if (!cell) {
        cell = [[LWSDetailPostsListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kDetailPostsListCell];
    }
    return cell;
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)configDetailPostsCellModel:(LWSPosts *)model
{
    [self.contentImageView setImageWithURL:[NSURL URLWithString:model.coverImageUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
    } usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.titleLabel.text = model.title;
    self.nameLabel.text = model.author.nickname;
//    self.timeLabel.text = @"12-19";
    [self.likeButton setTitle:[NSString stringWithFormat:@"  %.f",model.likesCount] forState:UIControlStateNormal];
    self.likeButton.selected = model.liked;
//    [self.likeButton addTarget:self action:@selector(favoriteClickBlock) forControlEvents:UIControlEventTouchUpInside];
    self.timeLabel.text = [self getDateStringWithTimeStr:[NSString stringWithFormat:@"%.f",model.createdAt]];
}

// 时间戳转时间,时间戳为13位是精确到毫秒的，10位精确到秒
- (NSString *)getDateStringWithTimeStr:(NSString *)str{
    NSTimeInterval time=[str doubleValue];//传入的时间戳str如果是精确到毫秒的记得要/1000
    NSDate *detailDate=[NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; //实例化一个NSDateFormatter对象
    //设定时间格式,这里可以设置成自己需要的格式
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss SS"];
    [dateFormatter setDateFormat:@"MM-dd"];
    NSString *currentDateStr = [dateFormatter stringFromDate: detailDate];
    return currentDateStr;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - buttonClickAction
- (void)favoriteButtonClickAction:(UIButton *)button
{
    !self.favoriteClickBlock ? : self.favoriteClickBlock(button);
}

#pragma mark - Getts
- (UIImageView *)contentImageView
{
    if (!_contentImageView) {
        _contentImageView = [[UIImageView alloc] init];
        [self addSubview:_contentImageView];
        [_contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self).offset(11);
            make.width.mas_equalTo(@143.52);
            make.height.mas_equalTo(@83);
        }];
        _contentImageView.contentMode = UIViewContentModeScaleAspectFill;
        _contentImageView.clipsToBounds = YES;
        _contentImageView.layer.cornerRadius = 3;
        _contentImageView.layer.masksToBounds = YES;
    }
    return _contentImageView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentImageView.mas_right).offset(11);
            make.top.equalTo(self.contentImageView).offset(12);
            make.right.lessThanOrEqualTo(self).offset(-12);
        }];
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
        _titleLabel.textColor = rgba(30, 30, 30, 1.0);
        _titleLabel.textAlignment = NSTextAlignmentNatural;
        _titleLabel.numberOfLines = 2;
    }
    return _titleLabel;
}

- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        [self addSubview:_timeLabel];
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(7);
        }];
        _timeLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:11];
        _timeLabel.textColor = rgba(150, 150, 150, 1.0);
        _timeLabel.textAlignment = NSTextAlignmentNatural;
    }
    return _timeLabel;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        [self addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.timeLabel.mas_right).offset(11);
            make.top.equalTo(self.timeLabel);
        }];
        _nameLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:11];
        _nameLabel.textColor = rgba(150, 150, 150, 1.0);
        _nameLabel.textAlignment = NSTextAlignmentNatural;
    }
    return _nameLabel;
}

- (UIButton *)likeButton
{
    if (!_likeButton) {
        _likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_likeButton];
        [_likeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-11);
            make.bottom.equalTo(self).offset(-20);
        }];
        [_likeButton setTitleColor:rgba(150, 150, 150, 1.0) forState:UIControlStateNormal];
        _likeButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:11];
        _likeButton.titleLabel.textAlignment = NSTextAlignmentNatural;
        [_likeButton setImage:[UIImage imageNamed:@"feed_favoriteicon_15x14_"] forState:UIControlStateNormal];
        [_likeButton setImage:[UIImage imageNamed:@"feed_favoriteicon_selected_15x14_"] forState:UIControlStateSelected];
        [_likeButton addTarget:self action:@selector(favoriteButtonClickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _likeButton;
}



@end

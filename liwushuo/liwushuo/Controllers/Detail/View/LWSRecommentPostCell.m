//
//  LWSRecommentPostCell.m
//  liwushuo
//
//  Created by PinelliaZeit on 2018/1/8.
//  Copyright © 2018年 Pinellia Zeit. All rights reserved.
//

#import "LWSRecommentPostCell.h"
#import "LWSRecommendPosts.h"
@interface LWSRecommentPostCell ()

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UILabel *textLabel;

@end


@implementation LWSRecommentPostCell

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
        make.edges.equalTo(self);
    }];
    self.imageView.layer.cornerRadius = 3;
    self.imageView.layer.masksToBounds = YES;
    
    self.textLabel = [[UILabel alloc] init];
    [self addSubview:self.textLabel];
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.baseline.equalTo(self).offset(-10);
    }];
    self.textLabel.textColor = rgba(255, 255, 255, 1.0);
    self.textLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    
}

- (void)setModel:(LWSRecommendPosts *)model
{
    _model = model;
    [self.imageView setImageWithURL:[NSURL URLWithString:model.coverImageUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
    } usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    self.textLabel.text = model.title;
}

@end

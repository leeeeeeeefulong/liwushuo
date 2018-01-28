
//
//  LWSContentView.m
//  liwushuo
//
//  Created by PinelliaZeit on 2018/1/10.
//  Copyright © 2018年 Pinellia Zeit. All rights reserved.
//

#import "LWSContentView.h"
#import "LWSItemData.h"
@interface LWSContentView()


@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UIButton *likeBtn;
@property (nonatomic, strong) UILabel *detailLabel;


@end

@implementation LWSContentView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

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
    UILabel *lb = [[UILabel alloc] init];
    [self addSubview:lb];
    [lb mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.top.left.right.equalTo(contentView).insets(UIEdgeInsetsMake(24, 53, 0, -53));
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(24);
        make.left.equalTo(self).offset(53);
        make.right.equalTo(self).offset(-53);
    }];
    lb.textColor = rgba(50, 30, 30, 1.0);
    lb.font = [UIFont fontWithName:@"PingFangSC-Regular" size:18];
    lb.textAlignment = NSTextAlignmentCenter;
    self.titleLabel = lb;
    
    UILabel *price = [[UILabel alloc] init];
    [self addSubview:price];
    [price mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lb.mas_bottom).offset(16);
        make.centerX.equalTo(self);
    }];
    price.textColor = rgba(255, 45, 71, 1.0);
    price.font = [UIFont fontWithName:@"Helvetica-Regular" size:21];
    price.textAlignment = NSTextAlignmentCenter;
    self.priceLabel = price;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(price.mas_bottom);
        make.centerX.equalTo(self);
        make.width.equalTo(price).offset(34);
        make.height.mas_equalTo(@28);
    }];
    
    [button setImage:[UIImage imageNamed:@"feed_favorite_icon_12x12_"] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"Helvetica-Light" size:11];
    [button setTitleColor:rgba(160, 150, 150, 1.0) forState:UIControlStateNormal];
    self.likeBtn = button;
    
    UILabel *detailLb = [[UILabel alloc] init];
    [self addSubview:detailLb];
    [detailLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
        make.top.equalTo(button.mas_bottom).offset(13);
        
    }];
    detailLb.textColor = rgba(160, 150, 150, 1.0);
    detailLb.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
    detailLb.numberOfLines = 0;
    [detailLb sizeToFit];
    self.detailLabel = detailLb;
    
    NSLog(@"%f",CGRectGetMaxY(detailLb.frame) + 20);
    
}


- (void)reloadData:(LWSItemData *)model
{
    self.titleLabel.text = model.shortDescription;
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@",model.price];
    [self.likeBtn setTitle:[NSString stringWithFormat:@"  %.f",model.likesCount] forState:UIControlStateNormal];
    self.detailLabel.text = model.itemDataDescription;
}

@end

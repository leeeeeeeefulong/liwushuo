//
//  LWSMePromotionsControl.m
//  liwushuo
//
//  Created by lee on 2017/12/29.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSMePromotionsControl.h"
#import "LWSMeImageBubbleView.h"
@interface LWSMePromotionsControl ()



@end

@implementation LWSMePromotionsControl

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
//        self.backgroundColor = [UIColor whiteColor];
        [self drawUI];
    }
    
    return self;
}

- (void)drawUI
{
    LWSMeImageBubbleView *shoppingCartView = [[LWSMeImageBubbleView alloc] init];
    [self addSubview:shoppingCartView];
    [shoppingCartView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(self);
        make.width.mas_equalTo(@53);
    }];
    shoppingCartView.titleLabel.text = @"购物车";
    shoppingCartView.imageView.image = [UIImage imageNamed:@"home_btn_shop_24x24_"];
    
    LWSMeImageBubbleView *ordersView = [[LWSMeImageBubbleView alloc] init];
    [self addSubview:ordersView];
    [ordersView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(shoppingCartView);
        make.top.equalTo(self);
        make.centerX.equalTo(self.mas_centerX).offset(-51.88);
    }];
    ordersView.titleLabel.text = @"订单";
    ordersView.imageView.image = [UIImage imageNamed:@"home_btn_form_24x24_"];
    
    LWSMeImageBubbleView *giftView = [[LWSMeImageBubbleView alloc] init];
    [self addSubview:giftView];
    [giftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.width.height.equalTo(shoppingCartView);
        make.centerX.equalTo(self.mas_centerX).offset(51.88);
    }];
    giftView.titleLabel.text = @"礼券";
    giftView.imageView.image = [UIImage imageNamed:@"home_btn_deed_24x24_"];
    
    LWSMeImageBubbleView *remindView = [[LWSMeImageBubbleView alloc] init];
    [self addSubview:remindView];
    [remindView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(self);
        make.width.equalTo(shoppingCartView);
    }];
    remindView.titleLabel.text = @"送礼提醒";
    remindView.imageView.image = [UIImage imageNamed:@"btn_remind_24x24_"];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

//
//  LWSMeAddNewGiftListFooterView.m
//  liwushuo
//
//  Created by lee on 2017/12/30.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSMeAddNewGiftListFooterView.h"

@implementation LWSMeAddNewGiftListFooterView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self drawUI];
        self.backgroundColor = rgba(255, 254, 254, 1.0);
    }
    
    return self;
}

- (void)drawUI
{
    UIButton * addbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:addbutton];
    [addbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(16.56);
        make.top.equalTo(self).offset(30);
        make.width.height.mas_equalTo(@36);
    }];
    [addbutton setImage:[UIImage imageNamed:@"icon_giftlist_add_24x24_"] forState:UIControlStateNormal];
    
    UILabel *textLabel = [[UILabel alloc] init];
    [self addSubview:textLabel];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(addbutton.mas_right).offset(12);
        make.centerY.equalTo(addbutton);
    }];
    textLabel.text = @"新建礼物清单";
    textLabel.textColor = rgba(58, 37, 37, 1.0);
    textLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16.56];
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

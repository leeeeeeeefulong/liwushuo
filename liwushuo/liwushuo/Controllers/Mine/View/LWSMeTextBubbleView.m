//
//  LWSMeTextBubbleView.m
//  liwushuo
//
//  Created by lee on 2017/12/29.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSMeTextBubbleView.h"

@interface LWSMeTextBubbleView ()



@end

@implementation LWSMeTextBubbleView

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
    UILabel *textCount = [[UILabel alloc] init];
    [self addSubview:textCount];
    [textCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.equalTo(self).multipliedBy(0.5);
    }];
    textCount.backgroundColor = [UIColor colorWithWhite:0 alpha:0.0];
    textCount.textColor = rgba(50, 30, 30, 1.0);
    textCount.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:14];
    textCount.textAlignment = NSTextAlignmentCenter;
    
    self.textCountLabel = textCount;
    
    UILabel *textTitle = [[UILabel alloc] init];
    [self addSubview:textTitle];
    [textTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self);
        make.height.equalTo(textCount);
    }];
    textTitle.backgroundColor = [UIColor colorWithWhite:0 alpha:0.0];
    textTitle.textColor = rgba(50, 30, 30, 1.0);
    textTitle.font = [UIFont fontWithName:@"PingFangSC-Light" size:11];
    textTitle.textAlignment = NSTextAlignmentCenter;
    self.textTitleLabel = textTitle;
}
@end

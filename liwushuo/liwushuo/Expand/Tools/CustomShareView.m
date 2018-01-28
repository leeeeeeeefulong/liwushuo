//
//  CustomShareView.m
//  liwushuo
//
//  Created by lee on 2017/11/24.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "CustomShareView.h"


#define ShareView_Height (Main_Screen_Height == 812.0 ? 252 : 218)

static NSInteger count  = 3;

@interface CustomShareView ()
{
    UIView *_view;
    UIWindow *_window;
    UITapGestureRecognizer *_tap;
}
@end

@implementation CustomShareView

#pragma mark - CycleView

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (void)baseUI
{
    _window = [UIApplication sharedApplication].keyWindow;
    _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
    [_window addGestureRecognizer:_tap];
    _view = [[UIView alloc] initWithFrame:_window.bounds];
    _view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    [_window addSubview:_view];
    [_view addSubview:self];
    self.frame = CGRectMake(0, Main_Screen_Height, Main_Screen_Width, ShareView_Height);
    [self drawUI];
}

- (void)drawUI
{

    UIView *buttonView = [[UIView alloc] initWithFrame:CGRectZero];
    buttonView.backgroundColor = [UIColor whiteColor];
    buttonView.frame = CGRectMake(0, 0, Main_Screen_Width, 175);
    [self addSubview:buttonView];
    
    CGFloat btnWidth = Main_Screen_Width / count;  //宽
    CGFloat btnHeight = 60.0; //高
    
    for (int i = 0; i < self.dataArray.count; i++) {
        
        int row = i / count; // 行
        int col = i % count; // 列
        
        CGFloat btnY = 0;
        if (row == 0) {
            btnY = row * btnHeight;
        } else {
            btnY = row * btnHeight + 20.0;
        }
        
        // 分享类型按钮
        UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [shareButton setImage:[UIImage imageNamed:self.dataArray[i]] forState:UIControlStateNormal];
        shareButton.frame = CGRectMake(col * btnWidth, btnY, btnWidth, btnHeight);
        shareButton.tag = i;
        [shareButton setBackgroundColor:[UIColor whiteColor]];
        [shareButton setTitle:@"" forState:UIControlStateNormal];
        [shareButton addTarget:self action:@selector(shareButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [buttonView addSubview:shareButton];
        
        // 分享类型标题
        
        UILabel *shareLabel = [[UILabel alloc] init];
        shareLabel.text = self.titleArray[i];
        shareLabel.font = [UIFont fontWithName:@"PingFang SC" size:11.0];
        shareLabel.textAlignment = NSTextAlignmentCenter;
        shareLabel.textColor = [UIColor colorWithRed:155/255.0 green:150/255.0 blue:150/255.0 alpha:1.0];
        shareLabel.frame = CGRectMake(shareButton.frame.origin.x, CGRectGetMaxY(shareButton.frame), shareButton.frame.size.width, 20.0f);
        [buttonView addSubview:shareLabel];
    }
    
    /// 取消按钮
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.backgroundColor = [UIColor whiteColor];
    cancelButton.titleLabel.font = [UIFont fontWithName:@"PingFang SC" size:14.0];
    cancelButton.layer.borderColor = [UIColor colorWithRed:155/255.0 green:150/255.0 blue:150/255.0 alpha:1.0].CGColor;
    cancelButton.layer.borderWidth = 0.5;
    [cancelButton setFrame:CGRectMake(0, CGRectGetMaxY(buttonView.frame), Main_Screen_Width, 43.0)];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor colorWithRed:65/255.0 green:60/255.0 blue:60/255.0 alpha:1.0] forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:cancelButton];
}

- (void)shareButtonClick:(UIButton *)button
{
    !self.shareBlock ? : self.shareBlock(button.tag);
    [self close];
}

#pragma mark - show and close
- (void)close
{
    [_window removeGestureRecognizer:_tap];
    _tap = nil;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.frame = CGRectMake(0, Main_Screen_Height, Main_Screen_Width, ShareView_Height);
    } completion:^(BOOL finished) {
        
        [_view removeFromSuperview];
    }];
}

- (void)show
{
    if (!self.dataArray.count) {
        return;
    }
    
    [self baseUI];
    
    [UIView animateWithDuration:0.2 animations:^{
        self.frame = CGRectMake(0, Main_Screen_Height - ShareView_Height, Main_Screen_Width, ShareView_Height);
    } completion:^(BOOL finished) {
        
    }];
    
}
@end

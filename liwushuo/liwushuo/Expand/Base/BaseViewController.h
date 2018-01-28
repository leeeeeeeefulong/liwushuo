//
//  BaseViewController.h
//  liwushuo
//
//  Created by lee on 2017/12/4.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic, assign) CGFloat navViewAlpha;

/// 动画开始
- (void)starAnmation;

/// 动画停止
- (void)stopAnmation;

/// 导航栏下划线
- (void)lineView;
@end

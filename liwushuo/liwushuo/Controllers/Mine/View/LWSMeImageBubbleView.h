//
//  LWSMeImageBubbleView.h
//  liwushuo
//
//  Created by lee on 2017/12/29.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^viewClickBlock)(void);
@interface LWSMeImageBubbleView : UIView

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *bageCountLabel;

@property (nonatomic, copy) viewClickBlock clickBlock;
@end

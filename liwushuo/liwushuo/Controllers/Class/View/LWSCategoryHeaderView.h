//
//  LWSCategoryHeaderView.h
//  liwushuo
//
//  Created by lee on 2017/12/14.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LWSCategoryHeaderView : UICollectionReusableView

@property (nonatomic, strong) UILabel *headTitleLabel;
@property (nonatomic, strong) UIButton *headFullGroupButton;
@property (nonatomic, copy) void(^headButtonClickBlock)(UIButton *button);
@end

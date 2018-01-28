//
//  UIView+Extension.h
//  liwushuo
//
//  Created by lee on 2017/12/5.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic) CGFloat maxX;
@property (nonatomic) CGFloat maxY;
- (BOOL)isShowingOnKeyWindow;
+ (instancetype)viewFromXib;
//获取该视图的控制器
- (UIViewController*) viewController;

//删除当前视图内的所有子视图
- (void) removeChildViews;

//删除tableview底部多余横线
- (void)setExtraCellLineHidden: (UITableView *)tableView;


@end

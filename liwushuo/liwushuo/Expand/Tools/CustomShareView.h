//
//  CustomShareView.h
//  liwushuo
//
//  Created by lee on 2017/11/24.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomShareView : UIView

/** 点击回调 */
@property (nonatomic, copy) void(^shareBlock)(NSInteger index);
/** 标题数组 */
@property (nonatomic, strong) NSArray *titleArray;
/** 图片数组 */
@property (nonatomic, strong) NSArray *dataArray;

/** 显示 */
- (void)show;
/** 关闭 */
- (void)close;
@end

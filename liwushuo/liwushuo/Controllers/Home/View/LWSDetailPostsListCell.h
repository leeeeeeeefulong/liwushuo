//
//  LWSDetailPostsListCell.h
//  liwushuo
//
//  Created by lee on 2017/12/20.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const kDetailPostsListCell = @"kDetailPostsListCell";
@class LWSPosts;
@interface LWSDetailPostsListCell : UITableViewCell
/// 喜欢 or 不喜欢 按钮事件
@property (nonatomic, copy) void(^favoriteClickBlock)(UIButton *btn);

+ (instancetype)cellWithTableView:(UITableView *)tableView;

- (void)configDetailPostsCellModel:(LWSPosts *)model;
@end

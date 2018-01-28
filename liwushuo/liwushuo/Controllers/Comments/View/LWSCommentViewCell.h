//
//  LWSCommentViewCell.h
//  liwushuo
//
//  Created by lee on 2018/1/3.
//  Copyright © 2018年 Pinellia Zeit. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LWSComments;
static NSString *const kCommentCell = @"kCommentCell";

@interface LWSCommentViewCell : UICollectionViewCell

@property (nonatomic, strong) LWSComments *model;

@end

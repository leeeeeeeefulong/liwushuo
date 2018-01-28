//
//  LWSDetailView.h
//  liwushuo
//
//  Created by lee on 2018/1/4.
//  Copyright © 2018年 Pinellia Zeit. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LWSItemData;
@interface LWSDetailView : UIView

- (void)reloadData:(LWSItemData *)model;

@end

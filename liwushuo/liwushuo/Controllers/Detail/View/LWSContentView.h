//
//  LWSContentView.h
//  liwushuo
//
//  Created by PinelliaZeit on 2018/1/10.
//  Copyright © 2018年 Pinellia Zeit. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LWSItemData;
@interface LWSContentView : UIView

- (void)reloadData:(LWSItemData *)model;

@end

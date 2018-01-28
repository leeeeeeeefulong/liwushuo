//
//  LWSCategoryFullViewController.h
//  liwushuo
//
//  Created by PinelliaZeit on 2018/1/27.
//  Copyright © 2018年 Pinellia Zeit. All rights reserved.
//

#import "BaseViewController.h"

@interface LWSCategoryFullViewController : BaseViewController
@property (nonatomic, strong) NSArray *dataArray;
- (void)reloadData:(NSArray *)dataArray;
@end

//
//  LWSHomeViewCell.h
//  liwushuo
//
//  Created by lee on 2017/12/7.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModels.h"

@interface LWSHomeViewCell : UITableViewCell

@property (nonatomic, copy) void(^typeClickBlcok)(void);

- (void)configCellModel:(Items *)model;
@end

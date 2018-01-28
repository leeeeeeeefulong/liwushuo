//
//  LWSCategoryViewController.h
//  liwushuo
//
//  Created by lee on 2017/12/19.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "BaseViewController.h"

typedef NS_ENUM(NSInteger , LWSCategoryType) {
    LWSCategoryTypeOne         = 0,
    LWSCategoryTypeTwo         = 1,
    LWSCategoryTypeThree       = 2,
    LWSCategoryBannerTypeOne   = 3,
    LWSCategoryBannerTypeTwo   = 4,
    LWSCategoryBannerTypeThree
};
@interface LWSCategoryViewController : BaseViewController

@property (nonatomic, assign) LWSCategoryType type;
@end

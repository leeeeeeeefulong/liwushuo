//
//  LWSHomeSuperVC.h
//  liwushuo
//
//  Created by lee on 2017/12/7.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "ZYBannerView.h"
typedef NS_ENUM(NSInteger, LWSControlStyle) {
    LWSControlStyleDefault = 0,
    LWSControlStyleHeader
};

typedef NS_ENUM(NSInteger, LWSControlType) {
    LWSControlTypeOne       = 0,
    LWSControlTypeTwo       = 1,
    LWSControlTypeThree     = 2,
    LWSControlTypeFour      = 3,
    LWSControlTypeFive      = 4
};

@interface LWSHomeSuperVC : BaseViewController

@property (nonatomic, assign) LWSControlStyle style;

@property (nonatomic, assign) LWSControlType type;

@property (nonatomic, strong) NSMutableArray *banners;

@property (nonatomic, strong) NSMutableArray *secondaryBanners;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) ZYBannerView *bannerView;

@property (nonatomic, strong) UIView *headView;

@property (nonatomic, strong) UITableView *tableView;


- (void)tapBtnScrollToTop;
@end

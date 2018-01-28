//
//  LWSRankListSuperVC.h
//  liwushuo
//
//  Created by lee on 2017/12/13.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
typedef NS_ENUM(NSInteger, LWSRankListVcType){
    RankListVcTypeOne = 0,
    RankListVcTypeTwo = 1,
    RankListVcTypeThree
};

@interface LWSRankListSuperVC : BaseViewController

@property (nonatomic, assign) LWSRankListVcType vcType;
@end

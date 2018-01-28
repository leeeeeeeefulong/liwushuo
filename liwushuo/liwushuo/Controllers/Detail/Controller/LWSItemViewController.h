//
//  LWSItemViewController.h
//  liwushuo
//
//  Created by lee on 2018/1/4.
//  Copyright © 2018年 Pinellia Zeit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface LWSItemViewController : BaseViewController

- (void)requestItemID:(NSString *)itemID;

- (void)reloadAlpha;
@end

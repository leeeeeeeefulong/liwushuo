//
//  LWSTabBarController.m
//  liwushuo
//
//  Created by lee on 2017/11/24.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSTabBarController.h"
#import "LWSHomeController.h"
#import "LWSTopController.h"
#import "LWSClassController.h"
#import "LWSMineController.h"
#import "LWSSignInController.h"
#import "BaseNavigationController.h"
@interface LWSTabBarController ()

@end

@implementation LWSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    BaseNavigationController *homeNav = [[BaseNavigationController alloc] initWithRootViewController:[LWSHomeController new]];
    BaseNavigationController *topNav = [[BaseNavigationController alloc] initWithRootViewController:[LWSTopController new]];
    BaseNavigationController *classNav = [[BaseNavigationController alloc] initWithRootViewController:[LWSClassController new]];
    BaseNavigationController *mineNav = [[BaseNavigationController alloc] initWithRootViewController:[LWSMineController new]];

    self.viewControllers = @[homeNav,topNav,classNav,mineNav];
    NSArray *imageArray = @[@"tab_icon_home_default_24x24_",@"tab_btn_list_default_24x24_",@"tab_btn_sort_default_24x24_",@"tab_btn_mine_default_24x24_"];
    NSArray *selectImgArray = @[@"tab_icon_home_Select_24x24_",@"tab_btn_list_select_24x24_",@"tab_btn_sort_select_24x24_",@"tab_btn_mine_select_24x24_"];
    NSArray *titleArray = @[@"首页",@"榜单",@"分类",@"我的"];
    NSInteger i = 0;
    for (UITabBarItem *item in self.tabBar.items) {
        
        item.title = titleArray[i];
        [item setImage:[[UIImage imageNamed:imageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [item setSelectedImage:[[UIImage imageNamed:selectImgArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:80/255.0 green:60/255.0 blue:60/255.0 alpha:1.0]} forState:UIControlStateNormal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:255/255.0 green:45/255.0 blue:71/255.0 alpha:1.0]} forState:UIControlStateSelected];
        i++;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

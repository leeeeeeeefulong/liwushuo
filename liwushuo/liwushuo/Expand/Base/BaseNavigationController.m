//
//  BaseNavigationController.m
//  liwushuo
//
//  Created by lee on 2017/12/4.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "BaseNavigationController.h"
#import "UIImage+YYAdd.h"
#import "UIView+YYAdd.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

+ (void)initialize {

    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageWithColor:RGB(255, 254, 254)] forBarMetrics:UIBarMetricsDefault];
    [bar setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"PingFangSC-Regular" size:17.0], NSForegroundColorAttributeName : kNavTitleColor}];
    [bar setTintColor:kNavTintColor];
    bar.shadowImage = [UIImage new];
//    bar.shadowImage = [UIImage imageWithColor:rgba(240, 230, 230, 1.0)];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.interactivePopGestureRecognizer.delegate = nil;
}

/**
- (void)screenShot
{
    // 将要被截图的view,即窗口的根控制器的view
    UIViewController *beyondVC = self.view.window.rootViewController;
    // 背景图片 总的大小
    CGSize size = beyondVC.view.frame.size;
    // 开启上下文,使用参数之后,截出来的是原图（YES  0.0 质量高）
    UIGraphicsBeginImageContextWithOptions(size, YES, 0.0);
    // 要裁剪的矩形范围
    CGRect rect = CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height);
    //注：iOS7以后renderInContext：由drawViewHierarchyInRect：afterScreenUpdates：替代
    [beyondVC.view drawViewHierarchyInRect:rect  afterScreenUpdates:NO];
    // 从上下文中,取出UIImage
    UIImage *snapshot = UIGraphicsGetImageFromCurrentImageContext();
    // 添加截取好的图片到图片数组
    if (snapshot) {
        [_screenshotImgs addObject:snapshot];
    }
    // 千万记得,结束上下文(移除栈顶的基于当前位图的图形上下文)
    UIGraphicsEndImageContext();
}
*/



- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        
//        [self screenShot];
        
        UIImage *leftItemImage = [[UIImage imageNamed:@"btn_back_black_24x24_"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        // 自定义返回按钮样式
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:leftItemImage
                                                                                           style:UIBarButtonItemStylePlain
                                                                                          target:self
                                                                                          action:@selector(popBack)];
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:YES];
}






//- (UIImage *)screenShot
//{
//    // 将要被截图的view,即窗口的根控制器的view(必须不含状态栏,默认ios7中控制器是包含了状态栏的)
//    UIViewController *beyondVC = self.navigationController.view.window.rootViewController;
//    // 背景图片 总的大小
//    CGSize size = beyondVC.view.frame.size;
//    // 开启上下文,使用参数之后,截出来的是原图（YES  0.0 质量高）
//    UIGraphicsBeginImageContextWithOptions(size, YES, 0.0);
//    // 要裁剪的矩形范围
//    CGRect rect = CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height);
//    //注：iOS7以后renderInContext：由drawViewHierarchyInRect：afterScreenUpdates：替代
//    [beyondVC.view drawViewHierarchyInRect:rect  afterScreenUpdates:NO];
//    // 从上下文中,取出UIImage
//    UIImage *snapshot = UIGraphicsGetImageFromCurrentImageContext();
//
//    // 千万记得,结束上下文(移除栈顶的基于当前位图的图形上下文)
//    UIGraphicsEndImageContext();
//
//    // 返回截取好的图片
//    return snapshot;
//
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    UIViewController *currentVc = self.topViewController;
    return [currentVc preferredStatusBarStyle];
}

- (UIViewController *)childViewControllerForStatusBarStyle
{
    return self.topViewController;
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

- (void)popBack
{
    [self popViewControllerAnimated:YES];
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

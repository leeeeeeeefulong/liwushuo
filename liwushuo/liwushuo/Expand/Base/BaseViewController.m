//
//  BaseViewController.m
//  liwushuo
//
//  Created by lee on 2017/12/4.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "BaseViewController.h"
#import "DGActivityIndicatorView.h"

@interface BaseViewController ()

@property (nonatomic, strong) DGActivityIndicatorView *indicatorView;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = BackgroundColor;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.extendedLayoutIncludesOpaqueBars = YES;
    
}

// 如果需要导航栏下的定制样式的 lineView
- (void)lineView {
    UIView *lineView = UI_UILineView();
    [self.view addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(44);
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
            
        } else {
            // Fallback on earlier versions
            make.top.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(64, 0, 0, 0));
        }
        
        make.height.mas_equalTo(@0.3333);
    }];
}

/// 动画开始
- (void)starAnmation
{
    DGActivityIndicatorView *activityIndicatorView = [[DGActivityIndicatorView alloc] initWithType:DGActivityIndicatorAnimationTypeBallPulseSync tintColor:RGBA(255, 45, 71, 1.0) size:30.0f];
    activityIndicatorView.frame = CGRectMake(0.0f, 0.0f, 50.0f, 50.0f);
    activityIndicatorView.center = self.view.center;
    activityIndicatorView.centerY -= 100;
    [self.view addSubview:activityIndicatorView];
    [activityIndicatorView startAnimating];
    [self.view bringSubviewToFront:activityIndicatorView];
    self.indicatorView = activityIndicatorView;
    
}

/// 动画停止
- (void)stopAnmation
{
    [self.indicatorView stopAnimating];
    [self.indicatorView removeFromSuperview];
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

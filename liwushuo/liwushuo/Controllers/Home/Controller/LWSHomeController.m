//
//  LWSHomeController.m
//  liwushuo
//
//  Created by lee on 2017/11/24.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSHomeController.h"
#import "LWSSignInController.h"
#import "LWSFeaturedController.h"

#import "LWSHomeSuperVC.h"
#import "LWSGirlFriendController.h"
#import "LWSShareViewController.h"
@interface LWSHomeController ()<UIScrollViewDelegate>
/// 底部的 view
@property (nonatomic, weak) UIView *indicatorView;
/// 选中的 button
@property (nonatomic, weak) UIButton *selectedButton;
/// 底部的所有内容
@property (nonatomic, weak) UIScrollView *contentView;
/// 顶部的所有标签栏
@property (nonatomic, weak) UIView *titlesView;
@end

@implementation LWSHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self customNavigationView];
    [self customScrollNavtionView];
    [self setupTitlesView];
    [self setupContentView];
    
}

- (void)customNavigationView
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"jingxuan_navi_left_54x17_"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(left)];
    self.navigationItem.leftBarButtonItem.enabled = NO;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"icon_scan_red_24x24_"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(right)];
    
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [searchButton setFrame:CGRectMake(0, 0, Main_Screen_Width * 0.6, 30)];
    [searchButton setTitle:@" 选份走心好礼送给 Ta" forState:UIControlStateNormal];
    [searchButton setTitleColor:RGBA(140, 120, 120, 1.0) forState:UIControlStateNormal];
    [searchButton setImage:[UIImage imageNamed:@"icon_search_16x16_"] forState:UIControlStateNormal];
    searchButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
    searchButton.titleLabel.textAlignment = NSTextAlignmentNatural;
    [searchButton setBackgroundColor:RGBA(250, 245, 245, 1.0)];
    searchButton.layer.shadowOffset = CGSizeMake(0, -3);
    searchButton.layer.shadowRadius = 3;
    searchButton.layer.cornerRadius = searchButton.height * 0.5;
    searchButton.layer.masksToBounds = YES;
    self.navigationItem.titleView = searchButton;

}


- (void)customScrollNavtionView
{
    LWSFeaturedController *vc1 =  [[LWSFeaturedController alloc] init];
    vc1.style = LWSControlStyleHeader;
    vc1.type = LWSControlTypeOne;
    
    LWSGirlFriendController *vc2 =  [LWSGirlFriendController new];
    vc2.type = LWSControlTypeTwo;
    
    LWSHomeSuperVC *vc3 =  [LWSHomeSuperVC new];
    vc3.type = LWSControlTypeThree;
    
    LWSHomeSuperVC *vc4 =  [LWSHomeSuperVC new];
    vc4.type = LWSControlTypeFour;
    
    LWSHomeSuperVC *vc5 =  [LWSHomeSuperVC new];
    vc5.type = LWSControlTypeFive;

    [self addChildViewController:vc1];
    [self addChildViewController:vc2];
    [self addChildViewController:vc3];
    [self addChildViewController:vc4];
    [self addChildViewController:vc5];
}

- (void)setupContentView
{
    // 不要自动调整 inset
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *contentView = [[UIScrollView alloc] init];
//    contentView.frame = self.view.bounds;
    CGFloat contentH = self.view.height - SafeAreaTopHeight - kScrollNavViewHeight - TabbarHeight - SafeAreaBottomHeight;
    contentView.frame = CGRectMake(0, SafeAreaTopHeight + kScrollNavViewHeight, self.view.width, contentH);
    contentView.delegate = self;
    contentView.pagingEnabled = YES;
    contentView.showsVerticalScrollIndicator = NO;
    contentView.showsHorizontalScrollIndicator = NO;

    [self.view insertSubview:contentView atIndex:0];
    
    contentView.contentSize = CGSizeMake(contentView.width * self.childViewControllers.count, 0);
    
//    [self.childViewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//
//        obj.view.x = idx * contentView.width;
//        obj.view.y = 0;
//        obj.view.height = contentView.height;
//        [contentView addSubview:obj.view];

//    }];

    
    self.contentView = contentView;
    /// 添加第一个控制器 view
    [self scrollViewDidEndScrollingAnimation:contentView];
}

- (void)setupTitlesView
{
    // 标签栏整体
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, SafeAreaTopHeight, Main_Screen_Width, 38)];
    contentView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:contentView];
    
    CGFloat  titleX = (CGFloat) ((Main_Screen_Width - 312) * 0.5);
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(titleX, 0, 312, 38)];
    titleView.backgroundColor = RGB(255, 254, 254);
    [contentView addSubview:titleView];
//    self.navigationItem.titleView = titleView;
    self.titlesView = titleView;

    // 底部的红色指示器
    UIView *indicatorView = [UIView new];
    indicatorView.backgroundColor = RGB(255, 45, 71);
    indicatorView.height = 2;
    indicatorView.tag = -1;
    indicatorView.y = 35;
    indicatorView.layer.cornerRadius = 1.5;
    indicatorView.layer.masksToBounds = YES;
    indicatorView.layer.shadowOffset = CGSizeMake(0, -3);
    indicatorView.layer.shadowRadius = 3;
    self.indicatorView = indicatorView;

    /// 内部的子标签
    CGFloat  width = titleView.width / 5;
    CGFloat  height = titleView.height - 2;

    NSArray *titleArray = @[@"精选",@"送女友",@"送基友",@"送同事",@"送长辈"];
    for (NSInteger i = 0; i < 5 ; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        button.height = height;
        button.width = width;
        button.x = i * width;
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        [button setTitleColor:RGB(255, 45, 71) forState:UIControlStateDisabled];
        [button setTitleColor:RGBA(50, 30, 30, 1.0) forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont fontWithName:@"PingFang SC" size:13];
        [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titleView addSubview:button];

        // 默认点击第一个按钮
        if (i == 0) {
            button.enabled = NO;
            self.selectedButton = button;

            // 让按钮内部的 label 根据文字内容来计算尺寸
            [button.titleLabel sizeToFit];
            self.indicatorView.width = button.titleLabel.width;
            self.indicatorView.centerX = button.centerX;
        }

    }
    [titleView addSubview:indicatorView];
}

- (void)titleClick:(UIButton *)button
{
    // 修改按钮状态
    self.selectedButton.enabled = YES;
    button.enabled = NO;
    self.selectedButton = button;
    
    // 动画
    [UIView animateWithDuration:0.25 animations:^{
        self.indicatorView.width = button.titleLabel.width;
        self.indicatorView.centerX = button.centerX;
    }];

    // 滚动
    CGPoint offset = self.contentView.contentOffset;
    offset.x = button.tag * self.contentView.width;
    [self.contentView setContentOffset:offset animated:YES];
}

#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
    scrollView.contentSize = CGSizeMake(scrollView.width * self.childViewControllers.count, 0);
    // 当前索引
    NSInteger index = scrollView.contentOffset.x / scrollView.width;

    // 取出子控制器
    UIViewController *vc = self.childViewControllers[index];
    vc.view.x = scrollView.contentOffset.x;
    vc.view.y = 0;
    vc.view.height = scrollView.height;
    [scrollView addSubview:vc.view];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    [self scrollViewDidEndScrollingAnimation:scrollView];

    // 点击按钮
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    [self titleClick:self.titlesView.subviews[index]];
    
}


#pragma mark - item Action
- (void)left {
    
}

- (void)right {
    
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

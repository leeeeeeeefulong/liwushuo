
//
//  LWSClassController.m
//  liwushuo
//
//  Created by lee on 2017/11/24.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSClassController.h"
#import "LWSPostCategoryViewController.h"
#import "LWSGiftCategoryController.h"

@interface LWSClassController ()<UIScrollViewDelegate>

/// 底部的 view
@property (nonatomic, weak) UIView *indicatorView;
/// 选中的 button
@property (nonatomic, weak) UIButton *selectedButton;
/// 底部的所有内容
@property (nonatomic, weak) UIScrollView *contentView;
/// 顶部的所有标签栏
@property (nonatomic, weak) UIView *titlesView;

@end

@implementation LWSClassController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupChildViewControllers];
    [self setupTitlesView];
    [self setupContentView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ScorllNavigation
- (void)setupChildViewControllers
{
    LWSPostCategoryViewController *vc1 = [[LWSPostCategoryViewController alloc] init];
//    UIViewController *vc1 = [[UIViewController alloc] init];
    LWSGiftCategoryController *vc2 = [[LWSGiftCategoryController alloc] init];
    
    [self addChildViewController:vc1];
    [self addChildViewController:vc2];
}

- (void)setupContentView
{
    // 不要自动调整 inset
//    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *contentView = [[UIScrollView alloc] init];
//    contentView.frame = self.view.bounds;
    CGFloat contentH = self.view.height - SafeAreaTopHeight - TabbarHeight - SafeAreaBottomHeight;
    contentView.frame = CGRectMake(0, SafeAreaTopHeight, self.view.width, contentH);
    contentView.delegate = self;
    contentView.pagingEnabled = YES;
    contentView.tag = 1001;
    contentView.scrollsToTop = NO;
    contentView.showsVerticalScrollIndicator = NO;
    contentView.showsHorizontalScrollIndicator = NO;
    
    for (NSInteger i = 0; i < 2; i++) {
        UIViewController *vc = self.childViewControllers[i];
        vc.view.frame = CGRectMake(i * contentView.width, 0, contentView.width, contentView.height);
        [contentView addSubview:vc.view];
        
    }
    [self.view insertSubview:contentView atIndex:0];
//    [self.view addSubview:contentView];
    contentView.contentSize = CGSizeMake(contentView.width * self.childViewControllers.count, 0);
    self.contentView = contentView;
    /// 添加第一个控制器 view
//    [self scrollViewDidEndScrollingAnimation:contentView];
}


- (void)setupTitlesView
{
    // 标签栏整体
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    titleView.backgroundColor = RGB(255, 254, 254);
    self.navigationItem.titleView = titleView;
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
    CGFloat  width = titleView.width / 2;
    CGFloat  height = titleView.height - 2;
    
    NSArray *titleArray = @[@"攻略",@"单品"];
    for (NSInteger i = 0; i < 2 ; i++) {
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
            self.indicatorView.width += 20.0f;
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
        self.indicatorView.width += 20.0f;
        self.indicatorView.centerX = button.centerX;
    }];
    
    // 滚动
    CGPoint offset = self.contentView.contentOffset;
    offset.x = button.tag * self.contentView.width;
    [self.contentView setContentOffset:offset animated:YES];
}

#pragma mark - <UIScrollViewDelegate>
//- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
//
////    scrollView.contentSize = CGSizeMake(scrollView.width * self.childViewControllers.count, 0);
//    // 当前索引
//    NSInteger index = scrollView.contentOffset.x / scrollView.width;
//
//    // 取出子控制器
//    UIViewController *vc = self.childViewControllers[index];
////    vc.view.x = scrollView.contentOffset.x;
////    vc.view.y = 0;
////    vc.view.height = scrollView.height;
//    vc.view.frame = CGRectMake(index * scrollView.width, 0, scrollView.width, scrollView.height);
//
//    [scrollView addSubview:vc.view];
//}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
//    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    // 点击按钮
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    [self titleClick:self.titlesView.subviews[index]];
    
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

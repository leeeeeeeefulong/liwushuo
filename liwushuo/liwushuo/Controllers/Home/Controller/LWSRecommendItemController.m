//
//  LWSRecommendItemController.m
//  liwushuo
//
//  Created by lee on 2018/1/3.
//  Copyright © 2018年 Pinellia Zeit. All rights reserved.
//

#import "LWSRecommendItemController.h"
#import "LWSItemViewController.h"
#import "BaseWebViewController.h"
#import "LWSCommentViewController.h"
#import "LWSMeImageBubbleView.h"
#import "CustomShareView.h"
@interface LWSRecommendItemController()<UIScrollViewDelegate>

/// 底部的 view
@property (nonatomic, weak) UIView *indicatorView;
/// 选中的 button
@property (nonatomic, weak) UIButton *selectedButton;
/// 底部的所有内容
@property (nonatomic, weak) UIScrollView *contentView;
/// 顶部的所有标签栏
@property (nonatomic, weak) UIView *titlesView;

@property (nonatomic, strong) NSArray *viewArrays;

@property (nonatomic, strong) BaseWebViewController *webVC;
@property (nonatomic, strong) LWSCommentViewController *commentVC;

@end

UIColor *disabledColor = nil;
UIColor *normalColor = nil;

@implementation LWSRecommendItemController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:kNavBackgroundColorAlpha(0)] forBarMetrics:UIBarMetricsDefault];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self requestRecommendData];
    
    disabledColor = RGB(255, 45, 71);
    normalColor = RGBA(50, 30, 30, 1.0);
    
    [self setupChildViewControllers];
    [self setupContentView];
    [self setupTitleView];
    [self setupFooterView];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(itemWebView:) name:@"kItemWebViewData" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(scrollTitleColor:) name:@"refreshScrollTitle" object:nil];
}

#pragma mark - notiaction

- (void)itemWebView:(NSNotification *)noti
{
    [_webVC.webView loadHTMLString:noti.object baseURL:nil];
    
}

- (void)scrollTitleColor:(NSNotification *)noti
{
    NSNumber *num = [noti object];
    if ([num isEqualToNumber:@1]) { // 默认状态
//        [self.selectedButton setTitleColor:RGB(255, 45, 71) forState:UIControlStateDisabled];
//        [self.selectedButton setTitleColor:RGBA(50, 30, 30, 1.0) forState:UIControlStateNormal];
        self.indicatorView.backgroundColor = disabledColor;
        
        [_titlesView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[UIButton class]]) {
                UIButton *button = (UIButton *)obj;
                [button setTitleColor:disabledColor forState:UIControlStateDisabled];
                [button setTitleColor:normalColor forState:UIControlStateNormal];
            }
        }];
        
        
    } else if ([num isEqualToNumber:@2]) { // 透明状态
        [_titlesView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[UIButton class]]) {
                UIButton *button = (UIButton *)obj;
                [button setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
                [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            }
        }];
        self.indicatorView.backgroundColor = [UIColor whiteColor];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupChildViewControllers
{
    LWSItemViewController *vc1 = [[LWSItemViewController alloc] init];
    vc1.view.backgroundColor = [UIColor whiteColor];
    [vc1 requestItemID:self.recommendID];
    
    BaseWebViewController *vc2 = [[BaseWebViewController alloc] init];
    _webVC = vc2;
    
    LWSCommentViewController *vc3 = [[LWSCommentViewController alloc] init];
    _commentVC = vc3;

    [self addChildViewController:vc1];
    [self addChildViewController:vc2];
    [self addChildViewController:vc3];
    
}

- (void)setupTitleView
{
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    titleView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.0];
    self.navigationItem.titleView = titleView;
    self.titlesView = titleView;
    // 底部的红色指示器
    UIView *indicatorView = [UIView new];
    indicatorView.backgroundColor = [UIColor whiteColor];
    indicatorView.height = 2;
    indicatorView.tag = -1;
    indicatorView.y = 35;
    indicatorView.layer.cornerRadius = 1.5;
    indicatorView.layer.masksToBounds = YES;
    self.indicatorView = indicatorView;
    
    /// 内部的子标签
    CGFloat  width = titleView.width / 3;
    CGFloat  height = titleView.height - 2;
    
    NSArray *titleArray = @[@"单品",@"详情",@"评论"];
    for (NSInteger i = 0; i < 3 ; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        button.height = height;
        button.width = width;
        button.x = i * width;
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        [button setTitleColor:disabledColor forState:UIControlStateDisabled];
        [button setTitleColor:normalColor forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont fontWithName:@"PingFang SC" size:13];
        [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titleView addSubview:button];
        
        // 默认点击第一个按钮
        if (i == 0) {
            button.enabled = NO;
            self.selectedButton = button;
            
            // 让按钮内部的 label 根据文字内容来计算尺寸
            [button.titleLabel sizeToFit];
            self.indicatorView.width = button.titleLabel.width += 20;
            self.indicatorView.centerX = button.centerX;
        }
        
    }
    [titleView addSubview:indicatorView];
}

- (void)setupContentView
{
    // 不要自动调整 inset
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *contentView = [[UIScrollView alloc] init];
    //    contentView.frame = self.view.bounds;
    CGFloat topY = !(Main_Screen_Width == 812) ? 0 : 44;
    CGFloat contentH = self.view.height - SafeAreaBottomHeight - 49;
    contentView.frame = CGRectMake(0, topY, self.view.width, contentH);
    contentView.delegate = self;
    contentView.pagingEnabled = YES;
    contentView.showsVerticalScrollIndicator = NO;
    contentView.showsHorizontalScrollIndicator = NO;
    
    [self.view insertSubview:contentView atIndex:0];
    
    contentView.contentSize = CGSizeMake(contentView.width * 3, 0);
    
    self.contentView = contentView;
    /// 添加第一个控制器 view
    [self scrollViewDidEndScrollingAnimation:contentView];
}

#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
    scrollView.contentSize = CGSizeMake(scrollView.width * 3, 0);
    // 当前索引
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    // 取出子控制器
//    UIViewController *vc = self.viewArrays[index];
    UIViewController *vc = self.childViewControllers[index];
    vc.view.x = scrollView.contentOffset.x;
    vc.view.y = scrollView.y;
    vc.view.height = scrollView.height;
    vc.view.width = scrollView.width;
    [scrollView addSubview:vc.view];
    

    if (index != 0) { // 非第一个控制器页面的时候 显示正常的颜色
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:kNavBackgroundColor] forBarMetrics:UIBarMetricsDefault];
        
        [_titlesView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[UIButton class]]) {
                UIButton *button = (UIButton *)obj;
                [button setTitleColor:disabledColor forState:UIControlStateDisabled];
                [button setTitleColor:normalColor forState:UIControlStateNormal];
            }
        }];
        self.indicatorView.backgroundColor = disabledColor;
        
    } else {  // 第一个的时候 显示 全白色
        
        if ([vc isKindOfClass:[LWSItemViewController class]]) {
            LWSItemViewController *itemVc = (LWSItemViewController *)vc;
            [itemVc reloadAlpha];
            [_titlesView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([obj isKindOfClass:[UIButton class]]) {
                    UIButton *button = (UIButton *)obj;
                    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
                    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                }
            }];
            self.indicatorView.backgroundColor = [UIColor whiteColor] ;
        }
        
        
        
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    [self scrollViewDidEndScrollingAnimation:scrollView];
    // 点击按钮
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    [self titleClick:self.titlesView.subviews[index]];
    
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
        self.indicatorView.width += 30;
        self.indicatorView.centerX = button.centerX;
    }];
    
    // 滚动
    CGPoint offset = self.contentView.contentOffset;
    offset.x = button.tag * self.contentView.width;
    [self.contentView setContentOffset:offset animated:YES];
}


- (void)setupFooterView
{
    UIView *footerView = [[UIView alloc] init];
    [self.view addSubview:footerView];
    [footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            // Fallback on earlier versions
            make.left.right.bottom.equalTo(self.view);
        }
        make.height.mas_equalTo(@49);
    }];
    footerView.backgroundColor = rgba(249, 249, 249, 1.0);
    
    LWSMeImageBubbleView * likeView = [[LWSMeImageBubbleView alloc] init];
    [footerView addSubview:likeView];
    [likeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(footerView).offset(32);
        make.top.bottom.equalTo(footerView);
        make.width.mas_equalTo(@40);
    }];
    likeView.imageView.image = [UIImage imageNamed:@"btn_like_default_24x24_"];
    likeView.titleLabel.text = @"喜欢";
    
    LWSMeImageBubbleView * shareView = [[LWSMeImageBubbleView alloc] init];
    [footerView addSubview:shareView];
    [shareView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(footerView).offset(92);
        make.top.bottom.equalTo(footerView);
        make.width.mas_equalTo(@40);
    }];
    shareView.imageView.image = [UIImage imageNamed:@"btn_share_black_24x24_"];
    shareView.titleLabel.text = @"分享";
    shareView.clickBlock = ^{
        CustomShareView *shareV = CS_ShareVie();
        [shareV show];
    };
    
    UIButton *goTmall = [UIButton buttonWithType:UIButtonTypeCustom];
    [footerView addSubview:goTmall];
    [goTmall mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(footerView).offset(158);
        make.right.top.bottom.equalTo(footerView);
    }];
    goTmall.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
    [goTmall setTitle:@"去天猫购买" forState:UIControlStateNormal];
    [goTmall setBackgroundImage:[UIImage imageWithColor:rgba(255, 45, 71, 1.0)] forState:UIControlStateNormal];
    
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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

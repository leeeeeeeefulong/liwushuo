//
//  LWSDetailViewController.m
//  liwushuo
//
//  Created by lee on 2018/1/3.
//  Copyright © 2018年 Pinellia Zeit. All rights reserved.
//

#import "LWSDetailViewController.h"
#import "LWSDetailData.h"
#import "LWSDetailDataColumn.h"
#import "LWSItemAdMonitors.h"
#import <WebKit/WebKit.h>
#import "LWSRecommendItemController.h"
#import "LWSColumnDetailViewController.h"
#import "CustomShareView.h"
#import "LWSCommentViewController.h"
#import "LWSItemViewController.h"

@interface LWSDetailViewController ()<WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) LWSDetailData *data;

@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *centerBtn;
@property (nonatomic, strong) UIButton *rightBtn;

@end

@implementation LWSDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"攻略详情";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"查看全集" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemAction)];
    
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
    
    [self.view addSubview:self.webView];

    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-TabbarHeight);
        } else {
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(SafeAreaTopHeight, 0, 49, 0));
        }
        
    }];
    
    [self requstWebData];
    [self setupFooterView];
    
}


- (void)setupFooterView
{
    UIView *footerView = [[UIView alloc] init];
    [self.view addSubview:footerView];
    [footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
        } else {
            // Fallback on earlier versions
            make.left.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }
        make.height.mas_equalTo(@49);
        
    }];
    footerView.backgroundColor = BackgroundColor;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [footerView addSubview:leftButton];
    
    UIButton *centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [footerView addSubview:centerButton];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [footerView addSubview:rightButton];
    
    [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.top.equalTo(footerView);
        make.width.mas_equalTo(@(self.view.width / 3));
    }];
    
    [centerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.equalTo(footerView);
        make.left.equalTo(leftButton.mas_right);
        make.width.equalTo(leftButton);
    }];
    
    [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.right.equalTo(footerView);
        make.width.equalTo(leftButton);
    }];
    
    [leftButton setImage:[UIImage imageNamed:@"toolbar_btn_favorite_24x24_"] forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"toolbar_btn_like_choosed_24x24_"] forState:UIControlStateSelected];
    [leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    leftButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
    [leftButton setTitleColor:rgba(50, 30, 30, 1.0) forState:UIControlStateNormal];
    
    [centerButton setImage:[UIImage imageNamed:@"toolbar_btn_share_24x24_"] forState:UIControlStateNormal];
    [centerButton addTarget:self action:@selector(centerButtonClick) forControlEvents:UIControlEventTouchUpInside];
    centerButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
    [centerButton setTitleColor:rgba(50, 30, 30, 1.0) forState:UIControlStateNormal];
    
    [rightButton setImage:[UIImage imageNamed:@"btn_comment_default_24x24_"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightButtonClick) forControlEvents:UIControlEventTouchUpInside];
    rightButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
    [rightButton setTitleColor:rgba(50, 30, 30, 1.0) forState:UIControlStateNormal];
    
    self.leftBtn = leftButton;
    self.centerBtn = centerButton;
    self.rightBtn = rightButton;
}

#pragma mark - buttonClickAction
- (void)leftButtonClick:(UIButton *)btn
{

    btn.selected = !btn.selected;
    NSLog(@"%@",btn.currentTitle);
}

- (void)centerButtonClick
{
    CustomShareView *shareView = CS_ShareVie();
    
    [shareView show];
}

- (void)rightButtonClick
{
    // 评论
    LWSCommentViewController *vc = [[LWSCommentViewController alloc] init];
    [vc reqestCommentDataWithID:[NSString stringWithFormat:@"%.f",self.data.detailDataIdentifier]];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)rightItemAction
{
    LWSColumnDetailViewController *vc = [[LWSColumnDetailViewController alloc] init];
    
    vc.columnID = [NSString stringWithFormat:@"%.f",self.data.detailDataColumn.detailDataColumnIdentifier];
    [self.navigationController  pushViewController:vc animated:YES];
}

#pragma mark - request

- (void)requstWebData
{
    WeakSelf;
    [[AllData shareManager] sendReuestWithMethod:Get urlString:[NSString stringWithFormat:@"https://api.liwushuo.com/v2/posts_v2/%@?",self.postsID] parameter:@{} andCompletionBlock:^(NSDictionary *resultObject) {
        if ([resultObject[@"code"] isEqualToNumber:@200]) {
    
            LWSDetailData *model = [LWSDetailData modelObjectWithDictionary:resultObject[@"data"]];
            weakSelf.urlStr = model.contentUrl;
            weakSelf.data = model;
            [weakSelf.leftBtn setTitle:[NSString stringWithFormat:@"  %.f",model.likesCount] forState:UIControlStateNormal];
            [weakSelf.centerBtn setTitle:[NSString stringWithFormat:@"  %.f",model.sharesCount] forState:UIControlStateNormal];
            [weakSelf.rightBtn setTitle:[NSString stringWithFormat:@"  %.f",model.commentsCount] forState:UIControlStateNormal];
            [weakSelf.webView loadHTMLString:model.contentHtml baseURL:nil];
            
        }
    } failureBlock:^(id error) {
        NSLog(@"请求错误 %@",error);
    }];
}

#pragma mark - delegate

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    //  参考资料
    //  [iOS和JS的交互之在代理方法拦截Url,识别判断 \- CSDN博客](http://blog.csdn.net/iOSbird/article/details/52106067)
    
    NSString *url = navigationAction.request.URL.absoluteString;
    NSString *needCheckStr = @"http://www.liwushuo.com/items/";
    NSRange range = [url rangeOfString:needCheckStr];
    
    if (range.location != NSNotFound) {
        NSMutableString *linkmStr = [NSMutableString stringWithString:url];
        NSRange deleteRange = {0, range.length};
        [linkmStr deleteCharactersInRange:deleteRange];
        
        NSLog(@" 商品 id -  %@",linkmStr);
        LWSRecommendItemController *vc = [[LWSRecommendItemController alloc] init];
        vc.recommendID = linkmStr;
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    decisionHandler(WKNavigationActionPolicyAllow);
    
}

#pragma mark - Getts
- (WKWebView *)webView
{
    if (!_webView) {
        // 创建配置
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        // 创建UserContentController（提供JavaScript向webView发送消息的方法）
        WKUserContentController* userContent = [[WKUserContentController alloc] init];
        // 添加消息处理，注意：self指代的对象需要遵守WKScriptMessageHandler协议，结束时需要移除
        //NativeMethod 这个方法一会要与JS里面的方法写的一样
//        [userContent addScriptMessageHandler:self name:@"NativeMethod"];
        
        // 将UserConttentController设置到配置文件
        config.userContentController = userContent;
        // 高端的自定义配置创建WKWebView
        _webView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:config];
        _webView.navigationDelegate = self;
        _webView.backgroundColor = BackgroundColor;
        
    }
    return _webView;
}

@end

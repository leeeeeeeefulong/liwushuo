//
//  LWSTopController.m
//  liwushuo
//
//  Created by lee on 2017/11/24.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSTopController.h"
#import "LWSRankListSuperVC.h"
#import "CustomShareView.h"
#import "LWSShareViewController.h"
#import <Accelerate/Accelerate.h>
@interface LWSTopController ()<UIScrollViewDelegate>
@property (weak,nonatomic)UIView *indicatorView;
@property (weak,nonatomic)UIButton *selectedButton;
/** 底部的所有内容 */
@property (nonatomic, weak) UIScrollView *contentView;
/** 顶部的所有标签 */
@property (nonatomic, weak) UIView *titlesView;

@end

@implementation LWSTopController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = BackgroundColor;
    self.navigationItem.title = @"礼物榜";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"btn_share_black_24x24_"]                                       imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(shareItemClick)];


    [self setupChildVces];
    [self setupTitlesView];
    [self setupContentView];
}

- (void)shareItemClick
{
    // 分享
    
    LWSShareViewController *share = [[LWSShareViewController alloc] init];
    
    [self presentViewController:share animated:YES completion:^{
        share.blurImageView.image = [self getNormalImage:self.navigationController.view];
    }];
    
//    CustomShareView *shareView = CS_ShareVie();
//    [shareView show];
}

//  截屏时候遇到 scrollView 导致有部分截取不到
// 参考资料 [我只是想要截个屏 \| Startry Blog](http://blog.startry.com/2016/02/23/Screenshots-With-SwViewCapture/)
#pragma mark - 获取屏幕截图

- (UIImage *)getNormalImage:(UIView *)view
{
    
    UIGraphicsBeginImageContextWithOptions([UIApplication sharedApplication].keyWindow.frame.size, NO, [[UIScreen mainScreen] scale]); // 高清
    //    UIGraphicsBeginImageContext(CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)); // 模糊
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [view.layer renderInContext:context];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return [self boxblurImage:image withBlurNumber:0.3];;
    
}

-(UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur
{
    if (blur < 0.f || blur > 1.f) {
        blur = 0.5f;
    }
    int boxSize = (int)(blur * 40);
    boxSize = boxSize - (boxSize % 2) + 1;
    CGImageRef img = image.CGImage;
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    void *pixelBuffer;
    //从CGImage中获取数据
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    //设置从CGImage获取对象的属性
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGContextRef ctx = CGBitmapContextCreate( outBuffer.data, outBuffer.width, outBuffer.height, 8, outBuffer.rowBytes, colorSpace, kCGImageAlphaNoneSkipLast);
    // 解决 红色背景模糊后变蓝色
//    [iOS几种高斯模糊效果的实现与比较 \- 简书](https://www.jianshu.com/p/341a06dd0b46)

    CGContextRef ctx = CGBitmapContextCreate( outBuffer.data, outBuffer.width, outBuffer.height, 8, outBuffer.rowBytes, colorSpace, CGImageGetBitmapInfo(image.CGImage));
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    //clean up CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    free(pixelBuffer);
    CFRelease(inBitmapData);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    return returnImage;
}

#pragma mark - drawUI

/**
 * 初始化子控制器
 */
- (void)setupChildVces
{
    LWSRankListSuperVC *vc1 = [LWSRankListSuperVC new];
    vc1.vcType = RankListVcTypeOne;
    
    LWSRankListSuperVC *vc2 = [LWSRankListSuperVC new];
    vc2.vcType = RankListVcTypeTwo;
    
    LWSRankListSuperVC *vc3 = [LWSRankListSuperVC new];
    vc3.vcType = RankListVcTypeThree;
    
    [self addChildViewController:vc1];
    [self addChildViewController:vc2];
    [self addChildViewController:vc3];

}


- (void)setupTitlesView
{
    // 标签栏整体
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, SafeAreaTopHeight, Main_Screen_Width, 38)];
    contentView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:contentView];
    
    CGFloat  titleX = (CGFloat) (Main_Screen_Width - Main_Screen_Width * 0.8) / 2;
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(titleX, 0, Main_Screen_Width * 0.8, 38)];
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
    CGFloat  width = titleView.width / 3;
    CGFloat  height = titleView.height - 2;
    
    NSArray *titleArray = @[@"每日推荐",@"TOP100",@"独立原创榜"];
    for (NSInteger i = 0; i < 3 ; i++) {
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
            self.indicatorView.width = button.titleLabel.width += 20;
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
        self.indicatorView.width += 30;
        self.indicatorView.centerX = button.centerX;
    }];

    // 滚动
    CGPoint offset = self.contentView.contentOffset;
    offset.x = button.tag * self.contentView.width;
    [self.contentView setContentOffset:offset animated:YES];

}



/**
 * 底部的scrollView
 */
- (void)setupContentView
{
    // 不要自动调整inset
//    self.automaticallyAdjustsScrollViewInsets = NO;

    UIScrollView *contentView = [[UIScrollView alloc] init];
    CGFloat contentH = self.view.height - SafeAreaTopHeight - kScrollNavViewHeight - TabbarHeight - SafeAreaBottomHeight;
    contentView.frame = CGRectMake(0, SafeAreaTopHeight + kScrollNavViewHeight, self.view.width, contentH);
//    contentView.frame = self.view.bounds;
    contentView.delegate = self;
    contentView.pagingEnabled = YES;
    [self.view insertSubview:contentView atIndex:0];
    contentView.contentSize = CGSizeMake(contentView.width * self.childViewControllers.count, 0);
    self.contentView = contentView;

    // 添加第一个控制器的view
    [self scrollViewDidEndScrollingAnimation:contentView];
}


#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    // 当前的索引
    NSInteger index = scrollView.contentOffset.x / scrollView.width;

    // 取出子控制器
    UIViewController *vc = self.childViewControllers[index];
    vc.view.left = scrollView.contentOffset.x;
    vc.view.y = 0; // 设置控制器view的y值为0(默认是20)
    vc.view.height = scrollView.height; // 设置控制器view的height值为整个屏幕的高度(默认是比屏幕高度少个20)
    [scrollView addSubview:vc.view];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];

    // 点击按钮
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    [self titleClick:self.titlesView.subviews[index]];
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

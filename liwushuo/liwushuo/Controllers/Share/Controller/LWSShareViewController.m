//
//  LWSShareViewController.m
//  liwushuo
//
//  Created by lee on 2017/11/23.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSShareViewController.h"
#import "LWSShareViewCell.h"
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight 44.0
//注意：请直接获取系统的tabbar高度，若没有用系统tabbar，建议判断屏幕高度；之前判断状态栏高度的方法不妥，如果正在通话状态栏会变高，导致判断异常，下面只是一个例子，请勿直接使用！
#define kTabBarHeight kAppDelegate.mainTabBar.tabBar.frame.size.height
#define kTopHeight (kStatusBarHeight + kNavBarHeight)

static NSString *const kShareCell = @"kShareCell";
@interface LWSShareViewController () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation LWSShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.blurImageView];
    [self.blurImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    UIView *maskView = [[UIView alloc] init];
    [self.view addSubview:maskView];
    [maskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    maskView.backgroundColor = rgba(0, 0, 0, 0.1);
    
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-50);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
        } else {
            // Fallback on earlier versions
            make.left.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 50, 0));
        }
        make.height.mas_equalTo(@180);
    }];
    
    [self.view addSubview:self.cancelButton];
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
        } else {
            // Fallback on earlier versions
            make.left.right.bottom.equalTo(self.view);
        }
        make.height.mas_equalTo(@50);
    }];
    
    [self.cancelButton addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.cancelButton);
        make.height.mas_equalTo(@0.3333);
    }];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self disMiss];
}

- (void)disMiss {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}
#pragma mark - collectionView delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LWSShareViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:kShareCell forIndexPath:indexPath];
    cell.imageV.image = [UIImage imageNamed:self.dataArray[indexPath.item]];
    cell.title.text = self.titleArray[indexPath.item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    [self disMiss];
}

#pragma mark - lazy load
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        CGFloat itemW = [UIScreen mainScreen].bounds.size.width / 3;
        flowLayout.itemSize = CGSizeMake(itemW, 80);
        flowLayout.sectionInset = UIEdgeInsetsZero;
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.headerReferenceSize = CGSizeZero;
        flowLayout.footerReferenceSize = CGSizeZero;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[LWSShareViewCell class] forCellWithReuseIdentifier:kShareCell];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"kFooter"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"kHeader"];
}
    return _collectionView;
}

- (NSArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = @[@"friendcirle_36x36_",@"wechat_36x36_",@"sina_36x36_",@"qzone_37x37_",@"qq_36x36_",@"copyline_37x37_"];
    }
    return _dataArray;
}

- (NSArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = @[@"朋友圈",@"微信好友",@"微博",@"QQ 空间",@"QQ 好友",@"复制链接"];
    }
    return _titleArray;
}

- (UIButton *)cancelButton
{
    if (!_cancelButton) {
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancelButton setBackgroundColor:[UIColor whiteColor]];
        _cancelButton.layer.borderColor = [UIColor colorWithRed:240/255.0 green:235/255.0 blue:235/255.0 alpha:1.0].CGColor;
        _cancelButton.layer.borderWidth = 0.1f;
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelButton setTitleColor:[UIColor colorWithRed:65/255.0 green:60/255.0 blue:60/255.0 alpha:1.0] forState:UIControlStateNormal];
        _cancelButton.titleLabel.font = [UIFont fontWithName:@"PingFang SC" size:14.0f];
        [_cancelButton addTarget:self action:@selector(disMiss) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}

- (UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = rgba(240, 235, 235, 1.0);
    }
    return _lineView;
}

- (UIImageView *)blurImageView
{
    if (!_blurImageView) {
        _blurImageView = [[UIImageView alloc] initWithFrame:DefaultRect];
        _blurImageView.contentMode = UIViewContentModeScaleAspectFill;
        _blurImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
        [tap addTarget:self action:@selector(disMiss)];
        [_blurImageView addGestureRecognizer:tap];
    }
    return _blurImageView;
}

#pragma mark - StatusBarStyle

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end

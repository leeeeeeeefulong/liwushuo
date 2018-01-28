
//
//  LWSHomeSuperVC.m
//  liwushuo
//
//  Created by lee on 2017/12/7.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSHomeSuperVC.h"
#import "LWSHomeViewCell.h"
#import "LWSColumnDetailViewController.h"
#import "DataModels.h"
#import "Banners.h"
#import "SecondaryBanners.h"
#import "LWSDetailViewController.h"
#import <SafariServices/SafariServices.h>

#define kCollectionViewHeight kScrollNavViewHeight + SafeAreaTopHeight + TabbarHeight
static NSString *const kCustomCell = @"kCustom";
//static CGFloat kScrollNavViewHeight = 38.0;
static CGFloat markY = 0.0f;

@interface LWSHomeSuperVC ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate,UITableViewDataSource>



@property (nonatomic, assign) CGFloat topSpace;
@property (nonatomic, strong) NSMutableArray<Items *> * dataArray;
@property (nonatomic, strong) UIButton *scrolltopBtn;
/// 下一个分页的请求地址
@property (nonatomic, strong) NSString *requestURL;

@end

@implementation LWSHomeSuperVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGBA(250, 245, 245, 1.0);
    
    
    [self drawUI];
    [self requestHomeData];     // 数据请求
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    layout.estimatedItemSize = CGSizeMake(Main_Screen_Width, Main_Screen_Width);
//    if (@available(iOS 10.0, *)) {
//        self.collectionView.prefetchingEnabled = YES;
//        layout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize;
//        [layout invalidateLayout];
//    } else {
//        // Fallback on earlier versions
//        layout.estimatedItemSize = CGSizeMake(Main_Screen_Width, Main_Screen_Width);
//    }
//    [self.collectionView reloadData];
}
#pragma mark - baseUI
- (void)drawUI
{
    if (self.style == LWSControlStyleHeader) {
        self.topSpace = 330;
    } else {
        self.topSpace = 10;
        self.headView.height = 0;
    }
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        } else {
            make.edges.equalTo(self.view);
        }
    }];
    
    // 返回 top 按钮
    UIButton *scrolltopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:scrolltopBtn];
    [scrolltopBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight).offset(-20);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-60);
        } else {
            // Fallback on earlier versions
            make.right.equalTo(self.view.mas_right).offset(-20);
            make.bottom.equalTo(self.view.mas_bottom).offset(-20);
        }
        make.width.height.mas_equalTo(@34);
    }];
    [scrolltopBtn setBackgroundImage:[UIImage imageNamed:@"btn_scrolltop_34x34_"] forState:UIControlStateNormal];
    [scrolltopBtn addTarget:self action:@selector(tapBtnScrollToTop) forControlEvents:UIControlEventTouchUpInside];
    scrolltopBtn.hidden = YES;
    self.scrolltopBtn = scrolltopBtn;
}

- (void)tapBtnScrollToTop
{
    // 滑到顶部
    [self.collectionView scrollToTop];
    
}

#pragma mark - request Data
- (void)requestHomeData
{
    [self starAnmation];
//    __weak typeof(self) weakSelf = self;
    WeakSelf;
    
    NSString * url;
    switch (self.type) {
        case LWSControlTypeOne:
            url = @"https://api.liwushuo.com/v2/channels/106/items_v2?ad=2&gender=1&generation=0&limit=20&offset=0";
            break;
        case LWSControlTypeTwo:
            url = @"https://api.liwushuo.com/v2/channels/10/items_v2?gender=1&generation=0&limit=20&offset=0";
            break;
        case LWSControlTypeThree:
            url = @"https://api.liwushuo.com/v2/channels/26/items_v2?gender=1&generation=0&limit=20&offset=0";
            break;
        case LWSControlTypeFour:
            url = @"https://api.liwushuo.com/v2/channels/17/items_v2?gender=1&generation=0&limit=20&offset=0";
            break;
        case LWSControlTypeFive:
            url = @"https://api.liwushuo.com/v2/channels/6/items_v2?gender=1&generation=0&limit=20&offset=0";
            break;
        default:
            break;
    }
    
    
    [[AllData shareManager] sendReuestWithMethod:Get urlString:url parameter:@{} andCompletionBlock:^(NSDictionary *resultObject) {
    
        StrongSelf;
        if (strongSelf) {
            if ([resultObject[@"code"] isEqualToNumber:@200]) {
                
                LWSGiftCategoryModel *data = [LWSGiftCategoryModel modelObjectWithDictionary:resultObject[@"data"]];
                strongSelf.requestURL = data.paging.nextUrl;
                [strongSelf.dataArray removeAllObjects];
                strongSelf.dataArray = [NSMutableArray arrayWithArray:data.items];
//                [strongSelf.collectionView reloadData];
                [strongSelf.tableView reloadData];
            } else {
                // 返回非 200 的时候要处理的事情
            }
            
            [strongSelf stopAnmation];
        }
        
    } failureBlock:^(id error) {
        [weakSelf stopAnmation];
        NSLog(@" 请求错误  --- %@",error);
    }];
}

- (void)loadMoreData
{
    WeakSelf;
    [[AllData shareManager] sendReuestWithMethod:Get urlString:self.requestURL parameter:@{} andCompletionBlock:^(NSDictionary *resultObject) {
        StrongSelf;
        if (strongSelf) {
            
            if ([resultObject[@"code"] isEqualToNumber:@200]) {
                
                LWSGiftCategoryModel *data = [LWSGiftCategoryModel modelObjectWithDictionary:resultObject[@"data"]];
                strongSelf.requestURL = data.paging.nextUrl;
                [strongSelf.dataArray addObjectsFromArray:data.items];;
//                [strongSelf.collectionView reloadData];
                [strongSelf.tableView reloadData];
//                strongSelf.isMoreData = YES;
            } else {
                // 返回非 200 的时候要处理的事情
            }
            
        }
        
    } failureBlock:^(id error) {
        NSLog(@" 请求错误  --- %@",error);
    }];
}
#pragma mark - scrollView delegate
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    markY = scrollView.contentOffset.y;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (offsetY > 1000) {
        if (markY > offsetY) {
            self.scrolltopBtn.hidden = NO;
        } else {
            self.scrolltopBtn.hidden = YES;
        }
    } else {
        self.scrolltopBtn.hidden = YES;
    }
}


#pragma mark - tableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return self.dataArray.count;
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Items *model = self.dataArray[indexPath.section];
    LWSHomeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCustomCell];
    if (!cell) {
        cell = [[LWSHomeViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCustomCell];
    }
    [cell configCellModel:model];
    return cell;
}


#pragma mark - collectionView delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    Items *model = self.dataArray[indexPath.item];
    LWSHomeViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCustomCell forIndexPath:indexPath];
    [cell configCellModel:model];
    
    __weak typeof(self) weakSelf = self;
    cell.typeClickBlcok = ^{
        LWSColumnDetailViewController *vc = [[LWSColumnDetailViewController alloc] init];
        vc.columnID = [NSString stringWithFormat:@"%.f",model.column.columnIdentifier];
        vc.titleStr = model.column.title;
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 自动加载下页数据
    if (indexPath.item == self.dataArray.count - 5) {
        [self loadMoreData];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    Items *model = self.dataArray[indexPath.item];
    LWSDetailViewController *vc = [LWSDetailViewController new];
    vc.postsID = [NSString stringWithFormat:@"%.f",model.itemsIdentifier];
    [self.navigationController pushViewController:vc animated:YES];
    
}


#pragma mark - lazyload
//- (UICollectionView *)collectionView {
//    if (!_collectionView) {
//
//        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//        flowLayout.sectionInset = UIEdgeInsetsMake(self.topSpace, 0, 10, 0);
//        flowLayout.minimumInteritemSpacing = 5;
//        flowLayout.minimumLineSpacing = 10;
////        flowLayout.itemSize = CGSizeMake(Main_Screen_Width, Main_Screen_Width);
////        flowLayout.estimatedItemSize = CGSizeMake(Main_Screen_Width, Main_Screen_Width);
////        if (@available(iOS 10.0, *)) {
////            flowLayout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize;
////        } else {
////             flowLayout.estimatedItemSize = CGSizeMake(1, 1);
////        }
////
//        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
////        _collectionView.y += kScrollNavViewHeight;
////        _collectionView.height -= (kCollectionViewHeight + SafeAreaBottomHeight);
//        _collectionView.delegate = self;
//        _collectionView.dataSource = self;
//        _collectionView.showsVerticalScrollIndicator = NO;
//        _collectionView.backgroundColor = RGBA(250, 245, 245, 1.0);
//        [_collectionView registerClass:[LWSHomeViewCell class] forCellWithReuseIdentifier:kCustomCell];
//        [_collectionView addSubview:self.headView];
//    }
//    return _collectionView;
//}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = Main_Screen_Width;
        _tableView.backgroundColor = BackgroundColor;
        _tableView.sectionHeaderHeight = 2.5;
        _tableView.sectionFooterHeight = 2.5;
        _tableView.tableFooterView = [UIView new];
        _tableView.tableHeaderView = self.headView;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (UIView *)headView
{
    if (!_headView) {
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 330)];
        _headView.backgroundColor = RGBA(250, 245, 245, 1.0);
    }
    
    return _headView;
}

- (NSMutableArray<Items *> *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataArray;
}

- (NSMutableArray *)banners
{
    if (!_banners) {
        _banners = [NSMutableArray arrayWithCapacity:0];
    }
    return _banners;
}

- (NSMutableArray *)secondaryBanners
{
    if (!_secondaryBanners) {
        _secondaryBanners = [NSMutableArray arrayWithCapacity:0];
    }
    return _secondaryBanners;
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


//
//  LWSRankListSuperVC.m
//  liwushuo
//
//  Created by lee on 2017/12/13.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSRankListSuperVC.h"
#import "LWSRankListItemCell.h"
#import "LWSRankDataModel.h"
#import "LWSRankListModel.h"
static NSString *const kRankListItem = @"kRankListItem";
//static CGFloat kScrollNavViewHeight = 38.0;
static CGFloat kCollectionItemHeight = 280.0;
static CGFloat kHeadImageHeight = 184.0;

@interface LWSRankListSuperVC ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) FLAnimatedImageView *headImageView;
@end

@implementation LWSRankListSuperVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = BackgroundColor;
    [self baseUI];
    [self requestRankListData];
}
- (void)baseUI
{
    [self.view addSubview:self.collectionView];
    
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
//            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-(kScrollNavViewHeight + TabbarHeight + SafeAreaBottomHeight + StatusBarHeight));
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            // Fallback on earlier versions
            make.edges.equalTo(self.view);
        }
        
    }];
}

#pragma mark - request Data
- (void)requestRankListData
{
    __weak typeof(self) weakSelf = self;
    
    NSString *urlString;
    switch (self.vcType) {
        case RankListVcTypeOne:
            urlString = @"https://api.liwushuo.com/v2/ranks_v3/ranks/1?limit=20&offset=0";
            break;
        case RankListVcTypeTwo:
            urlString = @"https://api.liwushuo.com/v2/ranks_v3/ranks/2?limit=20&offset=0";
            break;
        case RankListVcTypeThree:
            urlString = @"https://api.liwushuo.com/v2/ranks_v3/ranks/3?limit=20&offset=0";
            break;
            
        default:
            break;
    }
    
    
    [self starAnmation];
    
    [[AllData shareManager] sendReuestWithMethod:Get urlString:urlString parameter:@{} andCompletionBlock:^(NSDictionary *resultObject) {
        [weakSelf stopAnmation];
        if ([resultObject[@"code"] isEqualToNumber:@200]) {
            
            LWSRankDataModel *dataModel = [LWSRankDataModel modelObjectWithDictionary:resultObject[@"data"]];
            
            [weakSelf.dataArray addObjectsFromArray:dataModel.items];
            [weakSelf.headImageView setImageWithURL:[NSURL URLWithString:dataModel.coverImage] placeholderImage:[UIImage imageNamed:@"placeholderimage_big_80x69_"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            } usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
            [weakSelf.collectionView reloadData];
            
        } else {
            // 非 200 返回码的处理
        }
        
    } failureBlock:^(id error) {
        [weakSelf stopAnmation];
        NSLog(@"请求出现错误  %@", error);
    }];
}

#pragma mark - collectionView delegate && dataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LWSRankListItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kRankListItem forIndexPath:indexPath];
    [cell configRankListItemModel:self.dataArray[indexPath.item]];
    return cell;
}
#pragma mrak - lazy load
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.sectionInset = UIEdgeInsetsMake(12 + kHeadImageHeight, 12, 12, 12);
        flowLayout.minimumLineSpacing = 12;
        flowLayout.minimumInteritemSpacing = 10;
        CGFloat itemW = (Main_Screen_Width - 34) * 0.5;
        flowLayout.itemSize = CGSizeMake(itemW, itemW * 1.47);

        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
//        _collectionView.y -= (SafeAreaTopHeight - kScrollNavViewHeight);
//        _collectionView.height -= (TabbarHeight + kScrollNavViewHeight);
        _collectionView.backgroundColor = BackgroundColor;
        _collectionView.showsVerticalScrollIndicator = NO;
        NSLog(@"%@",NSStringFromCGRect(_collectionView.frame));
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[LWSRankListItemCell class] forCellWithReuseIdentifier:kRankListItem];
        [_collectionView addSubview:self.headImageView];
    }
    return _collectionView;
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataArray;
}

- (FLAnimatedImageView *)headImageView
{
    if (!_headImageView) {
        _headImageView = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, kHeadImageHeight)];
        _headImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _headImageView;
}
@end

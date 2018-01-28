//
//  LWSCategoryPostListViewController.m
//  liwushuo
//
//  Created by PinelliaZeit on 2018/1/27.
//  Copyright © 2018年 Pinellia Zeit. All rights reserved.
//

#import "LWSCategoryPostListViewController.h"
#import "LWSCategoryPostCollectionModel.h"
#import "LWSMePostColumnCell.h"
@interface LWSCategoryPostListViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSString *nextUrlStr;

@end

static NSString *const kPostListCell = @"kPostListCell";

@implementation LWSCategoryPostListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        } else {
            // Fallback on earlier versions
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(64, 0, 0, 0));
        }
        
    }];
    
    [self requestListViewData];
    [self lineView];
}

#pragma mark - request
- (void)requestListViewData
{
    WeakSelf;
    [self starAnmation];
    [[AllData shareManager] sendReuestWithMethod:Get urlString:@"https://api.liwushuo.com/v2/columns?limit=20&offset=0" parameter:nil andCompletionBlock:^(NSDictionary *resultObject) {
        
        [weakSelf stopAnmation];
        if ([resultObject[@"code"] isEqualToNumber:@200]) {
        
            LWSCategoryPostCollectionModel *model = [LWSCategoryPostCollectionModel modelObjectWithDictionary:resultObject[@"data"]];
            weakSelf.nextUrlStr = model.paging.nextUrl;
            weakSelf.dataArray = [NSMutableArray arrayWithArray:model.columns];
            [weakSelf.collectionView reloadData];
            
        } else {
            // 处理 非 200
        }
        
        
    } failureBlock:^(id error) {
        [weakSelf stopAnmation];
        NSLog(@"请求错误 %@",error);
    }];
    
}

- (void)loadMoreData
{
    WeakSelf;
    [[AllData shareManager] sendReuestWithMethod:Get urlString:self.nextUrlStr parameter:nil andCompletionBlock:^(NSDictionary *resultObject) {
        
        if ([resultObject[@"code"] isEqualToNumber:@200]) {
            
            LWSCategoryPostCollectionModel *model = [LWSCategoryPostCollectionModel modelObjectWithDictionary:resultObject[@"data"]];
            [weakSelf.dataArray addObjectsFromArray:model.columns];
            [weakSelf.collectionView reloadData];
            
        } else {
            // 处理 非 200
        }
        
        
    } failureBlock:^(id error) {
        NSLog(@"请求错误 %@",error);
    }];
}

#pragma makr - collectionView delegate & dataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LWSColumns *model = self.dataArray[indexPath.item];
    LWSMePostColumnCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kPostListCell forIndexPath:indexPath];
    cell.model = model;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.item == self.dataArray.count - 5) {
        [self loadMoreData];
    }
}

#pragma makr - Getts

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.sectionInset = UIEdgeInsetsMake(15, 12, 15, 12);
        flowLayout.minimumLineSpacing  = 5;
        flowLayout.minimumInteritemSpacing = 10;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayout.itemSize = CGSizeMake(self.view.width - 12 * 2, 71);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[LWSMePostColumnCell class] forCellWithReuseIdentifier:kPostListCell];
        
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

@end


//
//  LWSCategoryPostCollectionListView.m
//  liwushuo
//
//  Created by lee on 2017/12/14.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSCategoryPostCollectionListView.h"
#import "LWSCategoryPostCollectionCell.h"
#import "LWSCategoryPostCollectionModel.h"
#import "LWSColumnDetailViewController.h"
#import "LWSColumns.h"
static NSString *const kCategoryPostCollectionCell = @"kCategoryPostCollectionCell";

@interface LWSCategoryPostCollectionListView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>


@end

@implementation LWSCategoryPostCollectionListView

- (instancetype)init
{
    self = [super init];
    if (self) {
//        [self addSubview:self.collectionView];
        self.collectionView.backgroundColor = [UIColor whiteColor];
        [self reqestData];
        
    }
    return self;
}

- (void)reqestData
{
    __weak typeof(self) weakSelf = self;
    [[AllData shareManager] sendReuestWithMethod:Get urlString:@"https://api.liwushuo.com/v2/columns?limit=11&offset=0" parameter:@{} andCompletionBlock:^(NSDictionary *resultObject) {
        if ([resultObject[@"code"] isEqualToNumber:@200]) {
            
            LWSCategoryPostCollectionModel *model = [LWSCategoryPostCollectionModel modelObjectWithDictionary:resultObject[@"data"]];
            weakSelf.dataArray = [NSMutableArray arrayWithArray:model.columns];
            [weakSelf.collectionView reloadData];
        } else {
            // 非 200 返回的处理
        }
        
    } failureBlock:^(id error) {
        NSLog(@"请求错误  %@",error);
    }];
}

#pragma mark - collection delegate && dataSource
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
    
    LWSCategoryPostCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCategoryPostCollectionCell forIndexPath:indexPath];
    [cell configPostCollectionModel:model];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LWSColumns *model = self.dataArray[indexPath.item];
    LWSColumnDetailViewController *vc = [[LWSColumnDetailViewController alloc] init];
    vc.columnID = [NSString stringWithFormat:@"%.f",model.columnsIdentifier];
    vc.titleStr = model.title;
    [[self viewController].navigationController pushViewController:vc animated:YES];
}

#pragma mark - lazy load
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 12, 12, 0);
        flowLayout.minimumLineSpacing = 12;
        flowLayout.minimumInteritemSpacing = 9;
        flowLayout.itemSize = CGSizeMake(275.0f, 71);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.frame collectionViewLayout:flowLayout];
        [self addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.equalTo(self);
        }];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[LWSCategoryPostCollectionCell class] forCellWithReuseIdentifier:kCategoryPostCollectionCell];
        
        
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

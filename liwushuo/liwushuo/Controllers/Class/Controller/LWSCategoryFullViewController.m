//
//  LWSCategoryFullViewController.m
//  liwushuo
//
//  Created by PinelliaZeit on 2018/1/27.
//  Copyright © 2018年 Pinellia Zeit. All rights reserved.
//

#import "LWSCategoryFullViewController.h"
#import "LWSCategoryCell.h"
#import "LWSChannels.h"
static NSString *const kCategorCell = @"kCategorCell";

@interface LWSCategoryFullViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation LWSCategoryFullViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(64, 0, 0, 0));
        }
    }];
    
    [self lineView];
}

- (void)reloadData:(NSArray *)dataArray
{
    _dataArray = dataArray;
    [self.collectionView reloadData];
}


#pragma mark - collectionView delegate & dataSource
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
    LWSChannels *channels = self.dataArray[indexPath.item];
    LWSCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCategorCell forIndexPath:indexPath];
    [cell configCategoryModel:channels];
    return cell;
}

#pragma mark - Getts
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 12, 10, 12);
        flowLayout.minimumLineSpacing = 10;
        flowLayout.minimumInteritemSpacing = 10;
        CGFloat itemW = (Main_Screen_Width - 34) * 0.5;
        flowLayout.itemSize = CGSizeMake(itemW, 104);
        //        CGRectMake(0, kSearchButtonHeight, self.view.width, self.view.height - SafeAreaTopHeight - SafeAreaBottomHeight - TabbarHeight - kSearchButtonHeight)
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[LWSCategoryCell class] forCellWithReuseIdentifier:kCategorCell];
        
     
        
    }
    return _collectionView;
}

@end

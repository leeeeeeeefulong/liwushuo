//
//  LWSPostCategoryViewController.m
//  liwushuo
//
//  Created by lee on 2017/12/14.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSPostCategoryViewController.h"
#import "LWSCategoryCell.h"
#import "LWSCategoryModel.h"
#import "LWSChannelGroups.h"
#import "LWSCategoryHeaderView.h"
#import "LWSCategoryPostCollectionListCell.h"
#import "LWSCategoryPostListViewController.h"
#import "LWSCategoryFullViewController.h"
#import "LWSItemCategoryViewController.h"
#import "LWSChannels.h"

static NSString *const kCategoryCell = @"kCategoryCell";
static NSString *const kCategoryHeader = @"kCategoryHeader";
static NSString *const kCategoryFooter = @"kCategoryFooter";
static NSString *const kCategoryListCell = @"kCategoryListCell";
static CGFloat kSearchButtonHeight = 38.0f;
@interface LWSPostCategoryViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) UIButton *searchButton;

@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation LWSPostCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    [self drawUI];
    [self requestChannelGroupsData];
}

- (void)drawUI
{
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(kSearchButtonHeight);
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
//            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-(kScrollNavViewHeight + TabbarHeight + SafeAreaBottomHeight + StatusBarHeight));
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            
        } else {
            // Fallback on earlier versions
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(kSearchButtonHeight + 10, 0, 0, 0));
        }
    }];
    _searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_searchButton];
    [_searchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(10, 10, 0, -10));
        make.height.mas_equalTo(@30);
    }];
    _searchButton.layer.cornerRadius = 15.0f;
    _searchButton.layer.masksToBounds = YES;
    [_searchButton setImage:[UIImage imageNamed:@"btn_search_12x12_"] forState:UIControlStateNormal];
    [_searchButton setTitle:@"  选份走心好礼送给Ta" forState:UIControlStateNormal];
    [_searchButton setTitleColor:RGBA(140, 120, 120, 1.0) forState:UIControlStateNormal];
    _searchButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:11];
    _searchButton.titleLabel.textAlignment = NSTextAlignmentNatural;
    [_searchButton setBackgroundColor:BackgroundColor];


}

#pragma mark - requestData
- (void)requestChannelGroupsData
{
    __weak typeof(self) weakSelf = self;
    [self starAnmation];
    [[AllData shareManager] sendReuestWithMethod:Get
                                       urlString:@"https://api.liwushuo.com/v2/channel_groups/all?"
                                       parameter:@{}
                              andCompletionBlock:^(NSDictionary *resultObject) {
        [weakSelf stopAnmation];
        if ([resultObject[@"code"] isEqualToNumber:@200]) {
            
            LWSCategoryModel *model = [LWSCategoryModel modelObjectWithDictionary:resultObject[@"data"]];
            
            weakSelf.dataArray = [NSMutableArray arrayWithArray:model.channelGroups];
            
            [weakSelf.collectionView reloadData];
            
        } else {
            // 非 200 的处理
        }
        
    } failureBlock:^(id error) {
        [weakSelf stopAnmation];
        NSLog(@" 请求错误 %@",error);
    }];
}

#pragma mark - collectionView delegate && dataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.dataArray.count + 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return  1;
    }
    
    LWSChannelGroups *group = self.dataArray[section - 1];
    if (group.channels.count > 6) {
        return 6;
    } else {
        return group.channels.count;
    }
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        LWSCategoryPostCollectionListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCategoryListCell forIndexPath:indexPath];
        cell.itemListView.backgroundColor = [UIColor whiteColor];
        return cell;
    }
    LWSCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCategoryCell forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor flatOrangeColor];
    LWSChannelGroups *group = self.dataArray[indexPath.section - 1];
    LWSChannels *channels = group.channels[indexPath.item];
    [cell configCategoryModel:channels];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LWSChannelGroups *group = self.dataArray[indexPath.section - 1];
    LWSChannels *channels = group.channels[indexPath.item];
    LWSItemCategoryViewController * vc = [[LWSItemCategoryViewController alloc] init];
    vc.categoryID = [NSString stringWithFormat:@"%.f",channels.channelsIdentifier];
    vc.navigationItem.title = channels.name;
    [self.navigationController pushViewController:vc animated:YES];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView;
    LWSChannelGroups *group;
    if (indexPath.section != 0) {
        group = self.dataArray[indexPath.section -1];
    }
//    LWSChannelGroups *group = self.dataArray[indexPath.section -1];
    __weak typeof(self) weakSelf = self;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        LWSCategoryHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kCategoryHeader forIndexPath:indexPath];
        if (indexPath.section != 0) {
            headerView.headTitleLabel.text = group.name;
            if (group.channels.count > 6) {
                headerView.headFullGroupButton.hidden = NO;
            } else {
                headerView.headFullGroupButton.hidden = YES;
            }
        } else {
            headerView.headTitleLabel.text = @"栏目";
            headerView.headFullGroupButton.hidden = NO;
        }
        
        
        headerView.headButtonClickBlock = ^(UIButton *button) {
          // 跳转全部
            if (indexPath.section == 0) {
                LWSCategoryPostListViewController *vc = [LWSCategoryPostListViewController new];
                vc.navigationItem.title = @"栏目";
                [weakSelf.navigationController pushViewController:vc animated:YES];
            } else {
                LWSChannelGroups *group = self.dataArray[indexPath.section - 1];
                LWSCategoryFullViewController * vc = [[LWSCategoryFullViewController alloc] init];
                vc.dataArray = group.channels;
                vc.navigationItem.title = group.name;
                [self.navigationController pushViewController:vc animated:YES];
            }
            
            
        };
        reusableView = headerView;
    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:kCategoryFooter forIndexPath:indexPath];
        reusableView.backgroundColor = BackgroundColor;
        
    }
    
    return reusableView;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake(Main_Screen_Width, 243);
    }
    CGFloat itemW = (Main_Screen_Width - 34) * 0.5;
    //    flowLayout.itemSize = CGSizeMake(itemW, 104);
    return CGSizeMake(itemW, 104);
}


#pragma mark - lazy load
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 10, 12);
        flowLayout.minimumLineSpacing = 10;
        flowLayout.minimumInteritemSpacing = 10;
//        CGFloat itemW = (Main_Screen_Width - 34) * 0.5;
//        flowLayout.itemSize = CGSizeMake(itemW, 104);
        flowLayout.headerReferenceSize = CGSizeMake(Main_Screen_Width, 40);
        flowLayout.footerReferenceSize = CGSizeMake(Main_Screen_Width, 10);
//        CGRectMake(0, kSearchButtonHeight, self.view.width, self.view.height - SafeAreaTopHeight - SafeAreaBottomHeight - TabbarHeight - kSearchButtonHeight)
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[LWSCategoryCell class] forCellWithReuseIdentifier:kCategoryCell];
        [_collectionView registerClass:[LWSCategoryPostCollectionListCell class] forCellWithReuseIdentifier:kCategoryListCell];
        [_collectionView registerClass:[LWSCategoryHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kCategoryHeader];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:kCategoryFooter];

    }
    return _collectionView;
}

@end

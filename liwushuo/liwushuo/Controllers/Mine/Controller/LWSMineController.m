//
//  LWSMineController.m
//  liwushuo
//
//  Created by lee on 2017/11/24.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSMineController.h"
#import "LWSMineViewModel.h"
#import "LWSFavoriteLists.h"
#import "LWSItems.h"

#import "LWSMineItemsReusableView.h"
#import "LWSMineItemsCell.h"
#import "LWSNoFavoriteGiftCell.h"
#import "LWSCheckMoreCell.h"

#import "LWSMineHeadView.h"
#import "LWSMineInfoModel.h"
#import "LWSMePromotionsControl.h"
#import "LWSMeAddNewGiftListFooterView.h"

#import "LWSSettingViewController.h"
#import "LWSShareViewController.h"

static NSString *const kMineItemsCell = @"kMineItemsCell";
static NSString *const kCheckMoreCell = @"kCheckMoreCell";
static NSString *const kNoFavoriteGiftCell = @"kNoFavoriteGiftCell";

static NSString *const kMineItemsHeaderView = @"kMineItemsHeaderView";


@interface LWSMineController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) UIView *navView;
@property (nonatomic, strong) LWSMineHeadView *headerView;
@property (nonatomic, strong) LWSMePromotionsControl *promotionsControl;
@property (nonatomic, strong) LWSMeAddNewGiftListFooterView *addNewListView;
@end

@implementation LWSMineController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self baseUI];
    [self requestUserData];
    [self requestItemsData];
    [self requestUserLoginData];
    

}

- (void)baseUI
{
    [self.view addSubview:self.collectionView];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            // Fallback on earlier versions
            
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(64, 0, TabbarHeight + SafeAreaBottomHeight, 0));
        }
    }];
    
    UIBarButtonItem *serviceItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_service_24x24_"] style:UIBarButtonItemStylePlain target:self action:@selector(settingItemClickAction)];
    UIBarButtonItem *markItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_signin_black_24x24_"] style:UIBarButtonItemStylePlain target:self action:@selector(settingItemClickAction)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_settings_black_24x24_"] style:UIBarButtonItemStylePlain target:self action:@selector(settingItemClickAction)];
    
    self.navigationItem.rightBarButtonItems = @[markItem, serviceItem];
    
    NSLog(@" frame --%f, height -- %f, content - %f",CGRectGetMaxY(self.collectionView.frame),self.collectionView.height,self.collectionView.contentSize.height);
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    NSLog(@"当前滑动 - %f, navView - %f",offsetY,self.navView.y);
    if (offsetY > -38) {
        self.navView.y = offsetY;
    } else {
        self.navView.y = -38;
    }
}
#pragma mark - item Action
- (void)settingItemClickAction
{
    LWSSettingViewController *vc = [[LWSSettingViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - request

- (void)requestUserLoginData
{
    //    mobile=18676937749&password=qwert123456&zone=86
    WeakSelf;
    [[AllData shareManager] sendReuestWithMethod:Post urlString:@"https://api.liwushuo.com/v2/account/signin" parameter:@{@"mobile":@"18676937749",@"password":@"qwert123456",@"zone":@86} andCompletionBlock:^(NSDictionary *resultObject) {
        
        StrongSelf;
        if (strongSelf) {
            if ([resultObject[@"code"] isEqualToNumber:@200]) {
    
            }
        }
        
        
        
        NSLog(@"用户登录信息 %@",resultObject);
        
    } failureBlock:^(id error) {
        
    }];
}

- (void)requestUserData
{
    WeakSelf;
    [[AllData shareManager] sendReuestWithMethod:Get urlString:@"https://api.liwushuo.com/v2/users/me?" parameter:@{} andCompletionBlock:^(NSDictionary *resultObject) {
        
        StrongSelf;
        if (strongSelf) {
            
            if ([resultObject[@"code"] isEqualToNumber:@200]) {
            
                LWSMineInfoModel *infoModel = [LWSMineInfoModel modelObjectWithDictionary:resultObject[@"data"]];
                strongSelf.headerView.model = infoModel;
                strongSelf.navigationItem.title = infoModel.nickname;
                
            } else {
                // 非 200 的处理
            }
            
            
        }
        
    } failureBlock:^(id error) {
        NSLog(@" 请求错误 %@",error);
    }];
}

- (void)requestItemsData
{
    WeakSelf;
    [[AllData shareManager] sendReuestWithMethod:Get urlString:@"https://api.liwushuo.com/v2/users/me/favorite_lists?limit=10&offset=0" parameter:@{} andCompletionBlock:^(NSDictionary *resultObject) {
        
        StrongSelf;
        if (strongSelf) {
            
            if ([resultObject[@"code"] isEqualToNumber:@200]) {
                
                LWSMineViewModel *model = [LWSMineViewModel modelObjectWithDictionary:resultObject[@"data"]];
                strongSelf.dataArray = [NSMutableArray arrayWithArray:model.favoriteLists];
                [strongSelf.collectionView reloadData];

                [strongSelf.collectionView addSubview:strongSelf.addNewListView];
                
            } else {
                // 非 200 的处理
            }
            
            
        }
        
        
        
    } failureBlock:^(id error) {
        NSLog(@" 请求错误 %@",error);
    }];
}

#pragma mark - CollectionView Delegate && dataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.dataArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    LWSFavoriteLists *lists = self.dataArray[section];
    NSInteger intger = !(lists.items.count > 7) ? lists.items.count : 8;
    return !(intger == 0) ? intger : 1;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView;
    LWSFavoriteLists *model = self.dataArray[indexPath.section];
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        LWSMineItemsReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kMineItemsHeaderView forIndexPath:indexPath];
//        headerView.backgroundColor = [UIColor flatSkyBlueColor];
        headerView.model = model;
        reusableView = headerView;
    }
    
    return reusableView;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    LWSFavoriteLists *lists = self.dataArray[indexPath.section];
    LWSMineItemsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kMineItemsCell forIndexPath:indexPath];
    if (lists.items.count == 0) {
        LWSNoFavoriteGiftCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kNoFavoriteGiftCell forIndexPath:indexPath];
        return cell;
    } else if (indexPath.item  == 7) {
        LWSCheckMoreCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCheckMoreCell forIndexPath:indexPath];
        return cell;
    }
    
    LWSItems *model = lists.items[indexPath.item];
    
    cell.model = model;
//    cell.backgroundColor = [UIColor flatLimeColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    LWSShareViewController *vc = [[LWSShareViewController alloc] init];
    vc.blurImageView.image = [self.view snapshotImageAfterScreenUpdates:YES];
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - Getts
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
        flowlayout.sectionInset = UIEdgeInsetsMake(10, 16.56, 10, 16.56);
        flowlayout.minimumLineSpacing = 5;
        flowlayout.minimumInteritemSpacing = 5;
        CGFloat itemW = (Main_Screen_Width - 16.56 * 2 - 5* 3) / 4;
        flowlayout.itemSize = CGSizeMake(itemW, itemW);
        flowlayout.headerReferenceSize = CGSizeMake(Main_Screen_Width, 70);
       
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowlayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.contentInset = UIEdgeInsetsMake(230, 0, 96, 0);
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"kcell"];
        [_collectionView registerClass:[LWSMineItemsCell class] forCellWithReuseIdentifier:kMineItemsCell];
        [_collectionView registerClass:[LWSCheckMoreCell class] forCellWithReuseIdentifier:kCheckMoreCell];
        [_collectionView registerClass:[LWSNoFavoriteGiftCell class] forCellWithReuseIdentifier:kNoFavoriteGiftCell];
        [_collectionView registerClass:[LWSMineItemsReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kMineItemsHeaderView];
        [_collectionView addSubview:self.headerView];
        [_collectionView addSubview:self.navView];
//        [_collectionView addSubview:self.addNewListView];
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

- (LWSMineHeadView *)headerView
{
    if (!_headerView) {
        _headerView = [[LWSMineHeadView alloc] initWithFrame:CGRectMake(0, -230, self.view.width, 230)];
    }
    return _headerView;
}

- (UIView *)navView
{
    if (!_navView) {
        _navView = [[UIView alloc] initWithFrame:CGRectMake(0, -38, self.view.width, 38)];
        _navView.backgroundColor = rgba(255, 254, 254, 1.0);
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 130, 38)];
        view.centerX = _navView.centerX;
        [_navView addSubview:view];
//        view.backgroundColor = [UIColor flatRedColor];
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, _navView.height - 0.3333, self.view.width, 0.3333)];
        line.backgroundColor = rgba(240, 230, 230, 1.0);
        [_navView addSubview:line];
        
        UIButton *itemButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [itemButton setFrame:CGRectMake(6, 4, 30, 33)];
        [itemButton setTitle:@"单品" forState:UIControlStateNormal];
        [itemButton setTitleColor:rgba(255, 45, 71, 1.0) forState:UIControlStateDisabled];
        [itemButton setTitleColor:rgba(50, 30, 30, 1.0) forState:UIControlStateNormal];
        itemButton.enabled = NO;
        itemButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:15];
        itemButton.titleLabel.textAlignment = NSTextAlignmentLeft;
        [view addSubview:itemButton];
        
        UIButton *raidersButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [raidersButton setFrame:CGRectMake(98, 4, 30, 33)];
        [raidersButton setTitle:@"攻略" forState:UIControlStateNormal];
        [raidersButton setTitleColor:rgba(255, 45, 71, 1.0) forState:UIControlStateDisabled];
        [raidersButton setTitleColor:rgba(50, 30, 30, 1.0) forState:UIControlStateNormal];
        
        raidersButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:15];
        raidersButton.titleLabel.textAlignment = NSTextAlignmentLeft;
        [view addSubview:raidersButton];
        
    }
    return _navView;
}

- (LWSMeAddNewGiftListFooterView *)addNewListView
{
    if (!_addNewListView) {
        _addNewListView = [[LWSMeAddNewGiftListFooterView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.collectionView.frame), self.view.width, 96)];
    }
    return _addNewListView;
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

//
//  LWSItemViewController.m
//  liwushuo
//
//  Created by lee on 2018/1/4.
//  Copyright © 2018年 Pinellia Zeit. All rights reserved.
//

#import "LWSItemViewController.h"
#import "ZYBannerView.h"
#import "LWSItemData.h"
#import "LWSDetailView.h"
#import "LWSContentView.h"
#import "LWSRecommendData.h"
#import "LWSRankListItemCell.h"
#import "LWSRecommentPostCell.h"
#import "MXParallaxHeader.h"

static NSString *const kDetailCell = @"kDetailCell";
static NSString *const kPostCell = @"kPostCell";
static CGFloat kDetailViewH = 220.0;
static CGFloat kPostViewH = 180.0;
static CGFloat kDetailTtileH = 60.0;

#define kMaxTopH (kPostViewH + kDetailTtileH + Main_Screen_Width)

@interface LWSItemViewController () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) ZYBannerView *bannerView;
@property (nonatomic, strong) NSArray *bannersArray;

@property (nonatomic, strong) LWSDetailView *detailView;
@property (nonatomic, strong) UIImageView *headerView;

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) UICollectionView *postCollectionView;
@property (nonatomic, strong) NSArray *postArray;
@end

@implementation LWSItemViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self setupBannerView];
    [self.view addSubview:self.collectionView];
    
    UIView *maskView = [[UIView alloc] init];
    [self.view addSubview:maskView];   // 添加一个遮罩 View 防止白色字体显示不够明显的问题
    [maskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(@64);
    }];
    maskView.backgroundColor = RGBA(0, 0, 0, 0.05);
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(-topMargin);
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            // Fallback on earlier versions
            make.edges.equalTo(self.view);
        }
    }];
    
    [self.collectionView addSubview:[self setupHeaderlViewWithY:-60 text:@"你可能也喜欢"]];
    [self.collectionView addSubview:[self setupHeaderlViewWithY:-240 text:@"精品攻略推荐"]];

}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offSetY = scrollView.contentOffset.y;
//    offSetY += (Main_Screen_Width + kDetailViewH + kPostViewH + 60);
    if (scrollView == self.collectionView) {
        
        CGFloat newY = offSetY + kMaxTopH;
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:kNavBackgroundColorAlpha(newY / Main_Screen_Width)] forBarMetrics:UIBarMetricsDefault];
        if (newY / Main_Screen_Width > 0.7) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshScrollTitle" object:@1];
        } else {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshScrollTitle" object:@2];
        }
        NSLog(@" 当前滑动 %f",newY);
    }
    if (offSetY < -kMaxTopH) {
        NSLog(@" 当前滑动 %f",offSetY);
        CGRect frame = self.detailView.frame;
        frame.origin.y = offSetY;
        frame.size.width = -(offSetY + kMaxTopH - Main_Screen_Width);
        frame.size.height = -(offSetY + kMaxTopH - Main_Screen_Width);
        self.detailView.frame = frame;
    }
    
}

- (UIView *)setupHeaderlViewWithY:(CGFloat)viewY text:(NSString *)text
{
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, viewY, self.view.width, 60)];
    v.backgroundColor = rgba(255, 254, 254, 1.0);
    UIView *colorView = [[UIView alloc] init];
    [v addSubview:colorView];
    [colorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(v);
        make.height.mas_equalTo(@10);
    }];
    colorView.backgroundColor = rgba(250, 245, 245, 1.0);
    
    UILabel *lb = [[UILabel alloc] init];
    [v addSubview:lb];
    [lb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(v);
        make.centerY.equalTo(v.mas_centerY).offset(5);
    }];
    lb.textColor = rgba(160, 150, 150, 1.0);
    lb.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    lb.text = text;
    
    UIView *leftLine = [[UIView alloc] init];
    [v addSubview:leftLine];
    [leftLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(lb);
        make.right.equalTo(lb.mas_left).offset(-15);
        make.height.mas_equalTo(@0.3333);
        make.width.mas_equalTo(30);
    }];
    leftLine.backgroundColor = rgba(220, 215, 215, 1.0);
    
    UIView *rightLine = [[UIView alloc] init];
    [v addSubview:rightLine];
    [rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(lb);
        make.left.equalTo(lb.mas_right).offset(15);
        make.height.width.equalTo(leftLine);
    }];
    rightLine.backgroundColor = rgba(220, 215, 215, 1.0);

    return v;
    
}

- (void)reloadAlpha
{
    [self scrollViewDidScroll:self.collectionView];
}

#pragma mark - request

- (void)requestItemID:(NSString *)itemID
{
    [self requestItemDataWithItemID:itemID];
    [self requestDetailDataWithItemID:itemID];
}

- (void)requestItemDataWithItemID:(NSString *)itemID
{
    WeakSelf;
    [[AllData shareManager] sendReuestWithMethod:Get urlString:[NSString stringWithFormat:@"https://api.liwushuo.com/v2/items/%@?",itemID] parameter:@{} andCompletionBlock:^(NSDictionary *resultObject) {
        
        if ([resultObject[@"code"] isEqualToNumber:@200]) {
            
            LWSItemData *data = [LWSItemData modelObjectWithDictionary:resultObject[@"data"]];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"kItemWebViewData" object:data.detailHtml];
            [weakSelf.detailView reloadData:data];
        }
        
    } failureBlock:^(id error) {
        NSLog(@"请求错误 --  %@",error);
    }];
}


- (void)requestDetailDataWithItemID:(NSString *)itemID
{
    WeakSelf;
    [[AllData shareManager] sendReuestWithMethod:Get urlString:[NSString stringWithFormat:@"https://api.liwushuo.com/v2/items/%@/recommend?",itemID] parameter:@{} andCompletionBlock:^(NSDictionary *resultObject) {
        
        if ([resultObject[@"code"] isEqualToNumber:@200]) {
        
            LWSRecommendData *dataModel = [LWSRecommendData modelObjectWithDictionary:resultObject[@"data"]];
            
            [weakSelf.dataArray addObjectsFromArray:dataModel.recommendItems];
            weakSelf.postArray = dataModel.recommendPosts;
            [weakSelf.collectionView reloadData];
            [weakSelf.postCollectionView reloadData];
            
        } else {
            // 非 200 的处理
        }
        
    } failureBlock:^(id error) {
        NSLog(@" 评论请求错误 %@",error);
    }];
}


#pragma mark - CollectionView Delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView == self.postCollectionView) {
        return self.postArray.count;
    }
    return self.dataArray.count;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == self.postCollectionView) {
        LWSRecommendPosts *model = self.postArray[indexPath.item];
        LWSRecommentPostCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kPostCell forIndexPath:indexPath];
        cell.model = model;
        return cell;
    }
    LWSRecommendItems *items = self.dataArray[indexPath.item];
    LWSRankListItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kDetailCell forIndexPath:indexPath];
    cell.items = items;
    return cell;
}

#pragma mark - Getts
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        CGFloat itemW = (self.view.width - 12 * 2 - 10) / 2;
        flowLayout.sectionInset = UIEdgeInsetsMake(5, 12, 5, 12);
        flowLayout.itemSize = CGSizeMake(itemW, 280);
        flowLayout.minimumInteritemSpacing = 10;

        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = BackgroundColor;
        _collectionView.showsVerticalScrollIndicator = NO;
//        _collectionView.contentInset = UIEdgeInsetsMake(Main_Screen_Width, 0, 0, 0);
        _collectionView.contentInset = UIEdgeInsetsMake(kMaxTopH, 0, 0, 0);
//        _collectionView.scrollIndicatorInsets = _collectionView.contentInset;
        [_collectionView registerClass:[LWSRankListItemCell class] forCellWithReuseIdentifier:kDetailCell];
        [_collectionView addSubview:self.detailView];
        [_collectionView addSubview:self.postCollectionView];
        
    }
    return _collectionView;
}

- (UICollectionView *)postCollectionView
{
    if (!_postCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.sectionInset = UIEdgeInsetsMake(5, 10, 5, 10);
        flowLayout.itemSize = CGSizeMake(200, 110);
        flowLayout.minimumInteritemSpacing = 10;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _postCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, -180, self.view.width, 120) collectionViewLayout:flowLayout];
        _postCollectionView.delegate = self;
        _postCollectionView.dataSource = self;
        _postCollectionView.backgroundColor = rgba(255, 254, 254, 1.0);
        _postCollectionView.showsVerticalScrollIndicator = NO;
        _postCollectionView.showsHorizontalScrollIndicator = NO;
        [_postCollectionView registerClass:[LWSRecommentPostCell class] forCellWithReuseIdentifier:kPostCell];
    }
    return _postCollectionView;
}

- (LWSDetailView *)detailView
{
    if (!_detailView) {
//        _detailView = [[LWSDetailView alloc] initWithFrame:CGRectMake(0, -(self.view.width + kPostViewH + 60), self.view.width, self.view.width + kDetailViewH)];
        _detailView = [[LWSDetailView alloc] initWithFrame:CGRectMake(0, -kMaxTopH, self.view.width, self.view.width)];
//        _detailView.backgroundColor = [UIColor orangeColor];
    }
    return _detailView;
}

- (NSArray *)bannersArray
{
    if (!_bannersArray) {
        _bannersArray = @[];
    }
    return _bannersArray;
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataArray;
}

- (NSArray *)postArray
{
    if (!_postArray) {
        _postArray = @[];
    }
    return _postArray;
}
@end

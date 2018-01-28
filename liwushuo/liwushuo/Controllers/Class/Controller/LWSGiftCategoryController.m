
//
//  LWSGiftCategoryController.m
//  liwushuo
//
//  Created by lee on 2017/12/14.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSGiftCategoryController.h"
#import "LWSGiftCategoryTreeModel.h"
#import "LWSGiftCategoryTableCell.h"
#import "LWSGiftCategoryCell.h"
#import "LWSGiftCategoryReusableView.h"

//static NSString *const kGiftTableCell = @"kGiftTableCell";
static NSString *const kGiftCollectionCell = @"kGiftCollectionCell";
static NSString *const kGiftCollectionHeader = @"kGiftCollectionHeader";
static CGFloat kSearchButtonHeight = 40.0f;
static CGFloat kLeftTableViewWidth = 85.0f;

@interface LWSGiftCategoryController ()
<
UITableViewDelegate,
UITableViewDataSource,
UIScrollViewDelegate,
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout
>

@property (nonatomic, strong) UIButton *searchButton;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation LWSGiftCategoryController


{
    NSInteger _selectIndex;
    BOOL _isScrollDown;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self drawUI];
    _selectIndex = 0;
    _isScrollDown = YES;

    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.collectionView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(kSearchButtonHeight + 10, 0, 0, 0));
        make.width.mas_equalTo(@85);
    }];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(kSearchButtonHeight + 10, 0, 0, 0));
        make.left.equalTo(self.tableView.mas_right);
    }];
    
    [self requestCategoryTreeData];

    
    NSLog(@"%@",self.tableView);
//    self.automaticallyAdjustsScrollViewInsets = NO;
    
}

#pragma mark - UIScrollView Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    static CGFloat lastOffSetY = 0;
    
    if ([scrollView isKindOfClass:[UITableView class]]) {
        
        NSLog(@"scrollView is tableview.....");
//        scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.tableView.frame), 46 * self.dataArray.count);
        
    } else if ([scrollView isKindOfClass:[UICollectionView class]]) {
        
        NSLog(@"scrollView is collectionView....");
        _isScrollDown = lastOffSetY < scrollView.contentOffset.y;
        lastOffSetY = scrollView.contentOffset.y;
        

    }
}

#pragma mark - requestData
- (void)requestCategoryTreeData
{
    __weak typeof(self) weakSelf = self;
    [[AllData shareManager] sendReuestWithMethod:Get
                                       urlString:@"https://api.liwushuo.com/v2/item_categories/tree?"
                                       parameter:@{}
                              andCompletionBlock:^(NSDictionary *resultObject) {
        if ([resultObject[@"code"] isEqualToNumber:@200]) {
            
            LWSGiftCategoryTreeModel *model = [LWSGiftCategoryTreeModel modelObjectWithDictionary:resultObject[@"data"]];
            weakSelf.dataArray = [NSMutableArray arrayWithArray:model.categories];
            [weakSelf.tableView reloadData];
            [weakSelf.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                                            animated:YES
                                      scrollPosition:UITableViewScrollPositionNone];
            [weakSelf.collectionView reloadData];
            
        }
    } failureBlock:^(id error) {
        NSLog(@" 请求错误 %@",error);
    }];
}

- (void)drawUI
{
    _searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_searchButton];
//    [_searchButton setFrame:CGRectMake(10, 10 + SafeAreaTopHeight, Main_Screen_Width - 20, 30)];
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

#pragma - mark TableView separatorInset 下划线左侧到屏幕边缘（-15）
-(void)viewDidLayoutSubviews
{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}


#pragma mark - tableView delegte

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Categories *cateModel = self.dataArray[indexPath.row];
    
    LWSGiftCategoryTableCell *cell = [LWSGiftCategoryTableCell cellWithTableView:tableView];
    cell.titleLabel.text = cateModel.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectIndex = indexPath.row;
    [self scrollToTopOfSection:_selectIndex animation:YES];
    [tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:_selectIndex inSection:0]
                     atScrollPosition:UITableViewScrollPositionTop
                             animated:YES];

}

- (void)scrollToTopOfSection:(NSInteger)section animation:(BOOL)animation
{
    CGRect headRect = [self frameForHeaderForSection:section];
    CGPoint topOfHeader = CGPointMake(0, headRect.origin.y - _collectionView.contentInset.top);
    [self.collectionView setContentOffset:topOfHeader animated:animation];
}

- (CGRect)frameForHeaderForSection:(NSInteger)section
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:section];
    UICollectionViewLayoutAttributes *attributes = [self.collectionView.collectionViewLayout layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:indexPath];
    return attributes.frame;
}



#pragma makr - collectionView delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.dataArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    Categories *model = self.dataArray[section];
    return model.subcategories.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Categories *categoriesModel = self.dataArray[indexPath.section];
    Subcategories *model = categoriesModel.subcategories[indexPath.item];
    LWSGiftCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kGiftCollectionCell forIndexPath:indexPath];
    cell.model = model;
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView;
    Categories *model = self.dataArray[indexPath.section];
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        LWSGiftCategoryReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kGiftCollectionHeader forIndexPath:indexPath];
        headerView.titleLabel.text = model.name;
        reusableView = headerView;
    }
    return reusableView;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if (!_isScrollDown && (collectionView.dragging || collectionView.decelerating))
    {
        [self selectRowAtIndexPath:indexPath.section];
    }

}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingSupplementaryView:(UICollectionReusableView *)view forElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
    if (_isScrollDown && (collectionView.dragging || collectionView.decelerating))
    {
        [self selectRowAtIndexPath:indexPath.section + 1];
    }
}

- (void)selectRowAtIndexPath:(NSInteger)index
{
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]
                                animated:YES
                          scrollPosition:UITableViewScrollPositionMiddle];
}
#pragma mark - lazy load
- (UITableView *)tableView
{
    if (!_tableView) {
//        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, kLeftTableViewWidth, self.view.height - TabbarHeight - SafeAreaBottomHeight - kSearchButtonHeight - SafeAreaTopHeight) style:UITableViewStylePlain];
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 46.0;
//        _tableView.bounces = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.tableFooterView = [UIView new];
        _tableView.alwaysBounceVertical = NO;
        _tableView.alwaysBounceHorizontal = NO;
//        [_tableView registerClass:[LWSGiftCategoryTableCell class] forCellReuseIdentifier:kGiftTableCell];
    }
    return _tableView;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.sectionInset = UIEdgeInsetsMake(12, 12, 12, 12);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayout.minimumLineSpacing = 7.0f;
        flowLayout.minimumInteritemSpacing = 12.0f;
        //        flowLayout.sectionHeadersPinToVisibleBounds = YES;
        CGFloat itemW = (self.view.width - kLeftTableViewWidth - 12 * 4) / 3;
        flowLayout.itemSize = CGSizeMake(itemW, 140);
        flowLayout.headerReferenceSize = CGSizeMake(self.view.width, 40.0f);
        
//        CGRect frame = CGRectMake(kLeftTableViewWidth, 40, self.view.width - kLeftTableViewWidth, self.view.height - kSearchButtonHeight - TabbarHeight - SafeAreaTopHeight - SafeAreaBottomHeight);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                             collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[LWSGiftCategoryCell class] forCellWithReuseIdentifier:kGiftCollectionCell];
        [_collectionView registerClass:[LWSGiftCategoryReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kGiftCollectionHeader];
    }
    return _collectionView;
}
@end

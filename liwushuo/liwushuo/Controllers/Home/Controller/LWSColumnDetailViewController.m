//
//  LWSColumnDetailViewController.m
//  liwushuo
//
//  Created by lee on 2017/12/19.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSColumnDetailViewController.h"
#import "DataModels.h"
#import "LWSDetailPostsListCell.h"
#import "LWSColumnDetailHeaderView.h"
#import "LWSColumnDescriptionView.h"

#define InsetTopHeight (Main_Screen_Height == 812.0 ? 0 : 20)

@interface LWSColumnDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) LWSColumnDetailHeaderView *columnDetailHeaderView;

@property (nonatomic, strong) LWSColumnDescriptionView *columnDescriptionView;

@property (nonatomic, strong) UIView *alphaView;

@property (nonatomic, copy) NSString *nextUrl;
@end

@implementation LWSColumnDetailViewController

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
  
    [self.navigationController.navigationBar setTintColor:kNavTintColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:kNavBackgroundColor] forBarMetrics:UIBarMetricsDefault];
    
//    [self.alphaView removeFromSuperview];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

//    CGFloat offSetY = self.tableView.contentOffset.y;
    [self alphaNavView:self.tableView.contentOffset.y];
    

}

- (void)alphaNavView:(CGFloat)offSetY
{
    CGFloat alpha = offSetY / 64.0;
    
    if (alpha >= 0.7) {
        self.navigationItem.title = self.titleStr;
        [self.navigationController.navigationBar setTintColor:kNavTintColor];
        
    } else {
        self.navigationItem.title = nil;
        [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    }
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:kNavBackgroundColorAlpha(offSetY / 64)] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
    self.navigationItem.title = nil;
    UIImage *leftItemImage = [UIImage imageNamed:@"btn_back_black_24x24_"];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:leftItemImage
                                                                                style:UIBarButtonItemStylePlain
                                                                               target:self
                                                                               action:@selector(BackBtnPress)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_share_black_24x24_"] style:UIBarButtonItemStylePlain
                                                                                     target:self
                                                                                     action:@selector(ShareBtnPress)];
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];

    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(-topMargin);
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            
        } else {
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }
    }];

    [self requestColumDetailData];
}

- (UIImage *)createAImageWithColor:(UIColor *)color alpha:(CGFloat)alpha{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextSetAlpha(context, alpha);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


- (void)customNavitationView
{
    
    [self.view addSubview:self.navgationView];
    
    [self.navgationView mas_makeConstraints:^(MASConstraintMaker *make) {

        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(-NavBarHeight);
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
            make.height.mas_equalTo(@44);
        } else {
            // Fallback on earlier versions
            make.left.top.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
            make.height.mas_equalTo(@64);
        }
    }];
    
    self.navgationView.alpha = 0;
    
    UIImageView *imageView = [[UIImageView alloc] init];
    [self.navgationView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.navgationView);
        make.height.mas_equalTo(@87);
    }];
    imageView.alpha = 0.164;
    
}

/**
 返回
 */
-(void)BackBtnPress{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)ShareBtnPress
{
    CustomShareView *shareView = CS_ShareVie();
    [shareView show];
}


#pragma mark - ScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat offSetY = scrollView.contentOffset.y;
    
    if (offSetY <= 0) {
        self.tableView.bounces = NO;
        
        NSLog(@"禁止下拉弹性");
    }
    else
        if (offSetY >= 0){
            self.tableView.bounces = YES;
            NSLog(@"允许上拉弹性");
            
        }
    
    [self alphaNavView:offSetY];
//    self.navgationView.alpha = alpha;
//    self.alphaView.alpha = alpha;
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
    // 快显示完剩下的数据的时候，提前加载下页数据
    if (indexPath.row == self.dataArray.count - 4) {
        if (self.nextUrl) { // 在没有下一个页面请求的时候 防止崩溃
            [self loadMoreData];
        }
    }
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark - requestData
- (void)requestColumDetailData
{
    __weak typeof(self) weakSelf = self;
    [self starAnmation];
    [[AllData shareManager] sendReuestWithMethod:Get urlString:[NSString stringWithFormat:@"https://api.liwushuo.com/v2/columns/%@?limit=20&offset=0",self.columnID] parameter:nil andCompletionBlock:^(NSDictionary *resultObject) {
        [weakSelf stopAnmation];
        if ([resultObject[@"code"] isEqualToNumber:@200]) {
            
            LWSData *model = [LWSData modelObjectWithDictionary:resultObject[@"data"]];
            weakSelf.dataArray = [NSMutableArray arrayWithArray:model.posts];
            weakSelf.columnDetailHeaderView.data = model;
            weakSelf.nextUrl = model.paging.nextUrl;
            [weakSelf.tableView reloadData];
            
        }
        
    } failureBlock:^(id error) {
        [weakSelf stopAnmation];
        NSLog(@"请求错误%@",error);
    }];
}

- (void)loadMoreData
{
    __weak typeof(self) weakSelf = self;
    [[AllData shareManager] sendReuestWithMethod:Get urlString:self.nextUrl parameter:nil andCompletionBlock:^(NSDictionary *resultObject) {
        
        if ([resultObject[@"code"] isEqualToNumber:@200]) {
            
            LWSData *model = [LWSData modelObjectWithDictionary:resultObject[@"data"]];
            [weakSelf.dataArray addObjectsFromArray:model.posts];
            [weakSelf.tableView reloadData];
            weakSelf.nextUrl = model.paging.nextUrl;

        }
        
    } failureBlock:^(id error) {
        
        NSLog(@"请求错误%@",error);
    }];
}

#pragma mark - TableView
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
    LWSPosts *model = self.dataArray[indexPath.row];
    LWSDetailPostsListCell *cell = [LWSDetailPostsListCell cellWithTableView:tableView];
    [cell configDetailPostsCellModel:model];
    cell.favoriteClickBlock = ^(UIButton *btn) {
        btn.selected = !btn.selected;
    };
    return cell;
}

#pragma mark - StatusBarStyle
- (UIStatusBarStyle)preferredStatusBarStyle
{
    if (Main_Screen_Height == 812.0) {
        return UIStatusBarStyleDefault;
    }
    if (self.tableView.contentOffset.y > 44.0) {
        return UIStatusBarStyleDefault;
    }
    return UIStatusBarStyleLightContent;
}

#pragma mark - Getts
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 105;
//        _tableView.bounces = NO;
//        _tableView.alwaysBounceVertical = NO;
        _tableView.alwaysBounceHorizontal = NO;
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.separatorColor = rgba(235, 235, 235, 1.0);
//        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.tableHeaderView = self.columnDetailHeaderView;
//        [_tableView addSubview:self.columnDetailHeaderView];
//        [_tableView addSubview:self.columnDescriptionView];
    }
    return _tableView;
}

- (LWSColumnDetailHeaderView *)columnDetailHeaderView
{
    if (!_columnDetailHeaderView) {
        _columnDetailHeaderView = [[LWSColumnDetailHeaderView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 181)];
    }
    return _columnDetailHeaderView;
}

- (LWSColumnDescriptionView *)columnDescriptionView
{
    if (!_columnDescriptionView) {
        _columnDescriptionView = [[LWSColumnDescriptionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.columnDetailHeaderView.frame) , Main_Screen_Width, 122)];
    }
    return _columnDescriptionView;
}

- (UIView *)navgationView
{
    if (!_navgationView) {
        _navgationView = [[UIView alloc] init];
        _navgationView.backgroundColor = kNavBackgroundColor;
        
    }
    return _navgationView;
}



@end

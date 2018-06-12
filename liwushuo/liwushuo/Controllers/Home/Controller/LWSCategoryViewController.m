//
//  LWSCategoryViewController.m
//  liwushuo
//
//  Created by lee on 2017/12/19.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSCategoryViewController.h"
#import "LWSHomeViewCell.h"
#import "DataModels.h"
#import "CustomShareView.h"
#import "LWSDetailViewController.h"
#import "LWSColumnDetailViewController.h"
#import "LWSPosts.h"
static NSString *const kCustomCell = @"kCustom";

@interface LWSCategoryViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSString *nextPageUrl;
@end

@implementation LWSCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(NavHeight, 0, 0, 0));
        }
    }];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"btn_share_black_24x24_"]                                       imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(shareItemClick)];
    
    [self requestCategoryData]; // 请求数据
    [self lineView];
}

- (void)shareItemClick
{
    // 分享
    //    __weak typeof(self) weakSelf = self;
    //    LWSShareViewController *share = [[LWSShareViewController alloc] init];
    //    [self presentViewController:share animated:YES completion:^{
    //        share.blurImageView.image = [weakSelf getNormalImage:weakSelf.view];
    //    }];
    
    CustomShareView *shareView = [[CustomShareView alloc] init];
    shareView.dataArray = @[@"friendcirle_36x36_",@"wechat_36x36_",@"sina_36x36_",@"qzone_37x37_",@"qq_36x36_",@"copyline_37x37_"];
    shareView.titleArray = @[@"朋友圈",@"微信好友",@"微博",@"QQ 空间",@"QQ 好友",@"复制链接"];
    
    [shareView show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - requesData

- (void)requestCategoryData
{
    NSString *url;
    
    switch (self.type) {
        case LWSCategoryTypeOne:
            url = @"https://api.liwushuo.com/v2/collections/450/posts?gender=1&generation=0&limit=20&offset=0";
            break;
        case LWSCategoryTypeTwo:
            url = @"https://api.liwushuo.com/v2/collections/446/posts?gender=1&generation=0&limit=20&offset=0";
            break;
        case LWSCategoryTypeThree:
            url = @"https://api.liwushuo.com/v2/collections/448/posts?gender=1&generation=0&limit=20&offset=0";
            break;

        case LWSCategoryBannerTypeOne:
            url = @"https://api.liwushuo.com/v2/collections/462/posts?gender=1&generation=0&limit=20&offset=0";
            break;

        case LWSCategoryBannerTypeTwo:
            url = @"https://api.liwushuo.com/v2/collections/443/posts?gender=1&generation=0&limit=20&offset=0";
            break;
        case LWSCategoryBannerTypeThree:
            url = @"https://api.liwushuo.com/v2/collections/438/posts?gender=1&generation=0&limit=20&offset=0";
            break;


        default:
            break;
    }
    
    __weak typeof(self) weakSelf = self;
    [self starAnmation];
    [[AllData shareManager] sendReuestWithMethod:Get urlString:url parameter:nil andCompletionBlock:^(NSDictionary *resultObject) {
        [weakSelf stopAnmation];
        if ([resultObject[@"code"] isEqualToNumber:@200]) {
            
            LWSData *model = [LWSData modelObjectWithDictionary:resultObject[@"data"]];
            weakSelf.nextPageUrl = model.paging.nextUrl;
            weakSelf.dataArray = [NSMutableArray arrayWithArray:model.posts];
            [weakSelf.tableView reloadData];
            
        } else {
            // 非 200 的处理
        }
    } failureBlock:^(id error) {
        [weakSelf stopAnmation];
        NSLog(@" 请求错误 %@",error);
    }];
}

#pragma mark - collectionView
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
    LWSHomeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCustomCell];
    cell.model = model;
    WeakSelf;
    cell.typeClickBlcok = ^{
        LWSColumnDetailViewController *vc = [[LWSColumnDetailViewController alloc] init];
        vc.columnID = [NSString stringWithFormat:@"%.f",model.column.columnIdentifier];
        vc.titleStr = model.column.title;
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LWSPosts *model = self.dataArray[indexPath.row];
    LWSDetailViewController *vc = [LWSDetailViewController new];
    vc.postsID = [NSString stringWithFormat:@"%.f",model.postsIdentifier];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - lazyload
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = Main_Screen_Width;
        _tableView.backgroundColor = BackgroundColor;
        _tableView.tableFooterView = [UIView new];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[LWSHomeViewCell class] forCellReuseIdentifier:kCustomCell];
    }
    return _tableView;
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataArray;
}

@end

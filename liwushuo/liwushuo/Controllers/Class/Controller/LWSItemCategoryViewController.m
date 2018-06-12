//
//  LWSItemCategoryViewController.m
//  liwushuo
//
//  Created by PinelliaZeit on 2018/1/30.
//  Copyright © 2018年 Pinellia Zeit. All rights reserved.
//

#import "LWSItemCategoryViewController.h"
#import "DataModels.h"
#import "LWSHomeViewCell.h"
#import "LWSColumnDetailViewController.h"
#import "LWSDetailViewController.h"

static NSString *const kCustomCell = @"kCustom";

@interface LWSItemCategoryViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSString *nextUrl;

@end

@implementation LWSItemCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    
    self.tableView = UI_UITableView(UITableViewStylePlain, Main_Screen_Width,self);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    [self lineView];
    [self requestCatgoryData];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_sort_black_24x24_"] style:UIBarButtonItemStylePlain target:self action:@selector(rightItemAction)];
}

- (void)rightItemAction
{
    // https://api.liwushuo.com/v2/channels/112/items_v2?limit=20&offset=0&order_by=now 默认
    // https://api.liwushuo.com/v2/channels/112/items_v2?limit=20&offset=0&order_by=likes_count // 热度
    NSLog(@"排序");
}

- (void)requestCatgoryData
{
    WeakSelf;
    [self starAnmation];
    [[AllData shareManager] sendReuestWithMethod:Get urlString:[NSString stringWithFormat:@"https://api.liwushuo.com/v2/channels/%@/items_v2?limit=20&offset=0",self.categoryID] parameter:nil andCompletionBlock:^(NSDictionary *resultObject) {
        [weakSelf stopAnmation];
        if ([resultObject[@"code"] isEqualToNumber:@200]) {
            
            LWSGiftCategoryModel *data = [LWSGiftCategoryModel modelObjectWithDictionary:resultObject[@"data"]];
            weakSelf.nextUrl = data.paging.nextUrl;
            weakSelf.dataArray = [NSMutableArray arrayWithArray:data.items];
            [weakSelf.tableView reloadData];
        
            
        } else {
            // 非 200 的处理
        }
        
    } failureBlock:^(id error) {
        [weakSelf stopAnmation];
        NSLog(@" 请求报错 %@",error);
    }];
}

- (void)loadMoreData
{
    WeakSelf;
    
    [[AllData shareManager] sendReuestWithMethod:Get urlString:self.nextUrl parameter:nil andCompletionBlock:^(NSDictionary *resultObject) {
        
        if ([resultObject[@"code"] isEqualToNumber:@200]) {
            LWSGiftCategoryModel *data = [LWSGiftCategoryModel modelObjectWithDictionary:resultObject[@"data"]];
            weakSelf.nextUrl = data.paging.nextUrl;
            [weakSelf.dataArray addObjectsFromArray:data.items];
            [weakSelf.tableView reloadData];
            
        } else {
            // 非 200 的处理
        }
        
    } failureBlock:^(id error) {
        
        NSLog(@" 请求报错 %@",error);
    }];
}

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
    Items *model = self.dataArray[indexPath.row];
    LWSHomeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCustomCell];
    if (!cell) {
        cell = [[LWSHomeViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCustomCell];
    }
    cell.model = model;
    __weak typeof(self) weakSelf = self;
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

    Items *model = self.dataArray[indexPath.item];
    LWSDetailViewController *vc = [LWSDetailViewController new];
    vc.postsID = [NSString stringWithFormat:@"%.f",model.itemsIdentifier];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == self.dataArray.count -5) {
        
        [self loadMoreData];
    }
}

#pragma mark - Getts
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataArray;
}
@end

//
//  LWSItemCommentController.m
//  liwushuo
//
//  Created by PinelliaZeit on 2018/1/29.
//  Copyright © 2018年 Pinellia Zeit. All rights reserved.
//

#import "LWSItemCommentController.h"
#import "LWSCommentCell.h"
#import "LWSCommentViewCell.h"
#import "LWSCommentsdata.h"

@interface LWSItemCommentController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;


@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation LWSItemCommentController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            // Fallback on earlier versions
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(SafeAreaTopHeight, 0, 0, 0));
            
        }
    }];
    
    [self requestItemData];
    [self lineView];
    
}

- (void)requestItemData
{
    WeakSelf;
    [self starAnmation];
    [[AllData shareManager] sendReuestWithMethod:Get urlString:[NSString stringWithFormat:@"https://api.liwushuo.com/v2/items/%@/comments?limit=20&offset=0",self.itemID] parameter:nil andCompletionBlock:^(NSDictionary *resultObject) {
        [weakSelf stopAnmation];
        if ([resultObject[@"code"] isEqualToNumber:@200]) {
            
            LWSCommentsdata *data = [LWSCommentsdata modelObjectWithDictionary:resultObject[@"data"]];
            weakSelf.dataArray = [NSMutableArray arrayWithArray:data.comments];
            [weakSelf.tableView reloadData];
        } else {
            // 处理 非 200 的问题
        }
        
    } failureBlock:^(id error) {
        NSLog(@"请求出错%@",error);
        [weakSelf stopAnmation];
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
    LWSComments *model = self.dataArray[indexPath.item];
    LWSCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:kCommentCell];
    cell.model = model;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
#pragma mark - Getts

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 100;
        _tableView.separatorInset = UIEdgeInsetsZero;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[LWSCommentCell class] forCellReuseIdentifier:kCommentCell];
    }
    return _tableView;
}

@end

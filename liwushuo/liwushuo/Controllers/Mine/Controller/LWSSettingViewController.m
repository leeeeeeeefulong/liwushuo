//
//  LWSSettingViewController.m
//  liwushuo
//
//  Created by lee on 2017/12/30.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSSettingViewController.h"

#import "LWSSettingCell.h"
#import "LWSShareViewController.h"

@interface LWSSettingViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) NSMutableArray *imageArray;
@end

@implementation LWSSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self baseUI];
}

- (void)baseUI
{
    self.navigationItem.title = @"设置";
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            
        } else {
            // Fallback on earlier versions
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(NavHeight, 0, 0, 0));
        }
        
    }];
}


#pragma mark - tableView Delegate && dataSouce

//-(void)viewDidLayoutSubviews
//{
//    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
//        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 20, 0, 0)];
//    }
//
//    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
//        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0, 20, 0, 0)];
//    }
//}
//
//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
//        [cell setSeparatorInset:UIEdgeInsetsMake(0, 20, 0, 0)];
//    }
//
//    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
//        [cell setLayoutMargins:UIEdgeInsetsMake(0, 20, 0, 0)];
//    }
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = self.dataArray[section];
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LWSSettingCell *cell = [LWSSettingCell cellWithTableView:tableView];
    cell.titleLabel.text = self.dataArray[indexPath.section][indexPath.row];
    cell.iconImageView.image = [UIImage imageNamed:self.imageArray[indexPath.section][indexPath.row]];
    cell.rightLabel.text = @"已开启";
//    cell.imageView.image = [UIImage imageNamed:@"icon_identity_24x24_"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    LWSShareViewController *vc = [[LWSShareViewController alloc] init];
    vc.blurImageView.image = [self.navigationController.view snapshotImageAfterScreenUpdates:YES];
    [self presentViewController:vc animated:YES completion:nil];
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 3) {
        return 20;
    }
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0;
}

#pragma mark - Getts
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 49.0;
        _tableView.backgroundColor = BackgroundColor;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorColor = rgba(240, 230, 230, 1.0);
        _tableView.separatorInset = UIEdgeInsetsMake(0, 50, 0, 0);
    }
    return _tableView;
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithArray:@[@[@"我的身份",@"绑定手机号",@"设置密码"],@[@"扫一扫",@"喜欢礼物到默认清单",@"管理收货地址",@"消息推送",@"清除缓存"],@[@"邀请有礼",@"好评奖积分",@"意见反馈",@"商务合作",@"客服电话",@"网络监测"],@[@"关于礼物说"]]];
    }
    return _dataArray;
}

- (NSMutableArray *)imageArray
{
    if (!_imageArray) {
        _imageArray = [NSMutableArray arrayWithArray:@[@[@"icon_identity_24x24_",@"icon_phone_24x24_",@"icon_lock_24x24_"],
  @[@"icon_scan_more_24x24_",@"icon_like_24x24_",@"icon_position_24x24_",@"icon_new_24x24_",@"icon_clean_24x24_"],
  @[@"icon_share_24x24_",@"icon_score_24x24_",@"icon_feedback_24x24_",@"icon_cooperation_24x24_",@"icon_help_24x24_",@"icon_net_24x24_"],
  @[@"icon_about_24x24_"]]];
    }
    return _imageArray;
}
@end

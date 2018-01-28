//
//  ViewController.m
//  liwushuo
//
//  Created by lee on 2017/11/23.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "ViewController.h"
#import "LWSShareViewController.h"
#import "CustomShareView.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
}

- (void)viewSafeAreaInsetsDidChange
{
    [super viewSafeAreaInsetsDidChange];
    
    if (@available(iOS 11.0, *)) {
        NSLog(@"%@",NSStringFromUIEdgeInsets(self.view.safeAreaInsets));
    } else {
        // Fallback on earlier versions
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *const kCell = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kCell];
    }
    cell.textLabel.text = [NSString stringWithFormat:@" liwushuo : %ld",(long)indexPath.row];
    cell.detailTextLabel.text = @"iOS 11";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    CustomShareView *shareView = [[CustomShareView alloc] init];
//    shareView.dataArray = @[@"friendcirle_36x36_",@"wechat_36x36_",@"sina_36x36_",@"qzone_37x37_",@"qq_36x36_",@"copyline_37x37_"];
//    shareView.titleArray = @[@"朋友圈",@"微信好友",@"微博",@"QQ 空间",@"QQ 好友",@"复制链接"];
//
//    [shareView show];
    LWSShareViewController *share = [[LWSShareViewController alloc] init];
    [self presentViewController:share animated:YES completion:^{
        share.blurImageView.image =  [self getNormalImage:self.view];
    }];
}

#pragma mark - 获取屏幕截图

- (UIImage *)getNormalImage:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height), NO, 0.0); // 高清
//    UIGraphicsBeginImageContext(CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)); // 模糊
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [view.layer renderInContext:context];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}


#pragma mark - lazy load
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:DefaultRect style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 60.0f;
        
    }
    return _tableView;
}

@end

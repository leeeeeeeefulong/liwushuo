//
//  LWSCommentViewController.m
//  liwushuo
//
//  Created by lee on 2018/1/3.
//  Copyright © 2018年 Pinellia Zeit. All rights reserved.
//

#import "LWSCommentViewController.h"
#import "LWSCommentsdata.h"
#import "LWSCommentCell.h"
#import "LWSCommentViewCell.h"
#import "LWSMultPhotoView.h"

#define itemMargin 5



@interface LWSCommentViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation LWSCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"评论";
    
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
    
//    [self requestCommentData];
    
}
#pragma makr - request

- (void)reqestCommentDataWithID:(NSString *)commentID
{
    WeakSelf;
    [[AllData shareManager] sendReuestWithMethod:Get urlString:[NSString stringWithFormat:@"https://api.liwushuo.com/v2/posts/%@/comments?limit=20&offset=0",commentID] parameter:@{} andCompletionBlock:^(NSDictionary *resultObject) {
        
        if ([resultObject[@"code"] isEqualToNumber:@200]) {
            
            LWSCommentsdata *data = [LWSCommentsdata modelObjectWithDictionary:resultObject[@"data"]];
            weakSelf.dataArray = [NSMutableArray arrayWithArray:data.comments];
            [weakSelf.tableView reloadData];
            
        } else {
            // 非 200 的处理
        }
        
    } failureBlock:^(id error) {
        NSLog(@" 评论请求错误 %@",error);
    }];
}



#pragma mark - delegate

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

/**
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LWSComments *model = self.dataArray[indexPath.section];
    if (indexPath.item == 0) {
        return CGSizeMake(Main_Screen_Width, 100);
    } else {
        LWSImages *images = model.images[indexPath.item - 1];
        
        NSLog(@"images --- %@",images);
        if (model.images.count > 1) {
            CGFloat itemW = (self.view.width - 60 - 20 - itemMargin * 2) / 3;
            return CGSizeMake(itemW, itemW);
        } else {
//            NSLog(@"%f ---- %f",images.imgW,images.imgH);
            return CGSizeMake(200, 260);
            
        }
        
    }
    return CGSizeZero;
}
*/
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
//- (UICollectionView *)collectionView
//{
//    if (!_collectionView) {
//        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//        flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
//        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
//        flowLayout.estimatedItemSize = CGSizeMake(Main_Screen_Width - 20, 100);
////        flowLayout.itemSize = CGSizeMake(Main_Screen_Width, Main_Screen_Width);
//        flowLayout.minimumLineSpacing = itemMargin;
//        flowLayout.minimumInteritemSpacing = itemMargin;
//
//        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
//        _collectionView.delegate = self;
//        _collectionView.dataSource = self;
//        _collectionView.backgroundColor = BackgroundColor;
//        _collectionView.contentMode = UIViewContentModeLeft;
//        _collectionView.showsVerticalScrollIndicator = NO;
//        [_collectionView registerClass:[LWSCommentViewCell class] forCellWithReuseIdentifier:kCommentCell];
////        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"c"];
//    }
//    return _collectionView;
//}

@end

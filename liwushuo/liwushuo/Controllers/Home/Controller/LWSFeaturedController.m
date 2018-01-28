//
//  LWSFeaturedController.m
//  liwushuo
//
//  Created by lee on 2017/12/5.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSFeaturedController.h"
#import "Banners.h"
#import "Target.h"
#import "SecondaryBanners.h"
#import "ZYBannerView.h"
#import "LWSCategoryViewController.h"
@interface LWSFeaturedController ()<ZYBannerViewDelegate,ZYBannerViewDataSource>

@end

@implementation LWSFeaturedController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGBA(250, 245, 245, 1.0);
    
    [self darwBannerView];
    [self detailView];

    [self bannersRequest];
    [self secondaryBannersRequest];
}

#pragma mark - drawUI
- (void)darwBannerView
{
    ZYBannerView *banner = [[ZYBannerView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 211)];
    banner.dataSource = self;
    banner.delegate = self;
    banner.shouldLoop = YES;
    banner.autoScroll = YES;
    
    [self.headView addSubview:banner];
    self.bannerView = banner;
}

- (void)detailView
{
    for (NSInteger i = 0; i < 3; i++) {
        FLAnimatedImageView *imageView = [[FLAnimatedImageView alloc] init];
        CGFloat imageW = Main_Screen_Width / 3;
        imageView.x = i * imageW;
        imageView.width = imageW - 1;
        imageView.y = 221;
        imageView.height = 97;
        imageView.tag = i;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        imageView.userInteractionEnabled = YES;
        
        __weak typeof(self) weakSelf = self;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
            [weakSelf detailImageClickAction:imageView];
        }];
        [imageView addGestureRecognizer:tap];
        [self.headView addSubview:imageView];
    }
    
}

- (void)detailImageClickAction:(FLAnimatedImageView *)imageView
{
    LWSCategoryViewController *vc = [[LWSCategoryViewController alloc] init];
    
    switch (imageView.tag) {
        case 0:
        {
            vc.type = LWSCategoryTypeOne;
            vc.navigationItem.title = @"百元礼物";
        }
            break;
        case 1:
        {
            vc.type = LWSCategoryTypeTwo;
            vc.navigationItem.title = @"创意礼物";
        }
            break;
        case 2:
        {
            vc.type = LWSCategoryTypeThree;
            vc.navigationItem.title = @"美味礼物";
        }
            break;
            
        default:
            break;
    }
    [self.navigationController pushViewController:vc animated:YES];
    
}


- (void)reloadDetailData
{
    //    NSLog(@"%@",self.headView.subviews);
    __weak typeof(self) weakSelf = self;
    [self.headView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj isKindOfClass:[FLAnimatedImageView class]]) {
            SecondaryBanners *secBanners = weakSelf.secondaryBanners[idx - 1];
            UI_UIImageView((FLAnimatedImageView *)obj, secBanners.imageUrl, @"placeholderimage_big_80x69_");
        }
        
    }];
    
}


#pragma mark - bannerView delegate
- (NSInteger)numberOfItemsInBanner:(ZYBannerView *)banner
{
    return self.banners.count;
}

- (UIView *)banner:(ZYBannerView *)banner viewForItemAtIndex:(NSInteger)index
{
    FLAnimatedImageView *imageView = [[FLAnimatedImageView alloc] init];
    Banners *model = self.banners[index];
    //    [imageView sd_setImageWithURL:[NSURL URLWithString:@"http://img01.liwushuo.com/image/171203/5le66uika.jpg-w720"]];
    UI_UIImageView(imageView, model.imageUrl, @"placeholderimage_big_80x69_");
    return imageView;
}

- (void)banner:(ZYBannerView *)banner didSelectItemAtIndex:(NSInteger)index
{
    Banners *model = self.banners[index];
    LWSCategoryViewController *vc = [[LWSCategoryViewController alloc] init];
    vc.navigationItem.title = model.target.title;
    switch (index) {
        case 0:
        {
            vc.type = LWSCategoryBannerTypeOne;
            
        }
            break;
        case 1:
        {
            vc.type = LWSCategoryBannerTypeTwo;

        }
            break;
        case 2:
        {
            vc.type = LWSCategoryBannerTypeThree;
            
        }
            break;
            
        default:
            break;
    }
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)bannersRequest
{
    __weak typeof(self) weakSelf = self;
    [[AllData shareManager] sendReuestWithMethod:Get urlString:@"https://api.liwushuo.com/v2/banners?channel=iOS" parameter:@{} andCompletionBlock:^(NSDictionary *resultObject) {
        if ([resultObject[@"code"] isEqualToNumber:@200]) {
            
            for (NSDictionary *dict in resultObject[@"data"][@"banners"]) {
                Banners *banners = [Banners modelObjectWithDictionary:dict];
                [weakSelf.banners addObject:banners];
                
            }
            [weakSelf.bannerView reloadData];
            
        } else {
            // 非 200 的处理
        }
        
    } failureBlock:^(id error) {
        NSLog(@" 请求发生错误 %@",error);
    }];
}

- (void)secondaryBannersRequest
{
    __weak typeof(self) weakSelf = self;
    [[AllData shareManager] sendReuestWithMethod:Get urlString:@"https://api.liwushuo.com/v2/secondary_banners?gender=1&generation=0" parameter:@{} andCompletionBlock:^(NSDictionary *resultObject) {
        if ([resultObject[@"code"] isEqualToNumber:@200]) {
            
            for (NSDictionary *dict in resultObject[@"data"][@"secondary_banners"]) {
                
                SecondaryBanners *secBanners = [SecondaryBanners modelObjectWithDictionary:dict];
                [weakSelf.secondaryBanners addObject:secBanners];
                
            }
            [weakSelf reloadDetailData];
            
        } else {
            // 非 200 的处理
        }
        
    } failureBlock:^(id error) {
        NSLog(@" 请求发生错误 %@",error);
    }];

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

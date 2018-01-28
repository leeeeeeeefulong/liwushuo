//
//  LWSDetailView.m
//  liwushuo
//
//  Created by lee on 2018/1/4.
//  Copyright © 2018年 Pinellia Zeit. All rights reserved.
//

#import "LWSDetailView.h"
#import "ZYBannerView.h"
#import "LWSItemData.h"

@interface LWSDetailView () <ZYBannerViewDataSource, ZYBannerViewDelegate>

@property (nonatomic, strong) ZYBannerView *bannerView;

@property (nonatomic, strong) NSArray *bannersArray;


@end

@implementation LWSDetailView

//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        [self drawUI];
//    }
//    return self;
//}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self drawUI];
    }
    return self;
}
- (void)drawUI
{
    ZYBannerView *bannerView = [[ZYBannerView alloc] init];
    bannerView.dataSource = self;
    bannerView.delegate = self;
    bannerView.shouldLoop = YES;
    bannerView.autoScroll = YES;
    [self addSubview:bannerView];
    
    [bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.right.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
//        make.height.mas_equalTo(@(Main_Screen_Width));
        make.edges.equalTo(self);
    }];

    self.bannerView = bannerView;
    self.backgroundColor = [UIColor flatSkyBlueColor];
}

- (void)reloadData:(LWSItemData *)model
{
    _bannersArray = model.imageUrls;
    [self.bannerView reloadData];
//    self.titleLabel.text = model.shortDescription;
//    self.priceLabel.text = [NSString stringWithFormat:@"￥%@",model.price];
//    [self.likeBtn setTitle:[NSString stringWithFormat:@"  %.f",model.likesCount] forState:UIControlStateNormal];
//    self.detailLabel.text = model.itemDataDescription;
}

#pragma mark - banner Delegate
- (NSInteger)numberOfItemsInBanner:(ZYBannerView *)banner
{
    return self.bannersArray.count;
}

- (UIView *)banner:(ZYBannerView *)banner viewForItemAtIndex:(NSInteger)index
{
    
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView setImageWithURL:[NSURL URLWithString:self.bannersArray[index]] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
    } usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    return imageView;
}


@end

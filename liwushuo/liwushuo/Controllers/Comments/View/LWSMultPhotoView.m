//
//  LWSMultPhotoView.m
//  liwushuo
//
//  Created by lee on 2018/1/3.
//  Copyright © 2018年 Pinellia Zeit. All rights reserved.
//

#import "LWSMultPhotoView.h"

@interface LWSMultPhotoView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation LWSMultPhotoView

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
    [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
}

- (void)configViewDataArray:(NSArray *)dataArray
{
    _dataArray = dataArray;
    [self.collectionView reloadData];
}

#pragma mark - delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
//    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"c" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor flatOrangeColor];
    return cell;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark - Getts
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
//        flowLayout.estimatedItemSize = CGSizeMake((Main_Screen_Width - 10) / 3, 100);
        flowLayout.itemSize = CGSizeMake(70, 70);
        flowLayout.minimumLineSpacing = 5;
        flowLayout.minimumInteritemSpacing = 5;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = BackgroundColor;
        _collectionView.contentMode = UIViewContentModeLeft;
        _collectionView.showsVerticalScrollIndicator = NO;
//        [_collectionView registerClass:[LWSCommentViewCell class] forCellWithReuseIdentifier:kCommentCell];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"c"];
    }
    return _collectionView;
}

@end

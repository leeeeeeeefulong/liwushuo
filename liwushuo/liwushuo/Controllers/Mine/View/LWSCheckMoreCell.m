//
//  LWSCheckMoreCell.m
//  liwushuo
//
//  Created by lee on 2017/12/29.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSCheckMoreCell.h"

@implementation LWSCheckMoreCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [self addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        imageView.image = [UIImage imageNamed:@"mine_btn_more_83x83_"];
    }
    
    return self;
}

@end

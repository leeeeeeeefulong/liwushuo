//
//  CommonMethod.m
//  liwushuo
//
//  Created by lee on 2018/1/2.
//  Copyright © 2018年 Pinellia Zeit. All rights reserved.
//

#import "CommonMethod.h"

@implementation CommonMethod

+ (CommonMethod *)sharedCommonMethod
{
    static dispatch_once_t onceToken;
    static CommonMethod *sharedCommonMethod = nil;
    dispatch_once(&onceToken, ^{
        sharedCommonMethod = [[CommonMethod alloc] init];
    });
    return sharedCommonMethod;
}

+ (UIView *)ogetBlackMaskLayer
{
    UIView *tempView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    tempView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    return tempView;
}

+ (UIFont *)setFontWithFontSize:(CGFloat)size withName:(NSString *)fontName
{
    if (fontName) {
        return [UIFont fontWithName:fontName size:size];
    }
    return [UIFont fontWithName:@"" size:size];
}

@end

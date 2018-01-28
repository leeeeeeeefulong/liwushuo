//
//  ShareView.m
//  liwushuo
//
//  Created by lee on 2018/1/1.
//  Copyright © 2018年 Pinellia Zeit. All rights reserved.
//

#import "ShareView.h"

@implementation ShareView

- (void)shareWithType:(ShareType)type andPresentViewController:(UIViewController *)presentViewController info:(NSDictionary *)infoDictionary {
    NSDictionary *tempDictionary = nil;
    UIImage *shareImage = nil;
    if ([infoDictionary[@"shareImage"] isKindOfClass:[NSString class]]) {
        shareImage = [UIImage imageWithData:[NSData dataWithContentsOfFile:@""]];
    } else if ([infoDictionary[@"shareImage"] isKindOfClass:[NSURL class]]) {
        shareImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:infoDictionary[@"shareImage"]]];
    } else {
        shareImage = infoDictionary[@"shareImage"];
    }

}
@end

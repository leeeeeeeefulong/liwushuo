//
//  LWSHomeViewModel.m
//  liwushuo
//
//  Created by lee on 2017/12/10.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSHomeViewModel.h"

@implementation LWSHomeViewModel

- (void)HomeViewDataRequest
{
    [[AllData shareManager] sendReuestWithMethod:Get
                                       urlString:@""
                                       parameter:@{}
                              andCompletionBlock:^(NSDictionary *resultObject) {
                                  
                                
                                  
                              } failureBlock:^(id error) {
                                
                              }];
}
@end

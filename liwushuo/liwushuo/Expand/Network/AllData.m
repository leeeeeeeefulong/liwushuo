
//
//  AllData.m
//  liwushuo
//
//  Created by lee on 2017/12/10.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "AllData.h"

@implementation AllData



+ (AllData *)shareManager
{
    static dispatch_once_t onceToken;
    static AllData *share = nil;
    dispatch_once(&onceToken, ^{
        share = [[AllData alloc] init];
    });
    return share;
}


/**
 网络请求方法
 
 @param methodType 请求类型
 @param urlStr 请求地址
 @param parameter 请求参数
 @param completionHandler 请求成功回调
 @param failureBlock 请求失败回调
 */
- (void)sendReuestWithMethod:(MethodType)methodType
                   urlString:(NSString *)urlStr
                   parameter:(NSDictionary *)parameter
          andCompletionBlock:(void (^)(NSDictionary *))completionHandler
                failureBlock:(void (^)(id))failureBlock
{
    
    [[NetworkManager shareManager] HTTPRequestWithMethodType:methodType
                                                   URLString:urlStr
                                                  parameters:parameter completionHandler:^(NSDictionary *resultDictionary, NSError *error) {
        

//                                                      NSLog(@"%@",resultDictionary);
                                               
        if (error) {
            failureBlock(error);
            return ;
        }
        
        if (resultDictionary) {
            completionHandler(resultDictionary);
            return ;
        }
        
        
    }];
}


@end

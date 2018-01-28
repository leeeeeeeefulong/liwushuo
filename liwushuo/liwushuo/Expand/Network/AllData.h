//
//  AllData.h
//  liwushuo
//
//  Created by lee on 2017/12/10.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkManager.h"
@interface AllData : NSObject


/**
 网络请求单例
 
 @return 单例
 */
+ (AllData *)shareManager;


/**
 数据请求方法
 
 @param methodType 请求类型
 @param urlStr 请求地址
 @param parameter 请求参数
 @param completionHandler 请求成功回调
 @param failureBlock 请求失败回调
 */
- (void)sendReuestWithMethod:(MethodType)methodType urlString:(NSString *)urlStr
                   parameter:(NSDictionary *)parameter
          andCompletionBlock:(void(^)(NSDictionary *resultObject))completionHandler
                failureBlock:(void(^)(id error))failureBlock;

@end

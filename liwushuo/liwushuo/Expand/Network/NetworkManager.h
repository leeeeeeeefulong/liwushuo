//
//  NetworkManager.h
//  liwushuo
//
//  Created by lee on 2017/12/10.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MethodType){
    Get     = 0,        // Get
    Post    = 1,        // Post
    UPload  = 2,        // UPload
    Delete  = 3         // Delete
};


@interface NetworkManager : NSObject


/**
 网络请求单例
 
 @return 单例
 */
+ (id)shareManager;


/**
 网络请求方法
 
 @param methodType 请求类型
 @param urlStr 请求地址
 @param parameters 请求参数
 @param completionHandler 请求结果
 */
- (void)HTTPRequestWithMethodType:(MethodType)methodType
                        URLString:(NSString *)urlStr
                       parameters:(id)parameters
                completionHandler:(void(^)(NSDictionary *resultDictionary, NSError *error))completionHandler;

@end

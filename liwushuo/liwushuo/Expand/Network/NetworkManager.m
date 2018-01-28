//
//  NetworkManager.m
//  liwushuo
//
//  Created by lee on 2017/12/10.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "NetworkManager.h"
#import "AFNetworking.h"
@interface NetworkManager ()
{
    AFHTTPSessionManager *_manager;
}
@end

@implementation NetworkManager

+ (id)shareManager
{
    static dispatch_once_t onceToken;
    static NetworkManager *shareManager = nil;
    dispatch_once(&onceToken, ^{
        shareManager = [[NetworkManager alloc] init];
    });
    return shareManager;
}


- (id)init
{
    self = [super init];
    if (self) {
        _manager = [AFHTTPSessionManager manager];
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
        _manager.operationQueue.maxConcurrentOperationCount = 5;
        [_manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        _manager.requestSerializer.timeoutInterval = 15.0f;
        [_manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
        _manager.responseSerializer.acceptableContentTypes  = [[NSSet alloc] initWithObjects:@"application/xml", @"text/xml",@"text/html", @"application/json",@"text/plain",@"text/json", nil];
        // 如果遇到https 请求错误 code = -999的问题
        _manager.securityPolicy.allowInvalidCertificates = YES;
        _manager.securityPolicy.validatesDomainName = NO;
    }
    return self;
}

- (void)HTTPRequestWithMethodType:(MethodType)methodType
                        URLString:(NSString *)urlStr
                       parameters:(id)parameters
                completionHandler:(void (^)(NSDictionary *, NSError *))completionHandler
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    NSMutableDictionary *parameterDicts = [NSMutableDictionary dictionaryWithDictionary:@{}];
    [parameterDicts addEntriesFromDictionary:parameters];
    
    switch (methodType) {
        case Get:
        {
            [_manager GET:urlStr parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (responseObject) completionHandler(responseObject,nil);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (error) completionHandler(nil,error);
            }];
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            
        }
            break;
        case Post:
        {
            [_manager POST:urlStr parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (responseObject) {
                    completionHandler(responseObject,nil);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (error) {
                    completionHandler(nil,error);
                }
            }];
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        }
            break;
            
        case Delete:
        {
            [_manager DELETE:urlStr parameters:parameterDicts success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (responseObject) {
                    completionHandler(responseObject,nil);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (error) {
                    completionHandler(nil,error);
                }
            }];
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        }
            break;
        default:
            break;
    }
}

@end

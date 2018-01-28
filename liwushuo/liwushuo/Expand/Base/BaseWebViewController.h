//
//  BaseWebViewController.h
//  liwushuo
//
//  Created by lee on 2018/1/2.
//  Copyright © 2018年 Pinellia Zeit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "BaseViewController.h"
@interface BaseWebViewController : BaseViewController

@property (nonatomic, strong) WKWebView *webView;

@end

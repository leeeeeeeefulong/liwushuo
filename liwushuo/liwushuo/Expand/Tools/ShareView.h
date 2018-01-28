//
//  ShareView.h
//  liwushuo
//
//  Created by lee on 2018/1/1.
//  Copyright © 2018年 Pinellia Zeit. All rights reserved.
//

typedef NS_ENUM(NSInteger, ShareType){
    WeChatFriend                   = 1,  //微信好友
    WeChatFriendsCircle            = 2,  //微信朋友圈
    QQFriend                       = 3,  //QQ好友
    QQFriendsCircle                = 4   //QQ空间
};

#import <Foundation/Foundation.h>

@interface ShareView : NSObject

@property (nonatomic,copy)void(^shareCallBackBlock)(BOOL isOK, NSString *message);

- (void)shareWithType:(ShareType)type andPresentViewController:(UIViewController *)presentViewController info:(NSDictionary *)infoDictionary;

@end

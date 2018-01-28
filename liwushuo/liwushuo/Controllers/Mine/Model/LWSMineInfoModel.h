//
//  LWSMineInfoModel.h
//
//  Created by  半夏 on 2017/12/29
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface LWSMineInfoModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double internalBaseClassIdentifier;
@property (nonatomic, assign) BOOL canMobileLogin;
@property (nonatomic, strong) NSString *mobile;
@property (nonatomic, strong) NSString *avatarUrl;
@property (nonatomic, assign) double likePostsCount;
@property (nonatomic, assign) id guestUuid;
@property (nonatomic, assign) double followColumnsCount;
@property (nonatomic, assign) double credit;
@property (nonatomic, assign) double gvipLevel;
@property (nonatomic, assign) double role;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, assign) BOOL hasPassword;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

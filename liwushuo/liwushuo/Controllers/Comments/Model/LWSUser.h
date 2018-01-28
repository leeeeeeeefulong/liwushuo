//
//  LWSUser.h
//
//  Created by  半夏 on 2018/1/3
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface LWSUser : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double userIdentifier;
@property (nonatomic, assign) id guestUuid;
@property (nonatomic, strong) NSString *avatarUrl;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, assign) double role;
@property (nonatomic, assign) BOOL canMobileLogin;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

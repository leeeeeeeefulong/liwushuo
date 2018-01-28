//
//  LWSData.h
//
//  Created by  半夏 on 2017/12/29
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LWSPaging;

@interface LWSData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double dataIdentifier;
@property (nonatomic, strong) NSString *coverImageUrl;
@property (nonatomic, assign) double postsCount;
@property (nonatomic, assign) double likesCount;
@property (nonatomic, strong) NSString *bannerWebpUrl;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSString *coverWebpUrl;
@property (nonatomic, strong) NSString *bannerImageUrl;
@property (nonatomic, assign) double createdAt;
@property (nonatomic, strong) NSArray *posts;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double updatedAt;
@property (nonatomic, strong) LWSPaging *paging;
@property (nonatomic, assign) double status;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

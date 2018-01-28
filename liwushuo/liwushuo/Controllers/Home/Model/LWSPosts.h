//
//  LWSPosts.h
//
//  Created by  半夏 on 2017/12/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Column, Author;

@interface LWSPosts : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) Column *column;
@property (nonatomic, strong) Author *author;
@property (nonatomic, assign) double mediaType;
@property (nonatomic, assign) BOOL liked;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double editorId;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSArray *adMonitors;
@property (nonatomic, assign) double status;
@property (nonatomic, assign) double publishedAt;
@property (nonatomic, assign) double updatedAt;
@property (nonatomic, assign) double approvedAt;
@property (nonatomic, assign) id limitEndAt;
@property (nonatomic, strong) NSString *template;
@property (nonatomic, strong) NSArray *featureList;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSArray *labelIds;
@property (nonatomic, assign) double postsIdentifier;
@property (nonatomic, assign) double contentType;
@property (nonatomic, strong) NSString *contentUrl;
@property (nonatomic, strong) NSString *shareMsg;
@property (nonatomic, assign) double likesCount;
@property (nonatomic, strong) NSString *introduction;
@property (nonatomic, assign) double createdAt;
@property (nonatomic, strong) NSString *shortTitle;
@property (nonatomic, strong) NSString *coverWebpUrl;
@property (nonatomic, strong) NSString *coverImageUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

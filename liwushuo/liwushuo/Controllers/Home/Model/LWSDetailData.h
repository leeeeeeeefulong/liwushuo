//
//  LWSDetailData.h
//
//  Created by  半夏 on 2018/1/3
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LWSDetailDataColumn, LWSItemAdMonitors;

@interface LWSDetailData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *columnBottom;
@property (nonatomic, assign) double createdAt;
@property (nonatomic, assign) double publishedAt;
@property (nonatomic, assign) double detailDataIdentifier;
@property (nonatomic, assign) id coverAnimatedWebpUrl;
@property (nonatomic, assign) double editorId;
@property (nonatomic, assign) double contentType;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) double approvedAt;
@property (nonatomic, assign) double sharesCount;
@property (nonatomic, strong) NSString *coverImageUrl;
@property (nonatomic, strong) NSString *template;
@property (nonatomic, strong) NSString *coverWebpUrl;
@property (nonatomic, strong) NSString *contentHtml;
@property (nonatomic, strong) NSString *shareMsg;
@property (nonatomic, strong) NSArray *labelIds;
@property (nonatomic, assign) double commentsCount;
@property (nonatomic, strong) NSString *contentUrl;
@property (nonatomic, strong) NSString *columnHeader;
@property (nonatomic, assign) BOOL liked;
@property (nonatomic, assign) id limitEndAt;
@property (nonatomic, strong) LWSDetailDataColumn *detailDataColumn;
@property (nonatomic, strong) NSString *introduction;
@property (nonatomic, strong) NSArray *featureList;
@property (nonatomic, assign) double status;
@property (nonatomic, assign) id content;
@property (nonatomic, strong) NSString *shortTitle;
@property (nonatomic, assign) double updatedAt;
@property (nonatomic, assign) double likesCount;
@property (nonatomic, strong) LWSItemAdMonitors *itemAdMonitors;
@property (nonatomic, assign) double mediaType;
@property (nonatomic, assign) id adMonitors;
@property (nonatomic, strong) NSString *title;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

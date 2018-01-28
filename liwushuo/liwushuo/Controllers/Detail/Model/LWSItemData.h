//
//  LWSItemData.h
//
//  Created by  半夏 on 2018/1/4
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LWSSource.h"

@class LWSSource;

@interface LWSItemData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) id authentic;
@property (nonatomic, assign) BOOL favorited;
@property (nonatomic, assign) double purchaseStatus;
@property (nonatomic, assign) double itemDataIdentifier;
@property (nonatomic, assign) double createdAt;
@property (nonatomic, strong) NSString *purchaseId;
@property (nonatomic, assign) double editorId;
@property (nonatomic, strong) NSArray *imageUrls;
@property (nonatomic, strong) NSArray *webpUrls;
@property (nonatomic, assign) id rank;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *purchaseUrl;
@property (nonatomic, assign) double favoritesCount;
@property (nonatomic, strong) NSString *itemDataDescription;
@property (nonatomic, assign) id brandId;
@property (nonatomic, strong) NSString *detailHtml;
@property (nonatomic, strong) NSString *coverImageUrl;
@property (nonatomic, assign) double sharesCount;
@property (nonatomic, strong) NSArray *postIds;
@property (nonatomic, strong) NSString *coverWebpUrl;
@property (nonatomic, strong) NSString *coverImageKey;
@property (nonatomic, assign) double commentsCount;
@property (nonatomic, assign) BOOL liked;
@property (nonatomic, strong) LWSSource *source;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) id subcategoryId;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, assign) double purchaseType;
@property (nonatomic, strong) NSString *purchaseShopId;
@property (nonatomic, assign) id brandOrder;
@property (nonatomic, assign) double updatedAt;
@property (nonatomic, strong) NSString *keywords;
@property (nonatomic, assign) double likesCount;
@property (nonatomic, assign) id categoryId;
@property (nonatomic, strong) NSString *shortDescription;
@property (nonatomic, assign) id adMonitors;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

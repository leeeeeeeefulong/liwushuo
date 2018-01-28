//
//  LWSItems.h
//
//  Created by  半夏 on 2017/12/13
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface LWSRankListModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *coverImageUrl;
@property (nonatomic, assign) double editorId;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) id adMonitors;
@property (nonatomic, strong) NSString *purchaseUrl;
@property (nonatomic, assign) double updatedAt;
@property (nonatomic, strong) NSArray *imageUrls;
@property (nonatomic, strong) NSString *coverImageKey;
@property (nonatomic, assign) double purchaseType;
@property (nonatomic, strong) NSString *keywords;
@property (nonatomic, assign) id brandId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *targetType;
@property (nonatomic, assign) double purchaseStatus;
@property (nonatomic, strong) NSArray *postIds;
@property (nonatomic, assign) double itemsIdentifier;
@property (nonatomic, assign) double favoritesCount;
@property (nonatomic, strong) NSString *shortDescription;
@property (nonatomic, strong) NSString *purchaseShopId;
@property (nonatomic, strong) NSString *purchaseId;
@property (nonatomic, assign) id brandOrder;
@property (nonatomic, assign) id subcategoryId;
@property (nonatomic, assign) double createdAt;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, assign) id categoryId;
@property (nonatomic, strong) NSString *coverWebpUrl;
@property (nonatomic, strong) NSString *itemsDescription;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

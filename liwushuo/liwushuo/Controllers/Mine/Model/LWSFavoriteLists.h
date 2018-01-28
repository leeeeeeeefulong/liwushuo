//
//  LWSFavoriteLists.h
//
//  Created by  半夏 on 2017/12/29
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface LWSFavoriteLists : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double favoriteListsIdentifier;
@property (nonatomic, assign) id headImageUrl;
@property (nonatomic, assign) id favoriteListsDescription;
@property (nonatomic, strong) NSString *coverImageUrl;
@property (nonatomic, assign) BOOL defaultFavoriteList;
@property (nonatomic, strong) NSString *coverWebpUrl;
@property (nonatomic, assign) double createdAt;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) double userId;
@property (nonatomic, assign) double itemsCount;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, assign) double updatedAt;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) BOOL publicProperty;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

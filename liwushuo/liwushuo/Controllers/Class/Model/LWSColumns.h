//
//  LWSColumns.h
//
//  Created by  半夏 on 2017/12/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface LWSColumns : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double columnsIdentifier;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *columnsDescription;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSString *coverImageUrl;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *bannerImageUrl;
@property (nonatomic, strong) NSString *coverWebpUrl;
@property (nonatomic, assign) double createdAt;
@property (nonatomic, strong) NSString *bannerWebpUrl;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double postPublishedAt;
@property (nonatomic, assign) double order;
@property (nonatomic, assign) double updatedAt;
@property (nonatomic, assign) double status;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

//
//  Column.h
//
//  Created by  半夏 on 2017/12/11
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Column : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double columnIdentifier;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *columnDescription;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSString *coverImageUrl;
@property (nonatomic, strong) NSString *bannerImageUrl;
@property (nonatomic, assign) double createdAt;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double postPublishedAt;
@property (nonatomic, assign) double order;
@property (nonatomic, assign) double updatedAt;
@property (nonatomic, assign) double status;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

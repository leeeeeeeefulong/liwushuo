//
//  LWSDetailDataColumn.h
//
//  Created by  半夏 on 2018/1/3
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface LWSDetailDataColumn : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double detailDataColumnIdentifier;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *detailDataColumnDescription;
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

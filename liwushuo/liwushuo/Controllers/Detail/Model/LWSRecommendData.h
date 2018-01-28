//
//  LWSRecommendData.h
//
//  Created by  半夏 on 2018/1/8
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LWSRecommendItems.h"
#import "LWSRecommendPosts.h"


@interface LWSRecommendData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *recommendItems;
@property (nonatomic, strong) NSArray *recommendPosts;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

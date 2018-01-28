//
//  LWSData.h
//
//  Created by  半夏 on 2017/12/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LWSPaging.h"
@class LWSPaging;

@interface LWSCategoryPostCollectionModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *columns;
@property (nonatomic, strong) LWSPaging *paging;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

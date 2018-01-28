//
//  Data.h
//
//  Created by  半夏 on 2017/12/11
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Paging;

@interface LWSGiftCategoryModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) Paging *paging;
+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

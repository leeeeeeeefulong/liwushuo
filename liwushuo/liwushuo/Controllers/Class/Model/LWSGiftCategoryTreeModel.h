//
//  Data.h
//
//  Created by  半夏 on 2017/12/15
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Categories.h"


@interface LWSGiftCategoryTreeModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *categories;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

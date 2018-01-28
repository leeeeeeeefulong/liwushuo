//
//  LWSCommentsdata.h
//
//  Created by  半夏 on 2018/1/3
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LWSComments.h"
#import "LWSImages.h"
#import "LWSUser.h"

@class LWSPaging;

@interface LWSCommentsdata : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) LWSPaging *paging;
@property (nonatomic, strong) NSArray *comments;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

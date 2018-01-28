//
//  LWSMineViewModel.h
//
//  Created by  半夏 on 2017/12/29
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LWSPaging;

@interface LWSMineViewModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *favoriteLists;
@property (nonatomic, strong) LWSPaging *paging;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

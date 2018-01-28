//
//  LWSData.h
//
//  Created by  半夏 on 2017/12/13
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LWSRankDataModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *shareUrl;
@property (nonatomic, strong) NSString *coverWebp;
@property (nonatomic, strong) NSString *coverUrl;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSString *coverImage;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

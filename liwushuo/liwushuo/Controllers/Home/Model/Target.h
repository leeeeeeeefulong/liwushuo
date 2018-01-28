//
//  Target.h
//
//  Created by  半夏 on 2017/12/13
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Target : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double status;
@property (nonatomic, strong) NSString *bannerImageUrl;
@property (nonatomic, strong) NSString *coverWebpUrl;
@property (nonatomic, assign) double targetIdentifier;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double createdAt;
@property (nonatomic, assign) double postsCount;
@property (nonatomic, strong) NSString *coverImageUrl;
@property (nonatomic, assign) double updatedAt;
@property (nonatomic, strong) NSString *bannerWebpUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

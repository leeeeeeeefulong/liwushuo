//
//  Banners.h
//
//  Created by  半夏 on 2017/12/13
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Target;

@interface Banners : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double bannersIdentifier;
@property (nonatomic, strong) NSArray *adMonitors;
@property (nonatomic, strong) NSString *channel;
@property (nonatomic, strong) NSString *webpUrl;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, assign) double targetId;
@property (nonatomic, assign) double order;
@property (nonatomic, strong) Target *target;
@property (nonatomic, strong) NSString *targetType;
@property (nonatomic, assign) double status;
@property (nonatomic, strong) NSString *targetUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

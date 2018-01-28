//
//  LWSChannels.h
//
//  Created by  半夏 on 2017/12/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface LWSChannels : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double status;
@property (nonatomic, assign) double groupId;
@property (nonatomic, assign) double channelsIdentifier;
@property (nonatomic, assign) double itemsCount;
@property (nonatomic, assign) double order;
@property (nonatomic, strong) NSString *iconUrl;
@property (nonatomic, strong) NSString *coverImageUrl;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *url;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

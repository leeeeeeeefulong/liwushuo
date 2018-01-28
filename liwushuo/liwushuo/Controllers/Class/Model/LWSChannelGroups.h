//
//  LWSChannelGroups.h
//
//  Created by  半夏 on 2017/12/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface LWSChannelGroups : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double status;
@property (nonatomic, assign) double channelGroupsIdentifier;
@property (nonatomic, strong) NSArray *channels;
@property (nonatomic, assign) double order;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

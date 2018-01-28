//
//  LWSData.m
//
//  Created by  半夏 on 2017/12/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "LWSCategoryModel.h"
#import "LWSChannelGroups.h"


NSString *const kLWSDataChannelGroups = @"channel_groups";


@interface LWSCategoryModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LWSCategoryModel

@synthesize channelGroups = _channelGroups;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
    NSObject *receivedLWSChannelGroups = [dict objectForKey:kLWSDataChannelGroups];
    NSMutableArray *parsedLWSChannelGroups = [NSMutableArray array];
    if ([receivedLWSChannelGroups isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedLWSChannelGroups) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedLWSChannelGroups addObject:[LWSChannelGroups modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedLWSChannelGroups isKindOfClass:[NSDictionary class]]) {
       [parsedLWSChannelGroups addObject:[LWSChannelGroups modelObjectWithDictionary:(NSDictionary *)receivedLWSChannelGroups]];
    }

    self.channelGroups = [NSArray arrayWithArray:parsedLWSChannelGroups];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForChannelGroups = [NSMutableArray array];
    for (NSObject *subArrayObject in self.channelGroups) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForChannelGroups addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForChannelGroups addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForChannelGroups] forKey:kLWSDataChannelGroups];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.channelGroups = [aDecoder decodeObjectForKey:kLWSDataChannelGroups];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_channelGroups forKey:kLWSDataChannelGroups];
}

- (id)copyWithZone:(NSZone *)zone
{
    LWSCategoryModel *copy = [[LWSCategoryModel alloc] init];
    
    if (copy) {

        copy.channelGroups = [self.channelGroups copyWithZone:zone];
    }
    
    return copy;
}


@end

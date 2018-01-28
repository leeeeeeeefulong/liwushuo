//
//  LWSChannelGroups.m
//
//  Created by  半夏 on 2017/12/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "LWSChannelGroups.h"
#import "LWSChannels.h"


NSString *const kLWSChannelGroupsStatus = @"status";
NSString *const kLWSChannelGroupsId = @"id";
NSString *const kLWSChannelGroupsChannels = @"channels";
NSString *const kLWSChannelGroupsOrder = @"order";
NSString *const kLWSChannelGroupsName = @"name";


@interface LWSChannelGroups ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LWSChannelGroups

@synthesize status = _status;
@synthesize channelGroupsIdentifier = _channelGroupsIdentifier;
@synthesize channels = _channels;
@synthesize order = _order;
@synthesize name = _name;


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
            self.status = [[self objectOrNilForKey:kLWSChannelGroupsStatus fromDictionary:dict] doubleValue];
            self.channelGroupsIdentifier = [[self objectOrNilForKey:kLWSChannelGroupsId fromDictionary:dict] doubleValue];
    NSObject *receivedLWSChannels = [dict objectForKey:kLWSChannelGroupsChannels];
    NSMutableArray *parsedLWSChannels = [NSMutableArray array];
    if ([receivedLWSChannels isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedLWSChannels) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedLWSChannels addObject:[LWSChannels modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedLWSChannels isKindOfClass:[NSDictionary class]]) {
       [parsedLWSChannels addObject:[LWSChannels modelObjectWithDictionary:(NSDictionary *)receivedLWSChannels]];
    }

    self.channels = [NSArray arrayWithArray:parsedLWSChannels];
            self.order = [[self objectOrNilForKey:kLWSChannelGroupsOrder fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kLWSChannelGroupsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kLWSChannelGroupsStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.channelGroupsIdentifier] forKey:kLWSChannelGroupsId];
    NSMutableArray *tempArrayForChannels = [NSMutableArray array];
    for (NSObject *subArrayObject in self.channels) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForChannels addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForChannels addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForChannels] forKey:kLWSChannelGroupsChannels];
    [mutableDict setValue:[NSNumber numberWithDouble:self.order] forKey:kLWSChannelGroupsOrder];
    [mutableDict setValue:self.name forKey:kLWSChannelGroupsName];

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

    self.status = [aDecoder decodeDoubleForKey:kLWSChannelGroupsStatus];
    self.channelGroupsIdentifier = [aDecoder decodeDoubleForKey:kLWSChannelGroupsId];
    self.channels = [aDecoder decodeObjectForKey:kLWSChannelGroupsChannels];
    self.order = [aDecoder decodeDoubleForKey:kLWSChannelGroupsOrder];
    self.name = [aDecoder decodeObjectForKey:kLWSChannelGroupsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_status forKey:kLWSChannelGroupsStatus];
    [aCoder encodeDouble:_channelGroupsIdentifier forKey:kLWSChannelGroupsId];
    [aCoder encodeObject:_channels forKey:kLWSChannelGroupsChannels];
    [aCoder encodeDouble:_order forKey:kLWSChannelGroupsOrder];
    [aCoder encodeObject:_name forKey:kLWSChannelGroupsName];
}

- (id)copyWithZone:(NSZone *)zone
{
    LWSChannelGroups *copy = [[LWSChannelGroups alloc] init];
    
    if (copy) {

        copy.status = self.status;
        copy.channelGroupsIdentifier = self.channelGroupsIdentifier;
        copy.channels = [self.channels copyWithZone:zone];
        copy.order = self.order;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end

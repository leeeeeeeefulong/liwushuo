//
//  LWSChannels.m
//
//  Created by  半夏 on 2017/12/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "LWSChannels.h"


NSString *const kLWSChannelsStatus = @"status";
NSString *const kLWSChannelsGroupId = @"group_id";
NSString *const kLWSChannelsId = @"id";
NSString *const kLWSChannelsItemsCount = @"items_count";
NSString *const kLWSChannelsOrder = @"order";
NSString *const kLWSChannelsIconUrl = @"icon_url";
NSString *const kLWSChannelsCoverImageUrl = @"cover_image_url";
NSString *const kLWSChannelsName = @"name";
NSString *const kLWSChannelsUrl = @"url";


@interface LWSChannels ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LWSChannels

@synthesize status = _status;
@synthesize groupId = _groupId;
@synthesize channelsIdentifier = _channelsIdentifier;
@synthesize itemsCount = _itemsCount;
@synthesize order = _order;
@synthesize iconUrl = _iconUrl;
@synthesize coverImageUrl = _coverImageUrl;
@synthesize name = _name;
@synthesize url = _url;


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
            self.status = [[self objectOrNilForKey:kLWSChannelsStatus fromDictionary:dict] doubleValue];
            self.groupId = [[self objectOrNilForKey:kLWSChannelsGroupId fromDictionary:dict] doubleValue];
            self.channelsIdentifier = [[self objectOrNilForKey:kLWSChannelsId fromDictionary:dict] doubleValue];
            self.itemsCount = [[self objectOrNilForKey:kLWSChannelsItemsCount fromDictionary:dict] doubleValue];
            self.order = [[self objectOrNilForKey:kLWSChannelsOrder fromDictionary:dict] doubleValue];
            self.iconUrl = [self objectOrNilForKey:kLWSChannelsIconUrl fromDictionary:dict];
            self.coverImageUrl = [self objectOrNilForKey:kLWSChannelsCoverImageUrl fromDictionary:dict];
            self.name = [self objectOrNilForKey:kLWSChannelsName fromDictionary:dict];
            self.url = [self objectOrNilForKey:kLWSChannelsUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kLWSChannelsStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.groupId] forKey:kLWSChannelsGroupId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.channelsIdentifier] forKey:kLWSChannelsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemsCount] forKey:kLWSChannelsItemsCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.order] forKey:kLWSChannelsOrder];
    [mutableDict setValue:self.iconUrl forKey:kLWSChannelsIconUrl];
    [mutableDict setValue:self.coverImageUrl forKey:kLWSChannelsCoverImageUrl];
    [mutableDict setValue:self.name forKey:kLWSChannelsName];
    [mutableDict setValue:self.url forKey:kLWSChannelsUrl];

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

    self.status = [aDecoder decodeDoubleForKey:kLWSChannelsStatus];
    self.groupId = [aDecoder decodeDoubleForKey:kLWSChannelsGroupId];
    self.channelsIdentifier = [aDecoder decodeDoubleForKey:kLWSChannelsId];
    self.itemsCount = [aDecoder decodeDoubleForKey:kLWSChannelsItemsCount];
    self.order = [aDecoder decodeDoubleForKey:kLWSChannelsOrder];
    self.iconUrl = [aDecoder decodeObjectForKey:kLWSChannelsIconUrl];
    self.coverImageUrl = [aDecoder decodeObjectForKey:kLWSChannelsCoverImageUrl];
    self.name = [aDecoder decodeObjectForKey:kLWSChannelsName];
    self.url = [aDecoder decodeObjectForKey:kLWSChannelsUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_status forKey:kLWSChannelsStatus];
    [aCoder encodeDouble:_groupId forKey:kLWSChannelsGroupId];
    [aCoder encodeDouble:_channelsIdentifier forKey:kLWSChannelsId];
    [aCoder encodeDouble:_itemsCount forKey:kLWSChannelsItemsCount];
    [aCoder encodeDouble:_order forKey:kLWSChannelsOrder];
    [aCoder encodeObject:_iconUrl forKey:kLWSChannelsIconUrl];
    [aCoder encodeObject:_coverImageUrl forKey:kLWSChannelsCoverImageUrl];
    [aCoder encodeObject:_name forKey:kLWSChannelsName];
    [aCoder encodeObject:_url forKey:kLWSChannelsUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    LWSChannels *copy = [[LWSChannels alloc] init];
    
    if (copy) {

        copy.status = self.status;
        copy.groupId = self.groupId;
        copy.channelsIdentifier = self.channelsIdentifier;
        copy.itemsCount = self.itemsCount;
        copy.order = self.order;
        copy.iconUrl = [self.iconUrl copyWithZone:zone];
        copy.coverImageUrl = [self.coverImageUrl copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
    }
    
    return copy;
}


@end

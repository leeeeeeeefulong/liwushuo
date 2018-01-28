//
//  Banners.m
//
//  Created by  半夏 on 2017/12/13
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Banners.h"
#import "Target.h"


NSString *const kBannersId = @"id";
NSString *const kBannersAdMonitors = @"ad_monitors";
NSString *const kBannersChannel = @"channel";
NSString *const kBannersWebpUrl = @"webp_url";
NSString *const kBannersImageUrl = @"image_url";
NSString *const kBannersType = @"type";
NSString *const kBannersTargetId = @"target_id";
NSString *const kBannersOrder = @"order";
NSString *const kBannersTarget = @"target";
NSString *const kBannersTargetType = @"target_type";
NSString *const kBannersStatus = @"status";
NSString *const kBannersTargetUrl = @"target_url";


@interface Banners ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Banners

@synthesize bannersIdentifier = _bannersIdentifier;
@synthesize adMonitors = _adMonitors;
@synthesize channel = _channel;
@synthesize webpUrl = _webpUrl;
@synthesize imageUrl = _imageUrl;
@synthesize type = _type;
@synthesize targetId = _targetId;
@synthesize order = _order;
@synthesize target = _target;
@synthesize targetType = _targetType;
@synthesize status = _status;
@synthesize targetUrl = _targetUrl;


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
            self.bannersIdentifier = [[self objectOrNilForKey:kBannersId fromDictionary:dict] doubleValue];
            self.adMonitors = [self objectOrNilForKey:kBannersAdMonitors fromDictionary:dict];
            self.channel = [self objectOrNilForKey:kBannersChannel fromDictionary:dict];
            self.webpUrl = [self objectOrNilForKey:kBannersWebpUrl fromDictionary:dict];
            self.imageUrl = [self objectOrNilForKey:kBannersImageUrl fromDictionary:dict];
            self.type = [self objectOrNilForKey:kBannersType fromDictionary:dict];
            self.targetId = [[self objectOrNilForKey:kBannersTargetId fromDictionary:dict] doubleValue];
            self.order = [[self objectOrNilForKey:kBannersOrder fromDictionary:dict] doubleValue];
            self.target = [Target modelObjectWithDictionary:[dict objectForKey:kBannersTarget]];
            self.targetType = [self objectOrNilForKey:kBannersTargetType fromDictionary:dict];
            self.status = [[self objectOrNilForKey:kBannersStatus fromDictionary:dict] doubleValue];
            self.targetUrl = [self objectOrNilForKey:kBannersTargetUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bannersIdentifier] forKey:kBannersId];
    NSMutableArray *tempArrayForAdMonitors = [NSMutableArray array];
    for (NSObject *subArrayObject in self.adMonitors) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAdMonitors addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAdMonitors addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAdMonitors] forKey:kBannersAdMonitors];
    [mutableDict setValue:self.channel forKey:kBannersChannel];
    [mutableDict setValue:self.webpUrl forKey:kBannersWebpUrl];
    [mutableDict setValue:self.imageUrl forKey:kBannersImageUrl];
    [mutableDict setValue:self.type forKey:kBannersType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.targetId] forKey:kBannersTargetId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.order] forKey:kBannersOrder];
    [mutableDict setValue:[self.target dictionaryRepresentation] forKey:kBannersTarget];
    [mutableDict setValue:self.targetType forKey:kBannersTargetType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kBannersStatus];
    [mutableDict setValue:self.targetUrl forKey:kBannersTargetUrl];

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

    self.bannersIdentifier = [aDecoder decodeDoubleForKey:kBannersId];
    self.adMonitors = [aDecoder decodeObjectForKey:kBannersAdMonitors];
    self.channel = [aDecoder decodeObjectForKey:kBannersChannel];
    self.webpUrl = [aDecoder decodeObjectForKey:kBannersWebpUrl];
    self.imageUrl = [aDecoder decodeObjectForKey:kBannersImageUrl];
    self.type = [aDecoder decodeObjectForKey:kBannersType];
    self.targetId = [aDecoder decodeDoubleForKey:kBannersTargetId];
    self.order = [aDecoder decodeDoubleForKey:kBannersOrder];
    self.target = [aDecoder decodeObjectForKey:kBannersTarget];
    self.targetType = [aDecoder decodeObjectForKey:kBannersTargetType];
    self.status = [aDecoder decodeDoubleForKey:kBannersStatus];
    self.targetUrl = [aDecoder decodeObjectForKey:kBannersTargetUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_bannersIdentifier forKey:kBannersId];
    [aCoder encodeObject:_adMonitors forKey:kBannersAdMonitors];
    [aCoder encodeObject:_channel forKey:kBannersChannel];
    [aCoder encodeObject:_webpUrl forKey:kBannersWebpUrl];
    [aCoder encodeObject:_imageUrl forKey:kBannersImageUrl];
    [aCoder encodeObject:_type forKey:kBannersType];
    [aCoder encodeDouble:_targetId forKey:kBannersTargetId];
    [aCoder encodeDouble:_order forKey:kBannersOrder];
    [aCoder encodeObject:_target forKey:kBannersTarget];
    [aCoder encodeObject:_targetType forKey:kBannersTargetType];
    [aCoder encodeDouble:_status forKey:kBannersStatus];
    [aCoder encodeObject:_targetUrl forKey:kBannersTargetUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    Banners *copy = [[Banners alloc] init];
    
    if (copy) {

        copy.bannersIdentifier = self.bannersIdentifier;
        copy.adMonitors = [self.adMonitors copyWithZone:zone];
        copy.channel = [self.channel copyWithZone:zone];
        copy.webpUrl = [self.webpUrl copyWithZone:zone];
        copy.imageUrl = [self.imageUrl copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.targetId = self.targetId;
        copy.order = self.order;
        copy.target = [self.target copyWithZone:zone];
        copy.targetType = [self.targetType copyWithZone:zone];
        copy.status = self.status;
        copy.targetUrl = [self.targetUrl copyWithZone:zone];
    }
    
    return copy;
}


@end

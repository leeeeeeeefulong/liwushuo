//
//  SecondaryBanners.m
//
//  Created by  半夏 on 2017/12/13
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "SecondaryBanners.h"


NSString *const kSecondaryBannersTargetUrl = @"target_url";
NSString *const kSecondaryBannersId = @"id";
NSString *const kSecondaryBannersAdMonitors = @"ad_monitors";
NSString *const kSecondaryBannersImageUrl = @"image_url";
NSString *const kSecondaryBannersWebpUrl = @"webp_url";


@interface SecondaryBanners ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SecondaryBanners

@synthesize targetUrl = _targetUrl;
@synthesize secondaryBannersIdentifier = _secondaryBannersIdentifier;
@synthesize adMonitors = _adMonitors;
@synthesize imageUrl = _imageUrl;
@synthesize webpUrl = _webpUrl;


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
            self.targetUrl = [self objectOrNilForKey:kSecondaryBannersTargetUrl fromDictionary:dict];
            self.secondaryBannersIdentifier = [[self objectOrNilForKey:kSecondaryBannersId fromDictionary:dict] doubleValue];
            self.adMonitors = [self objectOrNilForKey:kSecondaryBannersAdMonitors fromDictionary:dict];
            self.imageUrl = [self objectOrNilForKey:kSecondaryBannersImageUrl fromDictionary:dict];
            self.webpUrl = [self objectOrNilForKey:kSecondaryBannersWebpUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.targetUrl forKey:kSecondaryBannersTargetUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.secondaryBannersIdentifier] forKey:kSecondaryBannersId];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAdMonitors] forKey:kSecondaryBannersAdMonitors];
    [mutableDict setValue:self.imageUrl forKey:kSecondaryBannersImageUrl];
    [mutableDict setValue:self.webpUrl forKey:kSecondaryBannersWebpUrl];

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

    self.targetUrl = [aDecoder decodeObjectForKey:kSecondaryBannersTargetUrl];
    self.secondaryBannersIdentifier = [aDecoder decodeDoubleForKey:kSecondaryBannersId];
    self.adMonitors = [aDecoder decodeObjectForKey:kSecondaryBannersAdMonitors];
    self.imageUrl = [aDecoder decodeObjectForKey:kSecondaryBannersImageUrl];
    self.webpUrl = [aDecoder decodeObjectForKey:kSecondaryBannersWebpUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_targetUrl forKey:kSecondaryBannersTargetUrl];
    [aCoder encodeDouble:_secondaryBannersIdentifier forKey:kSecondaryBannersId];
    [aCoder encodeObject:_adMonitors forKey:kSecondaryBannersAdMonitors];
    [aCoder encodeObject:_imageUrl forKey:kSecondaryBannersImageUrl];
    [aCoder encodeObject:_webpUrl forKey:kSecondaryBannersWebpUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    SecondaryBanners *copy = [[SecondaryBanners alloc] init];
    
    if (copy) {

        copy.targetUrl = [self.targetUrl copyWithZone:zone];
        copy.secondaryBannersIdentifier = self.secondaryBannersIdentifier;
        copy.adMonitors = [self.adMonitors copyWithZone:zone];
        copy.imageUrl = [self.imageUrl copyWithZone:zone];
        copy.webpUrl = [self.webpUrl copyWithZone:zone];
    }
    
    return copy;
}


@end

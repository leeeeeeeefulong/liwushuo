//
//  LWSItems.m
//
//  Created by  半夏 on 2017/12/29
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "LWSItems.h"


NSString *const kLWSItemsTargetUrl = @"target_url";
NSString *const kLWSMineItemsId = @"id";
NSString *const kLWMineSItemsCoverWebpUrl = @"cover_webp_url";
NSString *const kLWSMineItemsTargetType = @"target_type";


@interface LWSItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LWSItems

@synthesize targetUrl = _targetUrl;
@synthesize itemsIdentifier = _itemsIdentifier;
@synthesize coverWebpUrl = _coverWebpUrl;
@synthesize targetType = _targetType;


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
            self.targetUrl = [self objectOrNilForKey:kLWSItemsTargetUrl fromDictionary:dict];
            self.itemsIdentifier = [[self objectOrNilForKey:kLWSMineItemsId fromDictionary:dict] doubleValue];
            self.coverWebpUrl = [self objectOrNilForKey:kLWMineSItemsCoverWebpUrl fromDictionary:dict];
            self.targetType = [self objectOrNilForKey:kLWSMineItemsTargetType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.targetUrl forKey:kLWSItemsTargetUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemsIdentifier] forKey:kLWSMineItemsId];
    [mutableDict setValue:self.coverWebpUrl forKey:kLWMineSItemsCoverWebpUrl];
    [mutableDict setValue:self.targetType forKey:kLWSMineItemsTargetType];

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

    self.targetUrl = [aDecoder decodeObjectForKey:kLWSItemsTargetUrl];
    self.itemsIdentifier = [aDecoder decodeDoubleForKey:kLWSMineItemsId];
    self.coverWebpUrl = [aDecoder decodeObjectForKey:kLWMineSItemsCoverWebpUrl];
    self.targetType = [aDecoder decodeObjectForKey:kLWSMineItemsTargetType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_targetUrl forKey:kLWSItemsTargetUrl];
    [aCoder encodeDouble:_itemsIdentifier forKey:kLWSMineItemsId];
    [aCoder encodeObject:_coverWebpUrl forKey:kLWMineSItemsCoverWebpUrl];
    [aCoder encodeObject:_targetType forKey:kLWSMineItemsTargetType];
}

- (id)copyWithZone:(NSZone *)zone
{
    LWSItems *copy = [[LWSItems alloc] init];
    
    if (copy) {

        copy.targetUrl = [self.targetUrl copyWithZone:zone];
        copy.itemsIdentifier = self.itemsIdentifier;
        copy.coverWebpUrl = [self.coverWebpUrl copyWithZone:zone];
        copy.targetType = [self.targetType copyWithZone:zone];
    }
    
    return copy;
}


@end

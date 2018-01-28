//
//  LWSData.m
//
//  Created by  半夏 on 2017/12/13
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "LWSRankDataModel.h"

#import "LWSRankListModel.h"


NSString *const kLWSDataShareUrl = @"share_url";
NSString *const kLWSDataCoverWebp = @"cover_webp";
NSString *const kLWSDataCoverUrl = @"cover_url";
NSString *const kLWSDataItems = @"items";
NSString *const kLWSDataCoverImage = @"cover_image";


@interface LWSRankDataModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LWSRankDataModel

@synthesize shareUrl = _shareUrl;
@synthesize coverWebp = _coverWebp;
@synthesize coverUrl = _coverUrl;
@synthesize items = _items;
@synthesize coverImage = _coverImage;


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
            self.shareUrl = [self objectOrNilForKey:kLWSDataShareUrl fromDictionary:dict];
            self.coverWebp = [self objectOrNilForKey:kLWSDataCoverWebp fromDictionary:dict];
            self.coverUrl = [self objectOrNilForKey:kLWSDataCoverUrl fromDictionary:dict];
    NSObject *receivedLWSItems = [dict objectForKey:kLWSDataItems];
    NSMutableArray *parsedLWSItems = [NSMutableArray array];
    if ([receivedLWSItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedLWSItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedLWSItems addObject:[LWSRankListModel modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedLWSItems isKindOfClass:[NSDictionary class]]) {
       [parsedLWSItems addObject:[LWSRankListModel modelObjectWithDictionary:(NSDictionary *)receivedLWSItems]];
    }

    self.items = [NSArray arrayWithArray:parsedLWSItems];
            self.coverImage = [self objectOrNilForKey:kLWSDataCoverImage fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.shareUrl forKey:kLWSDataShareUrl];
    [mutableDict setValue:self.coverWebp forKey:kLWSDataCoverWebp];
    [mutableDict setValue:self.coverUrl forKey:kLWSDataCoverUrl];
    NSMutableArray *tempArrayForItems = [NSMutableArray array];
    for (NSObject *subArrayObject in self.items) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kLWSDataItems];
    [mutableDict setValue:self.coverImage forKey:kLWSDataCoverImage];

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

    self.shareUrl = [aDecoder decodeObjectForKey:kLWSDataShareUrl];
    self.coverWebp = [aDecoder decodeObjectForKey:kLWSDataCoverWebp];
    self.coverUrl = [aDecoder decodeObjectForKey:kLWSDataCoverUrl];
    self.items = [aDecoder decodeObjectForKey:kLWSDataItems];
    self.coverImage = [aDecoder decodeObjectForKey:kLWSDataCoverImage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_shareUrl forKey:kLWSDataShareUrl];
    [aCoder encodeObject:_coverWebp forKey:kLWSDataCoverWebp];
    [aCoder encodeObject:_coverUrl forKey:kLWSDataCoverUrl];
    [aCoder encodeObject:_items forKey:kLWSDataItems];
    [aCoder encodeObject:_coverImage forKey:kLWSDataCoverImage];
}

- (id)copyWithZone:(NSZone *)zone
{
    LWSRankDataModel *copy = [[LWSRankDataModel alloc] init];
    
    if (copy) {

        copy.shareUrl = [self.shareUrl copyWithZone:zone];
        copy.coverWebp = [self.coverWebp copyWithZone:zone];
        copy.coverUrl = [self.coverUrl copyWithZone:zone];
        copy.items = [self.items copyWithZone:zone];
        copy.coverImage = [self.coverImage copyWithZone:zone];
    }
    
    return copy;
}


@end

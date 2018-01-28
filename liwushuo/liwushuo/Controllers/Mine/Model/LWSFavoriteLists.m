//
//  LWSFavoriteLists.m
//
//  Created by  半夏 on 2017/12/29
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "LWSFavoriteLists.h"
#import "LWSItems.h"


NSString *const kLWSFavoriteListsId = @"id";
NSString *const kLWSFavoriteListsHeadImageUrl = @"head_image_url";
NSString *const kLWSFavoriteListsDescription = @"description";
NSString *const kLWSFavoriteListsCoverImageUrl = @"cover_image_url";
NSString *const kLWSFavoriteListsDefaultFavoriteList = @"default_favorite_list";
NSString *const kLWSFavoriteListsCoverWebpUrl = @"cover_webp_url";
NSString *const kLWSFavoriteListsCreatedAt = @"created_at";
NSString *const kLWSFavoriteListsUrl = @"url";
NSString *const kLWSFavoriteListsUserId = @"user_id";
NSString *const kLWSFavoriteListsItemsCount = @"items_count";
NSString *const kLWSFavoriteListsItems = @"items";
NSString *const kLWSFavoriteListsUpdatedAt = @"updated_at";
NSString *const kLWSFavoriteListsName = @"name";
NSString *const kLWSFavoriteListsPublic = @"public";


@interface LWSFavoriteLists ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LWSFavoriteLists

@synthesize favoriteListsIdentifier = _favoriteListsIdentifier;
@synthesize headImageUrl = _headImageUrl;
@synthesize favoriteListsDescription = _favoriteListsDescription;
@synthesize coverImageUrl = _coverImageUrl;
@synthesize defaultFavoriteList = _defaultFavoriteList;
@synthesize coverWebpUrl = _coverWebpUrl;
@synthesize createdAt = _createdAt;
@synthesize url = _url;
@synthesize userId = _userId;
@synthesize itemsCount = _itemsCount;
@synthesize items = _items;
@synthesize updatedAt = _updatedAt;
@synthesize name = _name;
@synthesize publicProperty = _publicProperty;


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
            self.favoriteListsIdentifier = [[self objectOrNilForKey:kLWSFavoriteListsId fromDictionary:dict] doubleValue];
            self.headImageUrl = [self objectOrNilForKey:kLWSFavoriteListsHeadImageUrl fromDictionary:dict];
            self.favoriteListsDescription = [self objectOrNilForKey:kLWSFavoriteListsDescription fromDictionary:dict];
            self.coverImageUrl = [self objectOrNilForKey:kLWSFavoriteListsCoverImageUrl fromDictionary:dict];
            self.defaultFavoriteList = [[self objectOrNilForKey:kLWSFavoriteListsDefaultFavoriteList fromDictionary:dict] boolValue];
            self.coverWebpUrl = [self objectOrNilForKey:kLWSFavoriteListsCoverWebpUrl fromDictionary:dict];
            self.createdAt = [[self objectOrNilForKey:kLWSFavoriteListsCreatedAt fromDictionary:dict] doubleValue];
            self.url = [self objectOrNilForKey:kLWSFavoriteListsUrl fromDictionary:dict];
            self.userId = [[self objectOrNilForKey:kLWSFavoriteListsUserId fromDictionary:dict] doubleValue];
            self.itemsCount = [[self objectOrNilForKey:kLWSFavoriteListsItemsCount fromDictionary:dict] doubleValue];
    NSObject *receivedLWSItems = [dict objectForKey:kLWSFavoriteListsItems];
    NSMutableArray *parsedLWSItems = [NSMutableArray array];
    if ([receivedLWSItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedLWSItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedLWSItems addObject:[LWSItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedLWSItems isKindOfClass:[NSDictionary class]]) {
       [parsedLWSItems addObject:[LWSItems modelObjectWithDictionary:(NSDictionary *)receivedLWSItems]];
    }

    self.items = [NSArray arrayWithArray:parsedLWSItems];
            self.updatedAt = [[self objectOrNilForKey:kLWSFavoriteListsUpdatedAt fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kLWSFavoriteListsName fromDictionary:dict];
            self.publicProperty = [[self objectOrNilForKey:kLWSFavoriteListsPublic fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.favoriteListsIdentifier] forKey:kLWSFavoriteListsId];
    [mutableDict setValue:self.headImageUrl forKey:kLWSFavoriteListsHeadImageUrl];
    [mutableDict setValue:self.favoriteListsDescription forKey:kLWSFavoriteListsDescription];
    [mutableDict setValue:self.coverImageUrl forKey:kLWSFavoriteListsCoverImageUrl];
    [mutableDict setValue:[NSNumber numberWithBool:self.defaultFavoriteList] forKey:kLWSFavoriteListsDefaultFavoriteList];
    [mutableDict setValue:self.coverWebpUrl forKey:kLWSFavoriteListsCoverWebpUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdAt] forKey:kLWSFavoriteListsCreatedAt];
    [mutableDict setValue:self.url forKey:kLWSFavoriteListsUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userId] forKey:kLWSFavoriteListsUserId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemsCount] forKey:kLWSFavoriteListsItemsCount];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kLWSFavoriteListsItems];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updatedAt] forKey:kLWSFavoriteListsUpdatedAt];
    [mutableDict setValue:self.name forKey:kLWSFavoriteListsName];
    [mutableDict setValue:[NSNumber numberWithBool:self.publicProperty] forKey:kLWSFavoriteListsPublic];

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

    self.favoriteListsIdentifier = [aDecoder decodeDoubleForKey:kLWSFavoriteListsId];
    self.headImageUrl = [aDecoder decodeObjectForKey:kLWSFavoriteListsHeadImageUrl];
    self.favoriteListsDescription = [aDecoder decodeObjectForKey:kLWSFavoriteListsDescription];
    self.coverImageUrl = [aDecoder decodeObjectForKey:kLWSFavoriteListsCoverImageUrl];
    self.defaultFavoriteList = [aDecoder decodeBoolForKey:kLWSFavoriteListsDefaultFavoriteList];
    self.coverWebpUrl = [aDecoder decodeObjectForKey:kLWSFavoriteListsCoverWebpUrl];
    self.createdAt = [aDecoder decodeDoubleForKey:kLWSFavoriteListsCreatedAt];
    self.url = [aDecoder decodeObjectForKey:kLWSFavoriteListsUrl];
    self.userId = [aDecoder decodeDoubleForKey:kLWSFavoriteListsUserId];
    self.itemsCount = [aDecoder decodeDoubleForKey:kLWSFavoriteListsItemsCount];
    self.items = [aDecoder decodeObjectForKey:kLWSFavoriteListsItems];
    self.updatedAt = [aDecoder decodeDoubleForKey:kLWSFavoriteListsUpdatedAt];
    self.name = [aDecoder decodeObjectForKey:kLWSFavoriteListsName];
    self.publicProperty = [aDecoder decodeBoolForKey:kLWSFavoriteListsPublic];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_favoriteListsIdentifier forKey:kLWSFavoriteListsId];
    [aCoder encodeObject:_headImageUrl forKey:kLWSFavoriteListsHeadImageUrl];
    [aCoder encodeObject:_favoriteListsDescription forKey:kLWSFavoriteListsDescription];
    [aCoder encodeObject:_coverImageUrl forKey:kLWSFavoriteListsCoverImageUrl];
    [aCoder encodeBool:_defaultFavoriteList forKey:kLWSFavoriteListsDefaultFavoriteList];
    [aCoder encodeObject:_coverWebpUrl forKey:kLWSFavoriteListsCoverWebpUrl];
    [aCoder encodeDouble:_createdAt forKey:kLWSFavoriteListsCreatedAt];
    [aCoder encodeObject:_url forKey:kLWSFavoriteListsUrl];
    [aCoder encodeDouble:_userId forKey:kLWSFavoriteListsUserId];
    [aCoder encodeDouble:_itemsCount forKey:kLWSFavoriteListsItemsCount];
    [aCoder encodeObject:_items forKey:kLWSFavoriteListsItems];
    [aCoder encodeDouble:_updatedAt forKey:kLWSFavoriteListsUpdatedAt];
    [aCoder encodeObject:_name forKey:kLWSFavoriteListsName];
    [aCoder encodeBool:_publicProperty forKey:kLWSFavoriteListsPublic];
}

- (id)copyWithZone:(NSZone *)zone
{
    LWSFavoriteLists *copy = [[LWSFavoriteLists alloc] init];
    
    if (copy) {

        copy.favoriteListsIdentifier = self.favoriteListsIdentifier;
        copy.headImageUrl = [self.headImageUrl copyWithZone:zone];
        copy.favoriteListsDescription = [self.favoriteListsDescription copyWithZone:zone];
        copy.coverImageUrl = [self.coverImageUrl copyWithZone:zone];
        copy.defaultFavoriteList = self.defaultFavoriteList;
        copy.coverWebpUrl = [self.coverWebpUrl copyWithZone:zone];
        copy.createdAt = self.createdAt;
        copy.url = [self.url copyWithZone:zone];
        copy.userId = self.userId;
        copy.itemsCount = self.itemsCount;
        copy.items = [self.items copyWithZone:zone];
        copy.updatedAt = self.updatedAt;
        copy.name = [self.name copyWithZone:zone];
        copy.publicProperty = self.publicProperty;
    }
    
    return copy;
}


@end

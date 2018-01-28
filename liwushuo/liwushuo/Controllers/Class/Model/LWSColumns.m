//
//  LWSColumns.m
//
//  Created by  半夏 on 2017/12/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "LWSColumns.h"


NSString *const kLWSColumnsId = @"id";
NSString *const kLWSColumnsCategory = @"category";
NSString *const kLWSColumnsDescription = @"description";
NSString *const kLWSColumnsSubtitle = @"subtitle";
NSString *const kLWSColumnsCoverImageUrl = @"cover_image_url";
NSString *const kLWSColumnsAuthor = @"author";
NSString *const kLWSColumnsBannerImageUrl = @"banner_image_url";
NSString *const kLWSColumnsCoverWebpUrl = @"cover_webp_url";
NSString *const kLWSColumnsCreatedAt = @"created_at";
NSString *const kLWSColumnsBannerWebpUrl = @"banner_webp_url";
NSString *const kLWSColumnsTitle = @"title";
NSString *const kLWSColumnsPostPublishedAt = @"post_published_at";
NSString *const kLWSColumnsOrder = @"order";
NSString *const kLWSColumnsUpdatedAt = @"updated_at";
NSString *const kLWSColumnsStatus = @"status";


@interface LWSColumns ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LWSColumns

@synthesize columnsIdentifier = _columnsIdentifier;
@synthesize category = _category;
@synthesize columnsDescription = _columnsDescription;
@synthesize subtitle = _subtitle;
@synthesize coverImageUrl = _coverImageUrl;
@synthesize author = _author;
@synthesize bannerImageUrl = _bannerImageUrl;
@synthesize coverWebpUrl = _coverWebpUrl;
@synthesize createdAt = _createdAt;
@synthesize bannerWebpUrl = _bannerWebpUrl;
@synthesize title = _title;
@synthesize postPublishedAt = _postPublishedAt;
@synthesize order = _order;
@synthesize updatedAt = _updatedAt;
@synthesize status = _status;


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
            self.columnsIdentifier = [[self objectOrNilForKey:kLWSColumnsId fromDictionary:dict] doubleValue];
            self.category = [self objectOrNilForKey:kLWSColumnsCategory fromDictionary:dict];
            self.columnsDescription = [self objectOrNilForKey:kLWSColumnsDescription fromDictionary:dict];
            self.subtitle = [self objectOrNilForKey:kLWSColumnsSubtitle fromDictionary:dict];
            self.coverImageUrl = [self objectOrNilForKey:kLWSColumnsCoverImageUrl fromDictionary:dict];
            self.author = [self objectOrNilForKey:kLWSColumnsAuthor fromDictionary:dict];
            self.bannerImageUrl = [self objectOrNilForKey:kLWSColumnsBannerImageUrl fromDictionary:dict];
            self.coverWebpUrl = [self objectOrNilForKey:kLWSColumnsCoverWebpUrl fromDictionary:dict];
            self.createdAt = [[self objectOrNilForKey:kLWSColumnsCreatedAt fromDictionary:dict] doubleValue];
            self.bannerWebpUrl = [self objectOrNilForKey:kLWSColumnsBannerWebpUrl fromDictionary:dict];
            self.title = [self objectOrNilForKey:kLWSColumnsTitle fromDictionary:dict];
            self.postPublishedAt = [[self objectOrNilForKey:kLWSColumnsPostPublishedAt fromDictionary:dict] doubleValue];
            self.order = [[self objectOrNilForKey:kLWSColumnsOrder fromDictionary:dict] doubleValue];
            self.updatedAt = [[self objectOrNilForKey:kLWSColumnsUpdatedAt fromDictionary:dict] doubleValue];
            self.status = [[self objectOrNilForKey:kLWSColumnsStatus fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.columnsIdentifier] forKey:kLWSColumnsId];
    [mutableDict setValue:self.category forKey:kLWSColumnsCategory];
    [mutableDict setValue:self.columnsDescription forKey:kLWSColumnsDescription];
    [mutableDict setValue:self.subtitle forKey:kLWSColumnsSubtitle];
    [mutableDict setValue:self.coverImageUrl forKey:kLWSColumnsCoverImageUrl];
    [mutableDict setValue:self.author forKey:kLWSColumnsAuthor];
    [mutableDict setValue:self.bannerImageUrl forKey:kLWSColumnsBannerImageUrl];
    [mutableDict setValue:self.coverWebpUrl forKey:kLWSColumnsCoverWebpUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdAt] forKey:kLWSColumnsCreatedAt];
    [mutableDict setValue:self.bannerWebpUrl forKey:kLWSColumnsBannerWebpUrl];
    [mutableDict setValue:self.title forKey:kLWSColumnsTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.postPublishedAt] forKey:kLWSColumnsPostPublishedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.order] forKey:kLWSColumnsOrder];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updatedAt] forKey:kLWSColumnsUpdatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kLWSColumnsStatus];

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

    self.columnsIdentifier = [aDecoder decodeDoubleForKey:kLWSColumnsId];
    self.category = [aDecoder decodeObjectForKey:kLWSColumnsCategory];
    self.columnsDescription = [aDecoder decodeObjectForKey:kLWSColumnsDescription];
    self.subtitle = [aDecoder decodeObjectForKey:kLWSColumnsSubtitle];
    self.coverImageUrl = [aDecoder decodeObjectForKey:kLWSColumnsCoverImageUrl];
    self.author = [aDecoder decodeObjectForKey:kLWSColumnsAuthor];
    self.bannerImageUrl = [aDecoder decodeObjectForKey:kLWSColumnsBannerImageUrl];
    self.coverWebpUrl = [aDecoder decodeObjectForKey:kLWSColumnsCoverWebpUrl];
    self.createdAt = [aDecoder decodeDoubleForKey:kLWSColumnsCreatedAt];
    self.bannerWebpUrl = [aDecoder decodeObjectForKey:kLWSColumnsBannerWebpUrl];
    self.title = [aDecoder decodeObjectForKey:kLWSColumnsTitle];
    self.postPublishedAt = [aDecoder decodeDoubleForKey:kLWSColumnsPostPublishedAt];
    self.order = [aDecoder decodeDoubleForKey:kLWSColumnsOrder];
    self.updatedAt = [aDecoder decodeDoubleForKey:kLWSColumnsUpdatedAt];
    self.status = [aDecoder decodeDoubleForKey:kLWSColumnsStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_columnsIdentifier forKey:kLWSColumnsId];
    [aCoder encodeObject:_category forKey:kLWSColumnsCategory];
    [aCoder encodeObject:_columnsDescription forKey:kLWSColumnsDescription];
    [aCoder encodeObject:_subtitle forKey:kLWSColumnsSubtitle];
    [aCoder encodeObject:_coverImageUrl forKey:kLWSColumnsCoverImageUrl];
    [aCoder encodeObject:_author forKey:kLWSColumnsAuthor];
    [aCoder encodeObject:_bannerImageUrl forKey:kLWSColumnsBannerImageUrl];
    [aCoder encodeObject:_coverWebpUrl forKey:kLWSColumnsCoverWebpUrl];
    [aCoder encodeDouble:_createdAt forKey:kLWSColumnsCreatedAt];
    [aCoder encodeObject:_bannerWebpUrl forKey:kLWSColumnsBannerWebpUrl];
    [aCoder encodeObject:_title forKey:kLWSColumnsTitle];
    [aCoder encodeDouble:_postPublishedAt forKey:kLWSColumnsPostPublishedAt];
    [aCoder encodeDouble:_order forKey:kLWSColumnsOrder];
    [aCoder encodeDouble:_updatedAt forKey:kLWSColumnsUpdatedAt];
    [aCoder encodeDouble:_status forKey:kLWSColumnsStatus];
}

- (id)copyWithZone:(NSZone *)zone
{
    LWSColumns *copy = [[LWSColumns alloc] init];
    
    if (copy) {

        copy.columnsIdentifier = self.columnsIdentifier;
        copy.category = [self.category copyWithZone:zone];
        copy.columnsDescription = [self.columnsDescription copyWithZone:zone];
        copy.subtitle = [self.subtitle copyWithZone:zone];
        copy.coverImageUrl = [self.coverImageUrl copyWithZone:zone];
        copy.author = [self.author copyWithZone:zone];
        copy.bannerImageUrl = [self.bannerImageUrl copyWithZone:zone];
        copy.coverWebpUrl = [self.coverWebpUrl copyWithZone:zone];
        copy.createdAt = self.createdAt;
        copy.bannerWebpUrl = [self.bannerWebpUrl copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.postPublishedAt = self.postPublishedAt;
        copy.order = self.order;
        copy.updatedAt = self.updatedAt;
        copy.status = self.status;
    }
    
    return copy;
}


@end

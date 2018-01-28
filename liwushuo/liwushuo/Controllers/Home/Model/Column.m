//
//  Column.m
//
//  Created by  半夏 on 2017/12/11
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Column.h"


NSString *const kColumnId = @"id";
NSString *const kColumnCategory = @"category";
NSString *const kColumnDescription = @"description";
NSString *const kColumnSubtitle = @"subtitle";
NSString *const kColumnCoverImageUrl = @"cover_image_url";
NSString *const kColumnBannerImageUrl = @"banner_image_url";
NSString *const kColumnCreatedAt = @"created_at";
NSString *const kColumnTitle = @"title";
NSString *const kColumnPostPublishedAt = @"post_published_at";
NSString *const kColumnOrder = @"order";
NSString *const kColumnUpdatedAt = @"updated_at";
NSString *const kColumnStatus = @"status";


@interface Column ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Column

@synthesize columnIdentifier = _columnIdentifier;
@synthesize category = _category;
@synthesize columnDescription = _columnDescription;
@synthesize subtitle = _subtitle;
@synthesize coverImageUrl = _coverImageUrl;
@synthesize bannerImageUrl = _bannerImageUrl;
@synthesize createdAt = _createdAt;
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
            self.columnIdentifier = [[self objectOrNilForKey:kColumnId fromDictionary:dict] doubleValue];
            self.category = [self objectOrNilForKey:kColumnCategory fromDictionary:dict];
            self.columnDescription = [self objectOrNilForKey:kColumnDescription fromDictionary:dict];
            self.subtitle = [self objectOrNilForKey:kColumnSubtitle fromDictionary:dict];
            self.coverImageUrl = [self objectOrNilForKey:kColumnCoverImageUrl fromDictionary:dict];
            self.bannerImageUrl = [self objectOrNilForKey:kColumnBannerImageUrl fromDictionary:dict];
            self.createdAt = [[self objectOrNilForKey:kColumnCreatedAt fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kColumnTitle fromDictionary:dict];
            self.postPublishedAt = [[self objectOrNilForKey:kColumnPostPublishedAt fromDictionary:dict] doubleValue];
            self.order = [[self objectOrNilForKey:kColumnOrder fromDictionary:dict] doubleValue];
            self.updatedAt = [[self objectOrNilForKey:kColumnUpdatedAt fromDictionary:dict] doubleValue];
            self.status = [[self objectOrNilForKey:kColumnStatus fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.columnIdentifier] forKey:kColumnId];
    [mutableDict setValue:self.category forKey:kColumnCategory];
    [mutableDict setValue:self.columnDescription forKey:kColumnDescription];
    [mutableDict setValue:self.subtitle forKey:kColumnSubtitle];
    [mutableDict setValue:self.coverImageUrl forKey:kColumnCoverImageUrl];
    [mutableDict setValue:self.bannerImageUrl forKey:kColumnBannerImageUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdAt] forKey:kColumnCreatedAt];
    [mutableDict setValue:self.title forKey:kColumnTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.postPublishedAt] forKey:kColumnPostPublishedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.order] forKey:kColumnOrder];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updatedAt] forKey:kColumnUpdatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kColumnStatus];

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

    self.columnIdentifier = [aDecoder decodeDoubleForKey:kColumnId];
    self.category = [aDecoder decodeObjectForKey:kColumnCategory];
    self.columnDescription = [aDecoder decodeObjectForKey:kColumnDescription];
    self.subtitle = [aDecoder decodeObjectForKey:kColumnSubtitle];
    self.coverImageUrl = [aDecoder decodeObjectForKey:kColumnCoverImageUrl];
    self.bannerImageUrl = [aDecoder decodeObjectForKey:kColumnBannerImageUrl];
    self.createdAt = [aDecoder decodeDoubleForKey:kColumnCreatedAt];
    self.title = [aDecoder decodeObjectForKey:kColumnTitle];
    self.postPublishedAt = [aDecoder decodeDoubleForKey:kColumnPostPublishedAt];
    self.order = [aDecoder decodeDoubleForKey:kColumnOrder];
    self.updatedAt = [aDecoder decodeDoubleForKey:kColumnUpdatedAt];
    self.status = [aDecoder decodeDoubleForKey:kColumnStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_columnIdentifier forKey:kColumnId];
    [aCoder encodeObject:_category forKey:kColumnCategory];
    [aCoder encodeObject:_columnDescription forKey:kColumnDescription];
    [aCoder encodeObject:_subtitle forKey:kColumnSubtitle];
    [aCoder encodeObject:_coverImageUrl forKey:kColumnCoverImageUrl];
    [aCoder encodeObject:_bannerImageUrl forKey:kColumnBannerImageUrl];
    [aCoder encodeDouble:_createdAt forKey:kColumnCreatedAt];
    [aCoder encodeObject:_title forKey:kColumnTitle];
    [aCoder encodeDouble:_postPublishedAt forKey:kColumnPostPublishedAt];
    [aCoder encodeDouble:_order forKey:kColumnOrder];
    [aCoder encodeDouble:_updatedAt forKey:kColumnUpdatedAt];
    [aCoder encodeDouble:_status forKey:kColumnStatus];
}

- (id)copyWithZone:(NSZone *)zone
{
    Column *copy = [[Column alloc] init];
    
    if (copy) {

        copy.columnIdentifier = self.columnIdentifier;
        copy.category = [self.category copyWithZone:zone];
        copy.columnDescription = [self.columnDescription copyWithZone:zone];
        copy.subtitle = [self.subtitle copyWithZone:zone];
        copy.coverImageUrl = [self.coverImageUrl copyWithZone:zone];
        copy.bannerImageUrl = [self.bannerImageUrl copyWithZone:zone];
        copy.createdAt = self.createdAt;
        copy.title = [self.title copyWithZone:zone];
        copy.postPublishedAt = self.postPublishedAt;
        copy.order = self.order;
        copy.updatedAt = self.updatedAt;
        copy.status = self.status;
    }
    
    return copy;
}


@end

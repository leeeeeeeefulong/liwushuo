//
//  LWSDetailDataColumn.m
//
//  Created by  半夏 on 2018/1/3
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "LWSDetailDataColumn.h"


NSString *const kLWSDetailDataColumnId = @"id";
NSString *const kLWSDetailDataColumnCategory = @"category";
NSString *const kLWSDetailDataColumnDescription = @"description";
NSString *const kLWSDetailDataColumnSubtitle = @"subtitle";
NSString *const kLWSDetailDataColumnCoverImageUrl = @"cover_image_url";
NSString *const kLWSDetailDataColumnBannerImageUrl = @"banner_image_url";
NSString *const kLWSDetailDataColumnCreatedAt = @"created_at";
NSString *const kLWSDetailDataColumnTitle = @"title";
NSString *const kLWSDetailDataColumnPostPublishedAt = @"post_published_at";
NSString *const kLWSDetailDataColumnOrder = @"order";
NSString *const kLWSDetailDataColumnUpdatedAt = @"updated_at";
NSString *const kLWSDetailDataColumnStatus = @"status";


@interface LWSDetailDataColumn ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LWSDetailDataColumn

@synthesize detailDataColumnIdentifier = _detailDataColumnIdentifier;
@synthesize category = _category;
@synthesize detailDataColumnDescription = _detailDataColumnDescription;
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
            self.detailDataColumnIdentifier = [[self objectOrNilForKey:kLWSDetailDataColumnId fromDictionary:dict] doubleValue];
            self.category = [self objectOrNilForKey:kLWSDetailDataColumnCategory fromDictionary:dict];
            self.detailDataColumnDescription = [self objectOrNilForKey:kLWSDetailDataColumnDescription fromDictionary:dict];
            self.subtitle = [self objectOrNilForKey:kLWSDetailDataColumnSubtitle fromDictionary:dict];
            self.coverImageUrl = [self objectOrNilForKey:kLWSDetailDataColumnCoverImageUrl fromDictionary:dict];
            self.bannerImageUrl = [self objectOrNilForKey:kLWSDetailDataColumnBannerImageUrl fromDictionary:dict];
            self.createdAt = [[self objectOrNilForKey:kLWSDetailDataColumnCreatedAt fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kLWSDetailDataColumnTitle fromDictionary:dict];
            self.postPublishedAt = [[self objectOrNilForKey:kLWSDetailDataColumnPostPublishedAt fromDictionary:dict] doubleValue];
            self.order = [[self objectOrNilForKey:kLWSDetailDataColumnOrder fromDictionary:dict] doubleValue];
            self.updatedAt = [[self objectOrNilForKey:kLWSDetailDataColumnUpdatedAt fromDictionary:dict] doubleValue];
            self.status = [[self objectOrNilForKey:kLWSDetailDataColumnStatus fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.detailDataColumnIdentifier] forKey:kLWSDetailDataColumnId];
    [mutableDict setValue:self.category forKey:kLWSDetailDataColumnCategory];
    [mutableDict setValue:self.detailDataColumnDescription forKey:kLWSDetailDataColumnDescription];
    [mutableDict setValue:self.subtitle forKey:kLWSDetailDataColumnSubtitle];
    [mutableDict setValue:self.coverImageUrl forKey:kLWSDetailDataColumnCoverImageUrl];
    [mutableDict setValue:self.bannerImageUrl forKey:kLWSDetailDataColumnBannerImageUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdAt] forKey:kLWSDetailDataColumnCreatedAt];
    [mutableDict setValue:self.title forKey:kLWSDetailDataColumnTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.postPublishedAt] forKey:kLWSDetailDataColumnPostPublishedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.order] forKey:kLWSDetailDataColumnOrder];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updatedAt] forKey:kLWSDetailDataColumnUpdatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kLWSDetailDataColumnStatus];

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

    self.detailDataColumnIdentifier = [aDecoder decodeDoubleForKey:kLWSDetailDataColumnId];
    self.category = [aDecoder decodeObjectForKey:kLWSDetailDataColumnCategory];
    self.detailDataColumnDescription = [aDecoder decodeObjectForKey:kLWSDetailDataColumnDescription];
    self.subtitle = [aDecoder decodeObjectForKey:kLWSDetailDataColumnSubtitle];
    self.coverImageUrl = [aDecoder decodeObjectForKey:kLWSDetailDataColumnCoverImageUrl];
    self.bannerImageUrl = [aDecoder decodeObjectForKey:kLWSDetailDataColumnBannerImageUrl];
    self.createdAt = [aDecoder decodeDoubleForKey:kLWSDetailDataColumnCreatedAt];
    self.title = [aDecoder decodeObjectForKey:kLWSDetailDataColumnTitle];
    self.postPublishedAt = [aDecoder decodeDoubleForKey:kLWSDetailDataColumnPostPublishedAt];
    self.order = [aDecoder decodeDoubleForKey:kLWSDetailDataColumnOrder];
    self.updatedAt = [aDecoder decodeDoubleForKey:kLWSDetailDataColumnUpdatedAt];
    self.status = [aDecoder decodeDoubleForKey:kLWSDetailDataColumnStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_detailDataColumnIdentifier forKey:kLWSDetailDataColumnId];
    [aCoder encodeObject:_category forKey:kLWSDetailDataColumnCategory];
    [aCoder encodeObject:_detailDataColumnDescription forKey:kLWSDetailDataColumnDescription];
    [aCoder encodeObject:_subtitle forKey:kLWSDetailDataColumnSubtitle];
    [aCoder encodeObject:_coverImageUrl forKey:kLWSDetailDataColumnCoverImageUrl];
    [aCoder encodeObject:_bannerImageUrl forKey:kLWSDetailDataColumnBannerImageUrl];
    [aCoder encodeDouble:_createdAt forKey:kLWSDetailDataColumnCreatedAt];
    [aCoder encodeObject:_title forKey:kLWSDetailDataColumnTitle];
    [aCoder encodeDouble:_postPublishedAt forKey:kLWSDetailDataColumnPostPublishedAt];
    [aCoder encodeDouble:_order forKey:kLWSDetailDataColumnOrder];
    [aCoder encodeDouble:_updatedAt forKey:kLWSDetailDataColumnUpdatedAt];
    [aCoder encodeDouble:_status forKey:kLWSDetailDataColumnStatus];
}

- (id)copyWithZone:(NSZone *)zone
{
    LWSDetailDataColumn *copy = [[LWSDetailDataColumn alloc] init];
    
    if (copy) {

        copy.detailDataColumnIdentifier = self.detailDataColumnIdentifier;
        copy.category = [self.category copyWithZone:zone];
        copy.detailDataColumnDescription = [self.detailDataColumnDescription copyWithZone:zone];
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

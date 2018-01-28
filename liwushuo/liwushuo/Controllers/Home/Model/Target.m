//
//  Target.m
//
//  Created by  半夏 on 2017/12/13
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Target.h"


NSString *const kTargetStatus = @"status";
NSString *const kTargetBannerImageUrl = @"banner_image_url";
NSString *const kTargetCoverWebpUrl = @"cover_webp_url";
NSString *const kTargetId = @"id";
NSString *const kTargetSubtitle = @"subtitle";
NSString *const kTargetTitle = @"title";
NSString *const kTargetCreatedAt = @"created_at";
NSString *const kTargetPostsCount = @"posts_count";
NSString *const kTargetCoverImageUrl = @"cover_image_url";
NSString *const kTargetUpdatedAt = @"updated_at";
NSString *const kTargetBannerWebpUrl = @"banner_webp_url";


@interface Target ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Target

@synthesize status = _status;
@synthesize bannerImageUrl = _bannerImageUrl;
@synthesize coverWebpUrl = _coverWebpUrl;
@synthesize targetIdentifier = _targetIdentifier;
@synthesize subtitle = _subtitle;
@synthesize title = _title;
@synthesize createdAt = _createdAt;
@synthesize postsCount = _postsCount;
@synthesize coverImageUrl = _coverImageUrl;
@synthesize updatedAt = _updatedAt;
@synthesize bannerWebpUrl = _bannerWebpUrl;


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
            self.status = [[self objectOrNilForKey:kTargetStatus fromDictionary:dict] doubleValue];
            self.bannerImageUrl = [self objectOrNilForKey:kTargetBannerImageUrl fromDictionary:dict];
            self.coverWebpUrl = [self objectOrNilForKey:kTargetCoverWebpUrl fromDictionary:dict];
            self.targetIdentifier = [[self objectOrNilForKey:kTargetId fromDictionary:dict] doubleValue];
            self.subtitle = [self objectOrNilForKey:kTargetSubtitle fromDictionary:dict];
            self.title = [self objectOrNilForKey:kTargetTitle fromDictionary:dict];
            self.createdAt = [[self objectOrNilForKey:kTargetCreatedAt fromDictionary:dict] doubleValue];
            self.postsCount = [[self objectOrNilForKey:kTargetPostsCount fromDictionary:dict] doubleValue];
            self.coverImageUrl = [self objectOrNilForKey:kTargetCoverImageUrl fromDictionary:dict];
            self.updatedAt = [[self objectOrNilForKey:kTargetUpdatedAt fromDictionary:dict] doubleValue];
            self.bannerWebpUrl = [self objectOrNilForKey:kTargetBannerWebpUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kTargetStatus];
    [mutableDict setValue:self.bannerImageUrl forKey:kTargetBannerImageUrl];
    [mutableDict setValue:self.coverWebpUrl forKey:kTargetCoverWebpUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.targetIdentifier] forKey:kTargetId];
    [mutableDict setValue:self.subtitle forKey:kTargetSubtitle];
    [mutableDict setValue:self.title forKey:kTargetTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdAt] forKey:kTargetCreatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.postsCount] forKey:kTargetPostsCount];
    [mutableDict setValue:self.coverImageUrl forKey:kTargetCoverImageUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updatedAt] forKey:kTargetUpdatedAt];
    [mutableDict setValue:self.bannerWebpUrl forKey:kTargetBannerWebpUrl];

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

    self.status = [aDecoder decodeDoubleForKey:kTargetStatus];
    self.bannerImageUrl = [aDecoder decodeObjectForKey:kTargetBannerImageUrl];
    self.coverWebpUrl = [aDecoder decodeObjectForKey:kTargetCoverWebpUrl];
    self.targetIdentifier = [aDecoder decodeDoubleForKey:kTargetId];
    self.subtitle = [aDecoder decodeObjectForKey:kTargetSubtitle];
    self.title = [aDecoder decodeObjectForKey:kTargetTitle];
    self.createdAt = [aDecoder decodeDoubleForKey:kTargetCreatedAt];
    self.postsCount = [aDecoder decodeDoubleForKey:kTargetPostsCount];
    self.coverImageUrl = [aDecoder decodeObjectForKey:kTargetCoverImageUrl];
    self.updatedAt = [aDecoder decodeDoubleForKey:kTargetUpdatedAt];
    self.bannerWebpUrl = [aDecoder decodeObjectForKey:kTargetBannerWebpUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_status forKey:kTargetStatus];
    [aCoder encodeObject:_bannerImageUrl forKey:kTargetBannerImageUrl];
    [aCoder encodeObject:_coverWebpUrl forKey:kTargetCoverWebpUrl];
    [aCoder encodeDouble:_targetIdentifier forKey:kTargetId];
    [aCoder encodeObject:_subtitle forKey:kTargetSubtitle];
    [aCoder encodeObject:_title forKey:kTargetTitle];
    [aCoder encodeDouble:_createdAt forKey:kTargetCreatedAt];
    [aCoder encodeDouble:_postsCount forKey:kTargetPostsCount];
    [aCoder encodeObject:_coverImageUrl forKey:kTargetCoverImageUrl];
    [aCoder encodeDouble:_updatedAt forKey:kTargetUpdatedAt];
    [aCoder encodeObject:_bannerWebpUrl forKey:kTargetBannerWebpUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    Target *copy = [[Target alloc] init];
    
    if (copy) {

        copy.status = self.status;
        copy.bannerImageUrl = [self.bannerImageUrl copyWithZone:zone];
        copy.coverWebpUrl = [self.coverWebpUrl copyWithZone:zone];
        copy.targetIdentifier = self.targetIdentifier;
        copy.subtitle = [self.subtitle copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.createdAt = self.createdAt;
        copy.postsCount = self.postsCount;
        copy.coverImageUrl = [self.coverImageUrl copyWithZone:zone];
        copy.updatedAt = self.updatedAt;
        copy.bannerWebpUrl = [self.bannerWebpUrl copyWithZone:zone];
    }
    
    return copy;
}


@end

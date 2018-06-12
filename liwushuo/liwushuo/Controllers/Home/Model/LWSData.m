//
//  LWSData.m
//
//  Created by  半夏 on 2017/12/29
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "LWSData.h"
#import "LWSPosts.h"
#import "LWSPaging.h"


NSString *const kLWSDataId = @"id";
NSString *const kLWSDataCoverImageUrl = @"cover_image_url";
NSString *const kLWSDataPostsCount = @"posts_count";
NSString *const kDataDescription = @"description";
NSString *const kLWSDataBannerWebpUrl = @"banner_webp_url";
NSString *const kLWSDataSubtitle = @"subtitle";
NSString *const kLWSDataCoverWebpUrl = @"cover_webp_url";
NSString *const kLWSDataBannerImageUrl = @"banner_image_url";
NSString *const kLWSDataCreatedAt = @"created_at";
NSString *const kLWSDataPosts = @"posts";
NSString *const kLWSDataUrl = @"url";
NSString *const kLWSDataTitle = @"title";
NSString *const kLWSDataUpdatedAt = @"updated_at";
NSString *const kLWSPaging = @"paging";
NSString *const kLWSDataStatus = @"status";
NSString *const kLWSDataLikesCount = @"likes_count";

@interface LWSData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LWSData

@synthesize dataIdentifier = _dataIdentifier;
@synthesize coverImageUrl = _coverImageUrl;
@synthesize dataDescription = _dataDescription;
@synthesize postsCount = _postsCount;
@synthesize bannerWebpUrl = _bannerWebpUrl;
@synthesize subtitle = _subtitle;
@synthesize coverWebpUrl = _coverWebpUrl;
@synthesize bannerImageUrl = _bannerImageUrl;
@synthesize createdAt = _createdAt;
@synthesize posts = _posts;
@synthesize url = _url;
@synthesize title = _title;
@synthesize updatedAt = _updatedAt;
@synthesize paging = _paging;
@synthesize status = _status;
@synthesize likesCount = _likesCount;


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
            self.dataIdentifier = [[self objectOrNilForKey:kLWSDataId fromDictionary:dict] doubleValue];
            self.coverImageUrl = [self objectOrNilForKey:kLWSDataCoverImageUrl fromDictionary:dict];
            self.dataDescription = [self objectOrNilForKey:kDataDescription fromDictionary:dict];
            self.postsCount = [[self objectOrNilForKey:kLWSDataPostsCount fromDictionary:dict] doubleValue];
            self.likesCount = [[self objectOrNilForKey:kLWSDataLikesCount fromDictionary:dict] doubleValue];
            self.bannerWebpUrl = [self objectOrNilForKey:kLWSDataBannerWebpUrl fromDictionary:dict];
            self.subtitle = [self objectOrNilForKey:kLWSDataSubtitle fromDictionary:dict];
            self.coverWebpUrl = [self objectOrNilForKey:kLWSDataCoverWebpUrl fromDictionary:dict];
            self.bannerImageUrl = [self objectOrNilForKey:kLWSDataBannerImageUrl fromDictionary:dict];
            self.createdAt = [[self objectOrNilForKey:kLWSDataCreatedAt fromDictionary:dict] doubleValue];
    NSObject *receivedLWSPosts = [dict objectForKey:kLWSDataPosts];
    NSMutableArray *parsedLWSPosts = [NSMutableArray array];
    if ([receivedLWSPosts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedLWSPosts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedLWSPosts addObject:[LWSPosts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedLWSPosts isKindOfClass:[NSDictionary class]]) {
       [parsedLWSPosts addObject:[LWSPosts modelObjectWithDictionary:(NSDictionary *)receivedLWSPosts]];
    }

    self.posts = [NSArray arrayWithArray:parsedLWSPosts];
            self.url = [self objectOrNilForKey:kLWSDataUrl fromDictionary:dict];
            self.title = [self objectOrNilForKey:kLWSDataTitle fromDictionary:dict];
            self.updatedAt = [[self objectOrNilForKey:kLWSDataUpdatedAt fromDictionary:dict] doubleValue];
            self.paging = [LWSPaging modelObjectWithDictionary:[dict objectForKey:kLWSPaging]];
            self.status = [[self objectOrNilForKey:kLWSDataStatus fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataIdentifier] forKey:kLWSDataId];
    [mutableDict setValue:self.coverImageUrl forKey:kLWSDataCoverImageUrl];
    [mutableDict setValue:self.dataDescription forKey:kDataDescription];
    [mutableDict setValue:[NSNumber numberWithDouble:self.postsCount] forKey:kLWSDataPostsCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likesCount] forKey:kLWSDataLikesCount];
    [mutableDict setValue:self.bannerWebpUrl forKey:kLWSDataBannerWebpUrl];
    [mutableDict setValue:self.subtitle forKey:kLWSDataSubtitle];
    [mutableDict setValue:self.coverWebpUrl forKey:kLWSDataCoverWebpUrl];
    [mutableDict setValue:self.bannerImageUrl forKey:kLWSDataBannerImageUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdAt] forKey:kLWSDataCreatedAt];
    NSMutableArray *tempArrayForPosts = [NSMutableArray array];
    for (NSObject *subArrayObject in self.posts) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPosts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPosts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPosts] forKey:kLWSDataPosts];
    [mutableDict setValue:self.url forKey:kLWSDataUrl];
    [mutableDict setValue:self.title forKey:kLWSDataTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updatedAt] forKey:kLWSDataUpdatedAt];
    [mutableDict setValue:[self.paging dictionaryRepresentation] forKey:kLWSPaging];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kLWSDataStatus];

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

    self.dataIdentifier = [aDecoder decodeDoubleForKey:kLWSDataId];
    self.coverImageUrl = [aDecoder decodeObjectForKey:kLWSDataCoverImageUrl];
    self.postsCount = [aDecoder decodeDoubleForKey:kLWSDataPostsCount];
    self.dataDescription = [aDecoder decodeObjectForKey:kDataDescription];
    self.bannerWebpUrl = [aDecoder decodeObjectForKey:kLWSDataBannerWebpUrl];
    self.subtitle = [aDecoder decodeObjectForKey:kLWSDataSubtitle];
    self.coverWebpUrl = [aDecoder decodeObjectForKey:kLWSDataCoverWebpUrl];
    self.bannerImageUrl = [aDecoder decodeObjectForKey:kLWSDataBannerImageUrl];
    self.createdAt = [aDecoder decodeDoubleForKey:kLWSDataCreatedAt];
    self.posts = [aDecoder decodeObjectForKey:kLWSDataPosts];
    self.url = [aDecoder decodeObjectForKey:kLWSDataUrl];
    self.title = [aDecoder decodeObjectForKey:kLWSDataTitle];
    self.updatedAt = [aDecoder decodeDoubleForKey:kLWSDataUpdatedAt];
    self.paging = [aDecoder decodeObjectForKey:kLWSPaging];
    self.status = [aDecoder decodeDoubleForKey:kLWSDataStatus];
    self.likesCount = [aDecoder decodeDoubleForKey:kLWSDataLikesCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_dataIdentifier forKey:kLWSDataId];
    [aCoder encodeObject:_coverImageUrl forKey:kLWSDataCoverImageUrl];
    [aCoder encodeDouble:_postsCount forKey:kLWSDataPostsCount];
    [aCoder encodeObject:_dataDescription forKey:kDataDescription];
    [aCoder encodeDouble:_likesCount forKey:kLWSDataLikesCount];
    [aCoder encodeObject:_bannerWebpUrl forKey:kLWSDataBannerWebpUrl];
    [aCoder encodeObject:_subtitle forKey:kLWSDataSubtitle];
    [aCoder encodeObject:_coverWebpUrl forKey:kLWSDataCoverWebpUrl];
    [aCoder encodeObject:_bannerImageUrl forKey:kLWSDataBannerImageUrl];
    [aCoder encodeDouble:_createdAt forKey:kLWSDataCreatedAt];
    [aCoder encodeObject:_posts forKey:kLWSDataPosts];
    [aCoder encodeObject:_url forKey:kLWSDataUrl];
    [aCoder encodeObject:_title forKey:kLWSDataTitle];
    [aCoder encodeDouble:_updatedAt forKey:kLWSDataUpdatedAt];
    [aCoder encodeObject:_paging forKey:kLWSPaging];
    [aCoder encodeDouble:_status forKey:kLWSDataStatus];
}

- (id)copyWithZone:(NSZone *)zone
{
    LWSData *copy = [[LWSData alloc] init];
    
    if (copy) {

        copy.dataIdentifier = self.dataIdentifier;
        copy.coverImageUrl = [self.coverImageUrl copyWithZone:zone];
        copy.postsCount = self.postsCount;
        copy.dataDescription = [self.dataDescription copyWithZone:zone];
        copy.bannerWebpUrl = [self.bannerWebpUrl copyWithZone:zone];
        copy.subtitle = [self.subtitle copyWithZone:zone];
        copy.coverWebpUrl = [self.coverWebpUrl copyWithZone:zone];
        copy.bannerImageUrl = [self.bannerImageUrl copyWithZone:zone];
        copy.createdAt = self.createdAt;
        copy.posts = [self.posts copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.updatedAt = self.updatedAt;
        copy.paging = [self.paging copyWithZone:zone];
        copy.status = self.status;
        copy.likesCount = self.likesCount;
    }
    
    return copy;
}


@end

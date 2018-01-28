//
//  LWSRecommendPosts.m
//
//  Created by  半夏 on 2018/1/8
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "LWSRecommendPosts.h"


NSString *const kLWSRecommendPostsMediaType = @"media_type";
NSString *const kLWSRecommendPostsStatus = @"status";
NSString *const kLWSRecommendPostsTitle = @"title";
NSString *const kLWSRecommendPostsEditorId = @"editor_id";
NSString *const kLWSRecommendPostsUrl = @"url";
NSString *const kLWSRecommendPostsAdMonitors = @"ad_monitors";
NSString *const kLWSRecommendPostsPublishedAt = @"published_at";
NSString *const kLWSRecommendPostsUpdatedAt = @"updated_at";
NSString *const kLWSRecommendPostsLimitEndAt = @"limit_end_at";
NSString *const kLWSRecommendPostsTemplate = @"template";
NSString *const kLWSRecommendPostsApprovedAt = @"approved_at";
NSString *const kLWSRecommendPostsFeatureList = @"feature_list";
NSString *const kLWSRecommendPostsLabelIds = @"label_ids";
NSString *const kLWSRecommendPostsId = @"id";
NSString *const kLWSRecommendPostsContentType = @"content_type";
NSString *const kLWSRecommendPostsContentUrl = @"content_url";
NSString *const kLWSRecommendPostsShareMsg = @"share_msg";
NSString *const kLWSRecommendPostsLikesCount = @"likes_count";
NSString *const kLWSRecommendPostsIntroduction = @"introduction";
NSString *const kLWSRecommendPostsCreatedAt = @"created_at";
NSString *const kLWSRecommendPostsShortTitle = @"short_title";
NSString *const kLWSRecommendPostsCoverWebpUrl = @"cover_webp_url";
NSString *const kLWSRecommendPostsCoverImageUrl = @"cover_image_url";


@interface LWSRecommendPosts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LWSRecommendPosts

@synthesize mediaType = _mediaType;
@synthesize status = _status;
@synthesize title = _title;
@synthesize editorId = _editorId;
@synthesize url = _url;
@synthesize adMonitors = _adMonitors;
@synthesize publishedAt = _publishedAt;
@synthesize updatedAt = _updatedAt;
@synthesize limitEndAt = _limitEndAt;
@synthesize template = _template;
@synthesize approvedAt = _approvedAt;
@synthesize featureList = _featureList;
@synthesize labelIds = _labelIds;
@synthesize recommendPostsIdentifier = _recommendPostsIdentifier;
@synthesize contentType = _contentType;
@synthesize contentUrl = _contentUrl;
@synthesize shareMsg = _shareMsg;
@synthesize likesCount = _likesCount;
@synthesize introduction = _introduction;
@synthesize createdAt = _createdAt;
@synthesize shortTitle = _shortTitle;
@synthesize coverWebpUrl = _coverWebpUrl;
@synthesize coverImageUrl = _coverImageUrl;


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
            self.mediaType = [[self objectOrNilForKey:kLWSRecommendPostsMediaType fromDictionary:dict] doubleValue];
            self.status = [[self objectOrNilForKey:kLWSRecommendPostsStatus fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kLWSRecommendPostsTitle fromDictionary:dict];
            self.editorId = [[self objectOrNilForKey:kLWSRecommendPostsEditorId fromDictionary:dict] doubleValue];
            self.url = [self objectOrNilForKey:kLWSRecommendPostsUrl fromDictionary:dict];
            self.adMonitors = [self objectOrNilForKey:kLWSRecommendPostsAdMonitors fromDictionary:dict];
            self.publishedAt = [[self objectOrNilForKey:kLWSRecommendPostsPublishedAt fromDictionary:dict] doubleValue];
            self.updatedAt = [[self objectOrNilForKey:kLWSRecommendPostsUpdatedAt fromDictionary:dict] doubleValue];
            self.limitEndAt = [self objectOrNilForKey:kLWSRecommendPostsLimitEndAt fromDictionary:dict];
            self.template = [self objectOrNilForKey:kLWSRecommendPostsTemplate fromDictionary:dict];
            self.approvedAt = [self objectOrNilForKey:kLWSRecommendPostsApprovedAt fromDictionary:dict];
            self.featureList = [self objectOrNilForKey:kLWSRecommendPostsFeatureList fromDictionary:dict];
            self.labelIds = [self objectOrNilForKey:kLWSRecommendPostsLabelIds fromDictionary:dict];
            self.recommendPostsIdentifier = [[self objectOrNilForKey:kLWSRecommendPostsId fromDictionary:dict] doubleValue];
            self.contentType = [[self objectOrNilForKey:kLWSRecommendPostsContentType fromDictionary:dict] doubleValue];
            self.contentUrl = [self objectOrNilForKey:kLWSRecommendPostsContentUrl fromDictionary:dict];
            self.shareMsg = [self objectOrNilForKey:kLWSRecommendPostsShareMsg fromDictionary:dict];
            self.likesCount = [[self objectOrNilForKey:kLWSRecommendPostsLikesCount fromDictionary:dict] doubleValue];
            self.introduction = [self objectOrNilForKey:kLWSRecommendPostsIntroduction fromDictionary:dict];
            self.createdAt = [[self objectOrNilForKey:kLWSRecommendPostsCreatedAt fromDictionary:dict] doubleValue];
            self.shortTitle = [self objectOrNilForKey:kLWSRecommendPostsShortTitle fromDictionary:dict];
            self.coverWebpUrl = [self objectOrNilForKey:kLWSRecommendPostsCoverWebpUrl fromDictionary:dict];
            self.coverImageUrl = [self objectOrNilForKey:kLWSRecommendPostsCoverImageUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mediaType] forKey:kLWSRecommendPostsMediaType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kLWSRecommendPostsStatus];
    [mutableDict setValue:self.title forKey:kLWSRecommendPostsTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.editorId] forKey:kLWSRecommendPostsEditorId];
    [mutableDict setValue:self.url forKey:kLWSRecommendPostsUrl];
    [mutableDict setValue:self.adMonitors forKey:kLWSRecommendPostsAdMonitors];
    [mutableDict setValue:[NSNumber numberWithDouble:self.publishedAt] forKey:kLWSRecommendPostsPublishedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updatedAt] forKey:kLWSRecommendPostsUpdatedAt];
    [mutableDict setValue:self.limitEndAt forKey:kLWSRecommendPostsLimitEndAt];
    [mutableDict setValue:self.template forKey:kLWSRecommendPostsTemplate];
    [mutableDict setValue:self.approvedAt forKey:kLWSRecommendPostsApprovedAt];
    NSMutableArray *tempArrayForFeatureList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.featureList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForFeatureList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForFeatureList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForFeatureList] forKey:kLWSRecommendPostsFeatureList];
    NSMutableArray *tempArrayForLabelIds = [NSMutableArray array];
    for (NSObject *subArrayObject in self.labelIds) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForLabelIds addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForLabelIds addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLabelIds] forKey:kLWSRecommendPostsLabelIds];
    [mutableDict setValue:[NSNumber numberWithDouble:self.recommendPostsIdentifier] forKey:kLWSRecommendPostsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.contentType] forKey:kLWSRecommendPostsContentType];
    [mutableDict setValue:self.contentUrl forKey:kLWSRecommendPostsContentUrl];
    [mutableDict setValue:self.shareMsg forKey:kLWSRecommendPostsShareMsg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likesCount] forKey:kLWSRecommendPostsLikesCount];
    [mutableDict setValue:self.introduction forKey:kLWSRecommendPostsIntroduction];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdAt] forKey:kLWSRecommendPostsCreatedAt];
    [mutableDict setValue:self.shortTitle forKey:kLWSRecommendPostsShortTitle];
    [mutableDict setValue:self.coverWebpUrl forKey:kLWSRecommendPostsCoverWebpUrl];
    [mutableDict setValue:self.coverImageUrl forKey:kLWSRecommendPostsCoverImageUrl];

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

    self.mediaType = [aDecoder decodeDoubleForKey:kLWSRecommendPostsMediaType];
    self.status = [aDecoder decodeDoubleForKey:kLWSRecommendPostsStatus];
    self.title = [aDecoder decodeObjectForKey:kLWSRecommendPostsTitle];
    self.editorId = [aDecoder decodeDoubleForKey:kLWSRecommendPostsEditorId];
    self.url = [aDecoder decodeObjectForKey:kLWSRecommendPostsUrl];
    self.adMonitors = [aDecoder decodeObjectForKey:kLWSRecommendPostsAdMonitors];
    self.publishedAt = [aDecoder decodeDoubleForKey:kLWSRecommendPostsPublishedAt];
    self.updatedAt = [aDecoder decodeDoubleForKey:kLWSRecommendPostsUpdatedAt];
    self.limitEndAt = [aDecoder decodeObjectForKey:kLWSRecommendPostsLimitEndAt];
    self.template = [aDecoder decodeObjectForKey:kLWSRecommendPostsTemplate];
    self.approvedAt = [aDecoder decodeObjectForKey:kLWSRecommendPostsApprovedAt];
    self.featureList = [aDecoder decodeObjectForKey:kLWSRecommendPostsFeatureList];
    self.labelIds = [aDecoder decodeObjectForKey:kLWSRecommendPostsLabelIds];
    self.recommendPostsIdentifier = [aDecoder decodeDoubleForKey:kLWSRecommendPostsId];
    self.contentType = [aDecoder decodeDoubleForKey:kLWSRecommendPostsContentType];
    self.contentUrl = [aDecoder decodeObjectForKey:kLWSRecommendPostsContentUrl];
    self.shareMsg = [aDecoder decodeObjectForKey:kLWSRecommendPostsShareMsg];
    self.likesCount = [aDecoder decodeDoubleForKey:kLWSRecommendPostsLikesCount];
    self.introduction = [aDecoder decodeObjectForKey:kLWSRecommendPostsIntroduction];
    self.createdAt = [aDecoder decodeDoubleForKey:kLWSRecommendPostsCreatedAt];
    self.shortTitle = [aDecoder decodeObjectForKey:kLWSRecommendPostsShortTitle];
    self.coverWebpUrl = [aDecoder decodeObjectForKey:kLWSRecommendPostsCoverWebpUrl];
    self.coverImageUrl = [aDecoder decodeObjectForKey:kLWSRecommendPostsCoverImageUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_mediaType forKey:kLWSRecommendPostsMediaType];
    [aCoder encodeDouble:_status forKey:kLWSRecommendPostsStatus];
    [aCoder encodeObject:_title forKey:kLWSRecommendPostsTitle];
    [aCoder encodeDouble:_editorId forKey:kLWSRecommendPostsEditorId];
    [aCoder encodeObject:_url forKey:kLWSRecommendPostsUrl];
    [aCoder encodeObject:_adMonitors forKey:kLWSRecommendPostsAdMonitors];
    [aCoder encodeDouble:_publishedAt forKey:kLWSRecommendPostsPublishedAt];
    [aCoder encodeDouble:_updatedAt forKey:kLWSRecommendPostsUpdatedAt];
    [aCoder encodeObject:_limitEndAt forKey:kLWSRecommendPostsLimitEndAt];
    [aCoder encodeObject:_template forKey:kLWSRecommendPostsTemplate];
    [aCoder encodeObject:_approvedAt forKey:kLWSRecommendPostsApprovedAt];
    [aCoder encodeObject:_featureList forKey:kLWSRecommendPostsFeatureList];
    [aCoder encodeObject:_labelIds forKey:kLWSRecommendPostsLabelIds];
    [aCoder encodeDouble:_recommendPostsIdentifier forKey:kLWSRecommendPostsId];
    [aCoder encodeDouble:_contentType forKey:kLWSRecommendPostsContentType];
    [aCoder encodeObject:_contentUrl forKey:kLWSRecommendPostsContentUrl];
    [aCoder encodeObject:_shareMsg forKey:kLWSRecommendPostsShareMsg];
    [aCoder encodeDouble:_likesCount forKey:kLWSRecommendPostsLikesCount];
    [aCoder encodeObject:_introduction forKey:kLWSRecommendPostsIntroduction];
    [aCoder encodeDouble:_createdAt forKey:kLWSRecommendPostsCreatedAt];
    [aCoder encodeObject:_shortTitle forKey:kLWSRecommendPostsShortTitle];
    [aCoder encodeObject:_coverWebpUrl forKey:kLWSRecommendPostsCoverWebpUrl];
    [aCoder encodeObject:_coverImageUrl forKey:kLWSRecommendPostsCoverImageUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    LWSRecommendPosts *copy = [[LWSRecommendPosts alloc] init];
    
    if (copy) {

        copy.mediaType = self.mediaType;
        copy.status = self.status;
        copy.title = [self.title copyWithZone:zone];
        copy.editorId = self.editorId;
        copy.url = [self.url copyWithZone:zone];
        copy.adMonitors = [self.adMonitors copyWithZone:zone];
        copy.publishedAt = self.publishedAt;
        copy.updatedAt = self.updatedAt;
        copy.limitEndAt = [self.limitEndAt copyWithZone:zone];
        copy.template = [self.template copyWithZone:zone];
        copy.approvedAt = [self.approvedAt copyWithZone:zone];
        copy.featureList = [self.featureList copyWithZone:zone];
        copy.labelIds = [self.labelIds copyWithZone:zone];
        copy.recommendPostsIdentifier = self.recommendPostsIdentifier;
        copy.contentType = self.contentType;
        copy.contentUrl = [self.contentUrl copyWithZone:zone];
        copy.shareMsg = [self.shareMsg copyWithZone:zone];
        copy.likesCount = self.likesCount;
        copy.introduction = [self.introduction copyWithZone:zone];
        copy.createdAt = self.createdAt;
        copy.shortTitle = [self.shortTitle copyWithZone:zone];
        copy.coverWebpUrl = [self.coverWebpUrl copyWithZone:zone];
        copy.coverImageUrl = [self.coverImageUrl copyWithZone:zone];
    }
    
    return copy;
}


@end

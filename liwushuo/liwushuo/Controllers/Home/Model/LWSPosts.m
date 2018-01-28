//
//  LWSPosts.m
//
//  Created by  半夏 on 2017/12/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "LWSPosts.h"
#import "Column.h"
#import "Author.h"


NSString *const kLWSPostsColumn = @"column";
NSString *const kLWSPostsAuthor = @"author";
NSString *const kLWSPostsMediaType = @"media_type";
NSString *const kLWSPostsLiked = @"liked";
NSString *const kLWSPostsTitle = @"title";
NSString *const kLWSPostsEditorId = @"editor_id";
NSString *const kLWSPostsUrl = @"url";
NSString *const kLWSPostsAdMonitors = @"ad_monitors";
NSString *const kLWSPostsStatus = @"status";
NSString *const kLWSPostsPublishedAt = @"published_at";
NSString *const kLWSPostsUpdatedAt = @"updated_at";
NSString *const kLWSPostsApprovedAt = @"approved_at";
NSString *const kLWSPostsLimitEndAt = @"limit_end_at";
NSString *const kLWSPostsTemplate = @"template";
NSString *const kLWSPostsFeatureList = @"feature_list";
NSString *const kLWSPostsType = @"type";
NSString *const kLWSPostsLabelIds = @"label_ids";
NSString *const kLWSPostsId = @"id";
NSString *const kLWSPostsContentType = @"content_type";
NSString *const kLWSPostsContentUrl = @"content_url";
NSString *const kLWSPostsShareMsg = @"share_msg";
NSString *const kLWSPostsLikesCount = @"likes_count";
NSString *const kLWSPostsIntroduction = @"introduction";
NSString *const kLWSPostsCreatedAt = @"created_at";
NSString *const kLWSPostsShortTitle = @"short_title";
NSString *const kLWSPostsCoverWebpUrl = @"cover_webp_url";
NSString *const kLWSPostsCoverImageUrl = @"cover_image_url";


@interface LWSPosts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LWSPosts

@synthesize column = _column;
@synthesize author = _author;
@synthesize mediaType = _mediaType;
@synthesize liked = _liked;
@synthesize title = _title;
@synthesize editorId = _editorId;
@synthesize url = _url;
@synthesize adMonitors = _adMonitors;
@synthesize status = _status;
@synthesize publishedAt = _publishedAt;
@synthesize updatedAt = _updatedAt;
@synthesize approvedAt = _approvedAt;
@synthesize limitEndAt = _limitEndAt;
@synthesize template = _template;
@synthesize featureList = _featureList;
@synthesize type = _type;
@synthesize labelIds = _labelIds;
@synthesize postsIdentifier = _postsIdentifier;
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
            self.column = [Column modelObjectWithDictionary:[dict objectForKey:kLWSPostsColumn]];
            self.author = [Author modelObjectWithDictionary:[dict objectForKey:kLWSPostsAuthor]];
            self.mediaType = [[self objectOrNilForKey:kLWSPostsMediaType fromDictionary:dict] doubleValue];
            self.liked = [[self objectOrNilForKey:kLWSPostsLiked fromDictionary:dict] boolValue];
            self.title = [self objectOrNilForKey:kLWSPostsTitle fromDictionary:dict];
            self.editorId = [[self objectOrNilForKey:kLWSPostsEditorId fromDictionary:dict] doubleValue];
            self.url = [self objectOrNilForKey:kLWSPostsUrl fromDictionary:dict];
            self.adMonitors = [self objectOrNilForKey:kLWSPostsAdMonitors fromDictionary:dict];
            self.status = [[self objectOrNilForKey:kLWSPostsStatus fromDictionary:dict] doubleValue];
            self.publishedAt = [[self objectOrNilForKey:kLWSPostsPublishedAt fromDictionary:dict] doubleValue];
            self.updatedAt = [[self objectOrNilForKey:kLWSPostsUpdatedAt fromDictionary:dict] doubleValue];
            self.approvedAt = [[self objectOrNilForKey:kLWSPostsApprovedAt fromDictionary:dict] doubleValue];
            self.limitEndAt = [self objectOrNilForKey:kLWSPostsLimitEndAt fromDictionary:dict];
            self.template = [self objectOrNilForKey:kLWSPostsTemplate fromDictionary:dict];
            self.featureList = [self objectOrNilForKey:kLWSPostsFeatureList fromDictionary:dict];
            self.type = [self objectOrNilForKey:kLWSPostsType fromDictionary:dict];
            self.labelIds = [self objectOrNilForKey:kLWSPostsLabelIds fromDictionary:dict];
            self.postsIdentifier = [[self objectOrNilForKey:kLWSPostsId fromDictionary:dict] doubleValue];
            self.contentType = [[self objectOrNilForKey:kLWSPostsContentType fromDictionary:dict] doubleValue];
            self.contentUrl = [self objectOrNilForKey:kLWSPostsContentUrl fromDictionary:dict];
            self.shareMsg = [self objectOrNilForKey:kLWSPostsShareMsg fromDictionary:dict];
            self.likesCount = [[self objectOrNilForKey:kLWSPostsLikesCount fromDictionary:dict] doubleValue];
            self.introduction = [self objectOrNilForKey:kLWSPostsIntroduction fromDictionary:dict];
            self.createdAt = [[self objectOrNilForKey:kLWSPostsCreatedAt fromDictionary:dict] doubleValue];
            self.shortTitle = [self objectOrNilForKey:kLWSPostsShortTitle fromDictionary:dict];
            self.coverWebpUrl = [self objectOrNilForKey:kLWSPostsCoverWebpUrl fromDictionary:dict];
            self.coverImageUrl = [self objectOrNilForKey:kLWSPostsCoverImageUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.column dictionaryRepresentation] forKey:kLWSPostsColumn];
    [mutableDict setValue:[self.author dictionaryRepresentation] forKey:kLWSPostsAuthor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mediaType] forKey:kLWSPostsMediaType];
    [mutableDict setValue:[NSNumber numberWithBool:self.liked] forKey:kLWSPostsLiked];
    [mutableDict setValue:self.title forKey:kLWSPostsTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.editorId] forKey:kLWSPostsEditorId];
    [mutableDict setValue:self.url forKey:kLWSPostsUrl];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAdMonitors] forKey:kLWSPostsAdMonitors];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kLWSPostsStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.publishedAt] forKey:kLWSPostsPublishedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updatedAt] forKey:kLWSPostsUpdatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.approvedAt] forKey:kLWSPostsApprovedAt];
    [mutableDict setValue:self.limitEndAt forKey:kLWSPostsLimitEndAt];
    [mutableDict setValue:self.template forKey:kLWSPostsTemplate];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForFeatureList] forKey:kLWSPostsFeatureList];
    [mutableDict setValue:self.type forKey:kLWSPostsType];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLabelIds] forKey:kLWSPostsLabelIds];
    [mutableDict setValue:[NSNumber numberWithDouble:self.postsIdentifier] forKey:kLWSPostsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.contentType] forKey:kLWSPostsContentType];
    [mutableDict setValue:self.contentUrl forKey:kLWSPostsContentUrl];
    [mutableDict setValue:self.shareMsg forKey:kLWSPostsShareMsg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likesCount] forKey:kLWSPostsLikesCount];
    [mutableDict setValue:self.introduction forKey:kLWSPostsIntroduction];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdAt] forKey:kLWSPostsCreatedAt];
    [mutableDict setValue:self.shortTitle forKey:kLWSPostsShortTitle];
    [mutableDict setValue:self.coverWebpUrl forKey:kLWSPostsCoverWebpUrl];
    [mutableDict setValue:self.coverImageUrl forKey:kLWSPostsCoverImageUrl];

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

    self.column = [aDecoder decodeObjectForKey:kLWSPostsColumn];
    self.author = [aDecoder decodeObjectForKey:kLWSPostsAuthor];
    self.mediaType = [aDecoder decodeDoubleForKey:kLWSPostsMediaType];
    self.liked = [aDecoder decodeBoolForKey:kLWSPostsLiked];
    self.title = [aDecoder decodeObjectForKey:kLWSPostsTitle];
    self.editorId = [aDecoder decodeDoubleForKey:kLWSPostsEditorId];
    self.url = [aDecoder decodeObjectForKey:kLWSPostsUrl];
    self.adMonitors = [aDecoder decodeObjectForKey:kLWSPostsAdMonitors];
    self.status = [aDecoder decodeDoubleForKey:kLWSPostsStatus];
    self.publishedAt = [aDecoder decodeDoubleForKey:kLWSPostsPublishedAt];
    self.updatedAt = [aDecoder decodeDoubleForKey:kLWSPostsUpdatedAt];
    self.approvedAt = [aDecoder decodeDoubleForKey:kLWSPostsApprovedAt];
    self.limitEndAt = [aDecoder decodeObjectForKey:kLWSPostsLimitEndAt];
    self.template = [aDecoder decodeObjectForKey:kLWSPostsTemplate];
    self.featureList = [aDecoder decodeObjectForKey:kLWSPostsFeatureList];
    self.type = [aDecoder decodeObjectForKey:kLWSPostsType];
    self.labelIds = [aDecoder decodeObjectForKey:kLWSPostsLabelIds];
    self.postsIdentifier = [aDecoder decodeDoubleForKey:kLWSPostsId];
    self.contentType = [aDecoder decodeDoubleForKey:kLWSPostsContentType];
    self.contentUrl = [aDecoder decodeObjectForKey:kLWSPostsContentUrl];
    self.shareMsg = [aDecoder decodeObjectForKey:kLWSPostsShareMsg];
    self.likesCount = [aDecoder decodeDoubleForKey:kLWSPostsLikesCount];
    self.introduction = [aDecoder decodeObjectForKey:kLWSPostsIntroduction];
    self.createdAt = [aDecoder decodeDoubleForKey:kLWSPostsCreatedAt];
    self.shortTitle = [aDecoder decodeObjectForKey:kLWSPostsShortTitle];
    self.coverWebpUrl = [aDecoder decodeObjectForKey:kLWSPostsCoverWebpUrl];
    self.coverImageUrl = [aDecoder decodeObjectForKey:kLWSPostsCoverImageUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_column forKey:kLWSPostsColumn];
    [aCoder encodeObject:_author forKey:kLWSPostsAuthor];
    [aCoder encodeDouble:_mediaType forKey:kLWSPostsMediaType];
    [aCoder encodeBool:_liked forKey:kLWSPostsLiked];
    [aCoder encodeObject:_title forKey:kLWSPostsTitle];
    [aCoder encodeDouble:_editorId forKey:kLWSPostsEditorId];
    [aCoder encodeObject:_url forKey:kLWSPostsUrl];
    [aCoder encodeObject:_adMonitors forKey:kLWSPostsAdMonitors];
    [aCoder encodeDouble:_status forKey:kLWSPostsStatus];
    [aCoder encodeDouble:_publishedAt forKey:kLWSPostsPublishedAt];
    [aCoder encodeDouble:_updatedAt forKey:kLWSPostsUpdatedAt];
    [aCoder encodeDouble:_approvedAt forKey:kLWSPostsApprovedAt];
    [aCoder encodeObject:_limitEndAt forKey:kLWSPostsLimitEndAt];
    [aCoder encodeObject:_template forKey:kLWSPostsTemplate];
    [aCoder encodeObject:_featureList forKey:kLWSPostsFeatureList];
    [aCoder encodeObject:_type forKey:kLWSPostsType];
    [aCoder encodeObject:_labelIds forKey:kLWSPostsLabelIds];
    [aCoder encodeDouble:_postsIdentifier forKey:kLWSPostsId];
    [aCoder encodeDouble:_contentType forKey:kLWSPostsContentType];
    [aCoder encodeObject:_contentUrl forKey:kLWSPostsContentUrl];
    [aCoder encodeObject:_shareMsg forKey:kLWSPostsShareMsg];
    [aCoder encodeDouble:_likesCount forKey:kLWSPostsLikesCount];
    [aCoder encodeObject:_introduction forKey:kLWSPostsIntroduction];
    [aCoder encodeDouble:_createdAt forKey:kLWSPostsCreatedAt];
    [aCoder encodeObject:_shortTitle forKey:kLWSPostsShortTitle];
    [aCoder encodeObject:_coverWebpUrl forKey:kLWSPostsCoverWebpUrl];
    [aCoder encodeObject:_coverImageUrl forKey:kLWSPostsCoverImageUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    LWSPosts *copy = [[LWSPosts alloc] init];
    
    if (copy) {

        copy.column = [self.column copyWithZone:zone];
        copy.author = [self.author copyWithZone:zone];
        copy.mediaType = self.mediaType;
        copy.liked = self.liked;
        copy.title = [self.title copyWithZone:zone];
        copy.editorId = self.editorId;
        copy.url = [self.url copyWithZone:zone];
        copy.adMonitors = [self.adMonitors copyWithZone:zone];
        copy.status = self.status;
        copy.publishedAt = self.publishedAt;
        copy.updatedAt = self.updatedAt;
        copy.approvedAt = self.approvedAt;
        copy.limitEndAt = [self.limitEndAt copyWithZone:zone];
        copy.template = [self.template copyWithZone:zone];
        copy.featureList = [self.featureList copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.labelIds = [self.labelIds copyWithZone:zone];
        copy.postsIdentifier = self.postsIdentifier;
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

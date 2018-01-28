//
//  LWSDetailData.m
//
//  Created by  半夏 on 2018/1/3
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "LWSDetailData.h"
#import "LWSDetailDataColumn.h"
#import "LWSItemAdMonitors.h"


NSString *const kLWSDetailDataColumnBottom = @"column_bottom";
NSString *const kLWSDetailDataCreatedAt = @"created_at";
NSString *const kLWSDetailDataPublishedAt = @"published_at";
NSString *const kLWSDetailDataId = @"id";
NSString *const kLWSDetailDataCoverAnimatedWebpUrl = @"cover_animated_webp_url";
NSString *const kLWSDetailDataEditorId = @"editor_id";
NSString *const kLWSDetailDataContentType = @"content_type";
NSString *const kLWSDetailDataUrl = @"url";
NSString *const kLWSDetailDataApprovedAt = @"approved_at";
NSString *const kLWSDetailDataSharesCount = @"shares_count";
NSString *const kLWSDetailDataCoverImageUrl = @"cover_image_url";
NSString *const kLWSDetailDataTemplate = @"template";
NSString *const kLWSDetailDataCoverWebpUrl = @"cover_webp_url";
NSString *const kLWSDetailDataContentHtml = @"content_html";
NSString *const kLWSDetailDataShareMsg = @"share_msg";
NSString *const kLWSDetailDataLabelIds = @"label_ids";
NSString *const kLWSDetailDataCommentsCount = @"comments_count";
NSString *const kLWSDetailDataContentUrl = @"content_url";
NSString *const kLWSDetailDataColumnHeader = @"column_header";
NSString *const kLWSDetailDataLiked = @"liked";
NSString *const kLWSDetailDataLimitEndAt = @"limit_end_at";
NSString *const kLWSDetailDataDetailDataColumn = @"column";
NSString *const kLWSDetailDataIntroduction = @"introduction";
NSString *const kLWSDetailDataFeatureList = @"feature_list";
NSString *const kLWSDetailDataStatus = @"status";
NSString *const kLWSDetailDataContent = @"content";
NSString *const kLWSDetailDataShortTitle = @"short_title";
NSString *const kLWSDetailDataUpdatedAt = @"updated_at";
NSString *const kLWSDetailDataLikesCount = @"likes_count";
NSString *const kLWSDetailDataItemAdMonitors = @"item_ad_monitors";
NSString *const kLWSDetailDataMediaType = @"media_type";
NSString *const kLWSDetailDataAdMonitors = @"ad_monitors";
NSString *const kLWSDetailDataTitle = @"title";


@interface LWSDetailData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LWSDetailData

@synthesize columnBottom = _columnBottom;
@synthesize createdAt = _createdAt;
@synthesize publishedAt = _publishedAt;
@synthesize detailDataIdentifier = _detailDataIdentifier;
@synthesize coverAnimatedWebpUrl = _coverAnimatedWebpUrl;
@synthesize editorId = _editorId;
@synthesize contentType = _contentType;
@synthesize url = _url;
@synthesize approvedAt = _approvedAt;
@synthesize sharesCount = _sharesCount;
@synthesize coverImageUrl = _coverImageUrl;
@synthesize template = _template;
@synthesize coverWebpUrl = _coverWebpUrl;
@synthesize contentHtml = _contentHtml;
@synthesize shareMsg = _shareMsg;
@synthesize labelIds = _labelIds;
@synthesize commentsCount = _commentsCount;
@synthesize contentUrl = _contentUrl;
@synthesize columnHeader = _columnHeader;
@synthesize liked = _liked;
@synthesize limitEndAt = _limitEndAt;
@synthesize detailDataColumn = _detailDataColumn;
@synthesize introduction = _introduction;
@synthesize featureList = _featureList;
@synthesize status = _status;
@synthesize content = _content;
@synthesize shortTitle = _shortTitle;
@synthesize updatedAt = _updatedAt;
@synthesize likesCount = _likesCount;
@synthesize itemAdMonitors = _itemAdMonitors;
@synthesize mediaType = _mediaType;
@synthesize adMonitors = _adMonitors;
@synthesize title = _title;


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
            self.columnBottom = [self objectOrNilForKey:kLWSDetailDataColumnBottom fromDictionary:dict];
            self.createdAt = [[self objectOrNilForKey:kLWSDetailDataCreatedAt fromDictionary:dict] doubleValue];
            self.publishedAt = [[self objectOrNilForKey:kLWSDetailDataPublishedAt fromDictionary:dict] doubleValue];
            self.detailDataIdentifier = [[self objectOrNilForKey:kLWSDetailDataId fromDictionary:dict] doubleValue];
            self.coverAnimatedWebpUrl = [self objectOrNilForKey:kLWSDetailDataCoverAnimatedWebpUrl fromDictionary:dict];
            self.editorId = [[self objectOrNilForKey:kLWSDetailDataEditorId fromDictionary:dict] doubleValue];
            self.contentType = [[self objectOrNilForKey:kLWSDetailDataContentType fromDictionary:dict] doubleValue];
            self.url = [self objectOrNilForKey:kLWSDetailDataUrl fromDictionary:dict];
            self.approvedAt = [[self objectOrNilForKey:kLWSDetailDataApprovedAt fromDictionary:dict] doubleValue];
            self.sharesCount = [[self objectOrNilForKey:kLWSDetailDataSharesCount fromDictionary:dict] doubleValue];
            self.coverImageUrl = [self objectOrNilForKey:kLWSDetailDataCoverImageUrl fromDictionary:dict];
            self.template = [self objectOrNilForKey:kLWSDetailDataTemplate fromDictionary:dict];
            self.coverWebpUrl = [self objectOrNilForKey:kLWSDetailDataCoverWebpUrl fromDictionary:dict];
            self.contentHtml = [self objectOrNilForKey:kLWSDetailDataContentHtml fromDictionary:dict];
            self.shareMsg = [self objectOrNilForKey:kLWSDetailDataShareMsg fromDictionary:dict];
            self.labelIds = [self objectOrNilForKey:kLWSDetailDataLabelIds fromDictionary:dict];
            self.commentsCount = [[self objectOrNilForKey:kLWSDetailDataCommentsCount fromDictionary:dict] doubleValue];
            self.contentUrl = [self objectOrNilForKey:kLWSDetailDataContentUrl fromDictionary:dict];
            self.columnHeader = [self objectOrNilForKey:kLWSDetailDataColumnHeader fromDictionary:dict];
            self.liked = [[self objectOrNilForKey:kLWSDetailDataLiked fromDictionary:dict] boolValue];
            self.limitEndAt = [self objectOrNilForKey:kLWSDetailDataLimitEndAt fromDictionary:dict];
            self.detailDataColumn = [LWSDetailDataColumn modelObjectWithDictionary:[dict objectForKey:kLWSDetailDataDetailDataColumn]];
            self.introduction = [self objectOrNilForKey:kLWSDetailDataIntroduction fromDictionary:dict];
            self.featureList = [self objectOrNilForKey:kLWSDetailDataFeatureList fromDictionary:dict];
            self.status = [[self objectOrNilForKey:kLWSDetailDataStatus fromDictionary:dict] doubleValue];
            self.content = [self objectOrNilForKey:kLWSDetailDataContent fromDictionary:dict];
            self.shortTitle = [self objectOrNilForKey:kLWSDetailDataShortTitle fromDictionary:dict];
            self.updatedAt = [[self objectOrNilForKey:kLWSDetailDataUpdatedAt fromDictionary:dict] doubleValue];
            self.likesCount = [[self objectOrNilForKey:kLWSDetailDataLikesCount fromDictionary:dict] doubleValue];
            self.mediaType = [[self objectOrNilForKey:kLWSDetailDataMediaType fromDictionary:dict] doubleValue];
            self.adMonitors = [self objectOrNilForKey:kLWSDetailDataAdMonitors fromDictionary:dict];
            self.title = [self objectOrNilForKey:kLWSDetailDataTitle fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.columnBottom forKey:kLWSDetailDataColumnBottom];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdAt] forKey:kLWSDetailDataCreatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.publishedAt] forKey:kLWSDetailDataPublishedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.detailDataIdentifier] forKey:kLWSDetailDataId];
    [mutableDict setValue:self.coverAnimatedWebpUrl forKey:kLWSDetailDataCoverAnimatedWebpUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.editorId] forKey:kLWSDetailDataEditorId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.contentType] forKey:kLWSDetailDataContentType];
    [mutableDict setValue:self.url forKey:kLWSDetailDataUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.approvedAt] forKey:kLWSDetailDataApprovedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sharesCount] forKey:kLWSDetailDataSharesCount];
    [mutableDict setValue:self.coverImageUrl forKey:kLWSDetailDataCoverImageUrl];
    [mutableDict setValue:self.template forKey:kLWSDetailDataTemplate];
    [mutableDict setValue:self.coverWebpUrl forKey:kLWSDetailDataCoverWebpUrl];
    [mutableDict setValue:self.contentHtml forKey:kLWSDetailDataContentHtml];
    [mutableDict setValue:self.shareMsg forKey:kLWSDetailDataShareMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLabelIds] forKey:kLWSDetailDataLabelIds];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentsCount] forKey:kLWSDetailDataCommentsCount];
    [mutableDict setValue:self.contentUrl forKey:kLWSDetailDataContentUrl];
    [mutableDict setValue:self.columnHeader forKey:kLWSDetailDataColumnHeader];
    [mutableDict setValue:[NSNumber numberWithBool:self.liked] forKey:kLWSDetailDataLiked];
    [mutableDict setValue:self.limitEndAt forKey:kLWSDetailDataLimitEndAt];
    [mutableDict setValue:[self.detailDataColumn dictionaryRepresentation] forKey:kLWSDetailDataDetailDataColumn];
    [mutableDict setValue:self.introduction forKey:kLWSDetailDataIntroduction];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForFeatureList] forKey:kLWSDetailDataFeatureList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kLWSDetailDataStatus];
    [mutableDict setValue:self.content forKey:kLWSDetailDataContent];
    [mutableDict setValue:self.shortTitle forKey:kLWSDetailDataShortTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updatedAt] forKey:kLWSDetailDataUpdatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likesCount] forKey:kLWSDetailDataLikesCount];
    [mutableDict setValue:[self.itemAdMonitors dictionaryRepresentation] forKey:kLWSDetailDataItemAdMonitors];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mediaType] forKey:kLWSDetailDataMediaType];
    [mutableDict setValue:self.adMonitors forKey:kLWSDetailDataAdMonitors];
    [mutableDict setValue:self.title forKey:kLWSDetailDataTitle];

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

    self.columnBottom = [aDecoder decodeObjectForKey:kLWSDetailDataColumnBottom];
    self.createdAt = [aDecoder decodeDoubleForKey:kLWSDetailDataCreatedAt];
    self.publishedAt = [aDecoder decodeDoubleForKey:kLWSDetailDataPublishedAt];
    self.detailDataIdentifier = [aDecoder decodeDoubleForKey:kLWSDetailDataId];
    self.coverAnimatedWebpUrl = [aDecoder decodeObjectForKey:kLWSDetailDataCoverAnimatedWebpUrl];
    self.editorId = [aDecoder decodeDoubleForKey:kLWSDetailDataEditorId];
    self.contentType = [aDecoder decodeDoubleForKey:kLWSDetailDataContentType];
    self.url = [aDecoder decodeObjectForKey:kLWSDetailDataUrl];
    self.approvedAt = [aDecoder decodeDoubleForKey:kLWSDetailDataApprovedAt];
    self.sharesCount = [aDecoder decodeDoubleForKey:kLWSDetailDataSharesCount];
    self.coverImageUrl = [aDecoder decodeObjectForKey:kLWSDetailDataCoverImageUrl];
    self.template = [aDecoder decodeObjectForKey:kLWSDetailDataTemplate];
    self.coverWebpUrl = [aDecoder decodeObjectForKey:kLWSDetailDataCoverWebpUrl];
    self.contentHtml = [aDecoder decodeObjectForKey:kLWSDetailDataContentHtml];
    self.shareMsg = [aDecoder decodeObjectForKey:kLWSDetailDataShareMsg];
    self.labelIds = [aDecoder decodeObjectForKey:kLWSDetailDataLabelIds];
    self.commentsCount = [aDecoder decodeDoubleForKey:kLWSDetailDataCommentsCount];
    self.contentUrl = [aDecoder decodeObjectForKey:kLWSDetailDataContentUrl];
    self.columnHeader = [aDecoder decodeObjectForKey:kLWSDetailDataColumnHeader];
    self.liked = [aDecoder decodeBoolForKey:kLWSDetailDataLiked];
    self.limitEndAt = [aDecoder decodeObjectForKey:kLWSDetailDataLimitEndAt];
    self.detailDataColumn = [aDecoder decodeObjectForKey:kLWSDetailDataDetailDataColumn];
    self.introduction = [aDecoder decodeObjectForKey:kLWSDetailDataIntroduction];
    self.featureList = [aDecoder decodeObjectForKey:kLWSDetailDataFeatureList];
    self.status = [aDecoder decodeDoubleForKey:kLWSDetailDataStatus];
    self.content = [aDecoder decodeObjectForKey:kLWSDetailDataContent];
    self.shortTitle = [aDecoder decodeObjectForKey:kLWSDetailDataShortTitle];
    self.updatedAt = [aDecoder decodeDoubleForKey:kLWSDetailDataUpdatedAt];
    self.likesCount = [aDecoder decodeDoubleForKey:kLWSDetailDataLikesCount];
    self.itemAdMonitors = [aDecoder decodeObjectForKey:kLWSDetailDataItemAdMonitors];
    self.mediaType = [aDecoder decodeDoubleForKey:kLWSDetailDataMediaType];
    self.adMonitors = [aDecoder decodeObjectForKey:kLWSDetailDataAdMonitors];
    self.title = [aDecoder decodeObjectForKey:kLWSDetailDataTitle];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_columnBottom forKey:kLWSDetailDataColumnBottom];
    [aCoder encodeDouble:_createdAt forKey:kLWSDetailDataCreatedAt];
    [aCoder encodeDouble:_publishedAt forKey:kLWSDetailDataPublishedAt];
    [aCoder encodeDouble:_detailDataIdentifier forKey:kLWSDetailDataId];
    [aCoder encodeObject:_coverAnimatedWebpUrl forKey:kLWSDetailDataCoverAnimatedWebpUrl];
    [aCoder encodeDouble:_editorId forKey:kLWSDetailDataEditorId];
    [aCoder encodeDouble:_contentType forKey:kLWSDetailDataContentType];
    [aCoder encodeObject:_url forKey:kLWSDetailDataUrl];
    [aCoder encodeDouble:_approvedAt forKey:kLWSDetailDataApprovedAt];
    [aCoder encodeDouble:_sharesCount forKey:kLWSDetailDataSharesCount];
    [aCoder encodeObject:_coverImageUrl forKey:kLWSDetailDataCoverImageUrl];
    [aCoder encodeObject:_template forKey:kLWSDetailDataTemplate];
    [aCoder encodeObject:_coverWebpUrl forKey:kLWSDetailDataCoverWebpUrl];
    [aCoder encodeObject:_contentHtml forKey:kLWSDetailDataContentHtml];
    [aCoder encodeObject:_shareMsg forKey:kLWSDetailDataShareMsg];
    [aCoder encodeObject:_labelIds forKey:kLWSDetailDataLabelIds];
    [aCoder encodeDouble:_commentsCount forKey:kLWSDetailDataCommentsCount];
    [aCoder encodeObject:_contentUrl forKey:kLWSDetailDataContentUrl];
    [aCoder encodeObject:_columnHeader forKey:kLWSDetailDataColumnHeader];
    [aCoder encodeBool:_liked forKey:kLWSDetailDataLiked];
    [aCoder encodeObject:_limitEndAt forKey:kLWSDetailDataLimitEndAt];
    [aCoder encodeObject:_detailDataColumn forKey:kLWSDetailDataDetailDataColumn];
    [aCoder encodeObject:_introduction forKey:kLWSDetailDataIntroduction];
    [aCoder encodeObject:_featureList forKey:kLWSDetailDataFeatureList];
    [aCoder encodeDouble:_status forKey:kLWSDetailDataStatus];
    [aCoder encodeObject:_content forKey:kLWSDetailDataContent];
    [aCoder encodeObject:_shortTitle forKey:kLWSDetailDataShortTitle];
    [aCoder encodeDouble:_updatedAt forKey:kLWSDetailDataUpdatedAt];
    [aCoder encodeDouble:_likesCount forKey:kLWSDetailDataLikesCount];
    [aCoder encodeObject:_itemAdMonitors forKey:kLWSDetailDataItemAdMonitors];
    [aCoder encodeDouble:_mediaType forKey:kLWSDetailDataMediaType];
    [aCoder encodeObject:_adMonitors forKey:kLWSDetailDataAdMonitors];
    [aCoder encodeObject:_title forKey:kLWSDetailDataTitle];
}

- (id)copyWithZone:(NSZone *)zone
{
    LWSDetailData *copy = [[LWSDetailData alloc] init];
    
    if (copy) {

        copy.columnBottom = [self.columnBottom copyWithZone:zone];
        copy.createdAt = self.createdAt;
        copy.publishedAt = self.publishedAt;
        copy.detailDataIdentifier = self.detailDataIdentifier;
        copy.coverAnimatedWebpUrl = [self.coverAnimatedWebpUrl copyWithZone:zone];
        copy.editorId = self.editorId;
        copy.contentType = self.contentType;
        copy.url = [self.url copyWithZone:zone];
        copy.approvedAt = self.approvedAt;
        copy.sharesCount = self.sharesCount;
        copy.coverImageUrl = [self.coverImageUrl copyWithZone:zone];
        copy.template = [self.template copyWithZone:zone];
        copy.coverWebpUrl = [self.coverWebpUrl copyWithZone:zone];
        copy.contentHtml = [self.contentHtml copyWithZone:zone];
        copy.shareMsg = [self.shareMsg copyWithZone:zone];
        copy.labelIds = [self.labelIds copyWithZone:zone];
        copy.commentsCount = self.commentsCount;
        copy.contentUrl = [self.contentUrl copyWithZone:zone];
        copy.columnHeader = [self.columnHeader copyWithZone:zone];
        copy.liked = self.liked;
        copy.limitEndAt = [self.limitEndAt copyWithZone:zone];
        copy.detailDataColumn = [self.detailDataColumn copyWithZone:zone];
        copy.introduction = [self.introduction copyWithZone:zone];
        copy.featureList = [self.featureList copyWithZone:zone];
        copy.status = self.status;
        copy.content = [self.content copyWithZone:zone];
        copy.shortTitle = [self.shortTitle copyWithZone:zone];
        copy.updatedAt = self.updatedAt;
        copy.likesCount = self.likesCount;
        copy.itemAdMonitors = [self.itemAdMonitors copyWithZone:zone];
        copy.mediaType = self.mediaType;
        copy.adMonitors = [self.adMonitors copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
    }
    
    return copy;
}


@end

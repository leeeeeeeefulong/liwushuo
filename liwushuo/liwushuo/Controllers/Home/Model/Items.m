//
//  Items.m
//
//  Created by  半夏 on 2017/12/11
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Items.h"
#import "Column.h"
#import "Author.h"


NSString *const kItemsColumn = @"column";
NSString *const kItemsLabels = @"labels";
NSString *const kItemsMediaType = @"media_type";
NSString *const kItemsLiked = @"liked";
NSString *const kItemsTitle = @"title";
NSString *const kItemsEditorId = @"editor_id";
NSString *const kItemsUrl = @"url";
NSString *const kItemsAdMonitors = @"ad_monitors";
NSString *const kItemsStatus = @"status";
NSString *const kItemsPublishedAt = @"published_at";
NSString *const kItemsCoverAnimatedWebpUrl = @"cover_animated_webp_url";
NSString *const kItemsUpdatedAt = @"updated_at";
NSString *const kItemsAuthor = @"author";
NSString *const kItemsApprovedAt = @"approved_at";
NSString *const kItemsLimitEndAt = @"limit_end_at";
NSString *const kItemsTemplate = @"template";
NSString *const kItemsHiddenCoverImage = @"hidden_cover_image";
NSString *const kItemsFeatureList = @"feature_list";
NSString *const kItemsType = @"type";
NSString *const kItemsId = @"id";
NSString *const kItemsContentType = @"content_type";
NSString *const kItemsContentUrl = @"content_url";
NSString *const kItemsShareMsg = @"share_msg";
NSString *const kItemsLikesCount = @"likes_count";
NSString *const kItemsIntroduction = @"introduction";
NSString *const kItemsCreatedAt = @"created_at";
NSString *const kItemsShortTitle = @"short_title";
NSString *const kItemsCoverWebpUrl = @"cover_webp_url";
NSString *const kItemsCoverImageUrl = @"cover_image_url";


@interface Items ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Items

@synthesize column = _column;
@synthesize labels = _labels;
@synthesize mediaType = _mediaType;
@synthesize liked = _liked;
@synthesize title = _title;
@synthesize editorId = _editorId;
@synthesize url = _url;
@synthesize adMonitors = _adMonitors;
@synthesize status = _status;
@synthesize publishedAt = _publishedAt;
@synthesize coverAnimatedWebpUrl = _coverAnimatedWebpUrl;
@synthesize updatedAt = _updatedAt;
@synthesize author = _author;
@synthesize approvedAt = _approvedAt;
@synthesize limitEndAt = _limitEndAt;
@synthesize template = _template;
@synthesize hiddenCoverImage = _hiddenCoverImage;
@synthesize featureList = _featureList;
@synthesize type = _type;
@synthesize itemsIdentifier = _itemsIdentifier;
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
            self.column = [Column modelObjectWithDictionary:[dict objectForKey:kItemsColumn]];
            self.labels = [self objectOrNilForKey:kItemsLabels fromDictionary:dict];
            self.mediaType = [[self objectOrNilForKey:kItemsMediaType fromDictionary:dict] doubleValue];
            self.liked = [[self objectOrNilForKey:kItemsLiked fromDictionary:dict] boolValue];
            self.title = [self objectOrNilForKey:kItemsTitle fromDictionary:dict];
            self.editorId = [[self objectOrNilForKey:kItemsEditorId fromDictionary:dict] doubleValue];
            self.url = [self objectOrNilForKey:kItemsUrl fromDictionary:dict];
            self.adMonitors = [self objectOrNilForKey:kItemsAdMonitors fromDictionary:dict];
            self.status = [[self objectOrNilForKey:kItemsStatus fromDictionary:dict] doubleValue];
            self.publishedAt = [[self objectOrNilForKey:kItemsPublishedAt fromDictionary:dict] doubleValue];
            self.coverAnimatedWebpUrl = [self objectOrNilForKey:kItemsCoverAnimatedWebpUrl fromDictionary:dict];
            self.updatedAt = [[self objectOrNilForKey:kItemsUpdatedAt fromDictionary:dict] doubleValue];
            self.author = [Author modelObjectWithDictionary:[dict objectForKey:kItemsAuthor]];
            self.approvedAt = [[self objectOrNilForKey:kItemsApprovedAt fromDictionary:dict] doubleValue];
            self.limitEndAt = [self objectOrNilForKey:kItemsLimitEndAt fromDictionary:dict];
            self.template = [self objectOrNilForKey:kItemsTemplate fromDictionary:dict];
            self.hiddenCoverImage = [[self objectOrNilForKey:kItemsHiddenCoverImage fromDictionary:dict] boolValue];
            self.featureList = [self objectOrNilForKey:kItemsFeatureList fromDictionary:dict];
            self.type = [self objectOrNilForKey:kItemsType fromDictionary:dict];
            self.itemsIdentifier = [[self objectOrNilForKey:kItemsId fromDictionary:dict] doubleValue];
            self.contentType = [[self objectOrNilForKey:kItemsContentType fromDictionary:dict] doubleValue];
            self.contentUrl = [self objectOrNilForKey:kItemsContentUrl fromDictionary:dict];
            self.shareMsg = [self objectOrNilForKey:kItemsShareMsg fromDictionary:dict];
            self.likesCount = [[self objectOrNilForKey:kItemsLikesCount fromDictionary:dict] doubleValue];
            self.introduction = [self objectOrNilForKey:kItemsIntroduction fromDictionary:dict];
            self.createdAt = [[self objectOrNilForKey:kItemsCreatedAt fromDictionary:dict] doubleValue];
            self.shortTitle = [self objectOrNilForKey:kItemsShortTitle fromDictionary:dict];
            self.coverWebpUrl = [self objectOrNilForKey:kItemsCoverWebpUrl fromDictionary:dict];
            self.coverImageUrl = [self objectOrNilForKey:kItemsCoverImageUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.column dictionaryRepresentation] forKey:kItemsColumn];
    NSMutableArray *tempArrayForLabels = [NSMutableArray array];
    for (NSObject *subArrayObject in self.labels) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForLabels addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForLabels addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLabels] forKey:kItemsLabels];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mediaType] forKey:kItemsMediaType];
    [mutableDict setValue:[NSNumber numberWithBool:self.liked] forKey:kItemsLiked];
    [mutableDict setValue:self.title forKey:kItemsTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.editorId] forKey:kItemsEditorId];
    [mutableDict setValue:self.url forKey:kItemsUrl];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAdMonitors] forKey:kItemsAdMonitors];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kItemsStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.publishedAt] forKey:kItemsPublishedAt];
    [mutableDict setValue:self.coverAnimatedWebpUrl forKey:kItemsCoverAnimatedWebpUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updatedAt] forKey:kItemsUpdatedAt];
    [mutableDict setValue:[self.author dictionaryRepresentation] forKey:kItemsAuthor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.approvedAt] forKey:kItemsApprovedAt];
    [mutableDict setValue:self.limitEndAt forKey:kItemsLimitEndAt];
    [mutableDict setValue:self.template forKey:kItemsTemplate];
    [mutableDict setValue:[NSNumber numberWithBool:self.hiddenCoverImage] forKey:kItemsHiddenCoverImage];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForFeatureList] forKey:kItemsFeatureList];
    [mutableDict setValue:self.type forKey:kItemsType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemsIdentifier] forKey:kItemsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.contentType] forKey:kItemsContentType];
    [mutableDict setValue:self.contentUrl forKey:kItemsContentUrl];
    [mutableDict setValue:self.shareMsg forKey:kItemsShareMsg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likesCount] forKey:kItemsLikesCount];
    [mutableDict setValue:self.introduction forKey:kItemsIntroduction];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdAt] forKey:kItemsCreatedAt];
    [mutableDict setValue:self.shortTitle forKey:kItemsShortTitle];
    [mutableDict setValue:self.coverWebpUrl forKey:kItemsCoverWebpUrl];
    [mutableDict setValue:self.coverImageUrl forKey:kItemsCoverImageUrl];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

- (CGFloat)titleHeight
{
    CGSize titleSize = [self.title boundingRectWithSize:CGSizeMake(Main_Screen_Width - 30, MAXFLOAT)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{NSFontAttributeName : [UIFont fontWithName:@"PingFangSC-Semibold" size:18.0]}
                                                context:nil].size;
    
    return titleSize.height;
}

- (CGFloat)introductionHeight
{
    return [self.introduction boundingRectWithSize:CGSizeMake(Main_Screen_Width - 30, MAXFLOAT)
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName : [UIFont fontWithName:@"PingFangSC-Light" size:12.0]}
                                           context:nil].size.height;
}
- (CGFloat)itemHeight
{
    CGFloat height = 0;
    
    if ([self numberOfText:self.title
                  maxWidth:Main_Screen_Width - 30.0f
                attributes:@{NSFontAttributeName : [UIFont fontWithName:@"PingFangSC-Semibold" size:18.0]}] > 1) {
        height += 25.0;
    }
    
    if ([self numberOfText:self.introduction maxWidth:Main_Screen_Width - 30.0f attributes:@{NSFontAttributeName : [UIFont fontWithName:@"PingFangSC-Light" size:12.0]}] > 1) {
        height += 25.0;
    }
    
    
    return height;
}

/**
 计算文本多少行

 @param string 要计算的文字
 @param width 文字显示的宽度
 @param attributes 字体大小和字体样式
 @return 多少行
 */
- (CGFloat)numberOfText:(NSString *)string
               maxWidth:(CGFloat)width
             attributes:(NSDictionary<NSAttributedStringKey, id> *)attributes
               {
    // 获取单行时候的内容的size
    CGSize singleSize = [string sizeWithAttributes:attributes];
    // 获取多行时候,文字的size
    CGSize textSize = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    // 返回计算的行数
    return ceil( textSize.height / singleSize.height);
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

    self.column = [aDecoder decodeObjectForKey:kItemsColumn];
    self.labels = [aDecoder decodeObjectForKey:kItemsLabels];
    self.mediaType = [aDecoder decodeDoubleForKey:kItemsMediaType];
    self.liked = [aDecoder decodeBoolForKey:kItemsLiked];
    self.title = [aDecoder decodeObjectForKey:kItemsTitle];
    self.editorId = [aDecoder decodeDoubleForKey:kItemsEditorId];
    self.url = [aDecoder decodeObjectForKey:kItemsUrl];
    self.adMonitors = [aDecoder decodeObjectForKey:kItemsAdMonitors];
    self.status = [aDecoder decodeDoubleForKey:kItemsStatus];
    self.publishedAt = [aDecoder decodeDoubleForKey:kItemsPublishedAt];
    self.coverAnimatedWebpUrl = [aDecoder decodeObjectForKey:kItemsCoverAnimatedWebpUrl];
    self.updatedAt = [aDecoder decodeDoubleForKey:kItemsUpdatedAt];
    self.author = [aDecoder decodeObjectForKey:kItemsAuthor];
    self.approvedAt = [aDecoder decodeDoubleForKey:kItemsApprovedAt];
    self.limitEndAt = [aDecoder decodeObjectForKey:kItemsLimitEndAt];
    self.template = [aDecoder decodeObjectForKey:kItemsTemplate];
    self.hiddenCoverImage = [aDecoder decodeBoolForKey:kItemsHiddenCoverImage];
    self.featureList = [aDecoder decodeObjectForKey:kItemsFeatureList];
    self.type = [aDecoder decodeObjectForKey:kItemsType];
    self.itemsIdentifier = [aDecoder decodeDoubleForKey:kItemsId];
    self.contentType = [aDecoder decodeDoubleForKey:kItemsContentType];
    self.contentUrl = [aDecoder decodeObjectForKey:kItemsContentUrl];
    self.shareMsg = [aDecoder decodeObjectForKey:kItemsShareMsg];
    self.likesCount = [aDecoder decodeDoubleForKey:kItemsLikesCount];
    self.introduction = [aDecoder decodeObjectForKey:kItemsIntroduction];
    self.createdAt = [aDecoder decodeDoubleForKey:kItemsCreatedAt];
    self.shortTitle = [aDecoder decodeObjectForKey:kItemsShortTitle];
    self.coverWebpUrl = [aDecoder decodeObjectForKey:kItemsCoverWebpUrl];
    self.coverImageUrl = [aDecoder decodeObjectForKey:kItemsCoverImageUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_column forKey:kItemsColumn];
    [aCoder encodeObject:_labels forKey:kItemsLabels];
    [aCoder encodeDouble:_mediaType forKey:kItemsMediaType];
    [aCoder encodeBool:_liked forKey:kItemsLiked];
    [aCoder encodeObject:_title forKey:kItemsTitle];
    [aCoder encodeDouble:_editorId forKey:kItemsEditorId];
    [aCoder encodeObject:_url forKey:kItemsUrl];
    [aCoder encodeObject:_adMonitors forKey:kItemsAdMonitors];
    [aCoder encodeDouble:_status forKey:kItemsStatus];
    [aCoder encodeDouble:_publishedAt forKey:kItemsPublishedAt];
    [aCoder encodeObject:_coverAnimatedWebpUrl forKey:kItemsCoverAnimatedWebpUrl];
    [aCoder encodeDouble:_updatedAt forKey:kItemsUpdatedAt];
    [aCoder encodeObject:_author forKey:kItemsAuthor];
    [aCoder encodeDouble:_approvedAt forKey:kItemsApprovedAt];
    [aCoder encodeObject:_limitEndAt forKey:kItemsLimitEndAt];
    [aCoder encodeObject:_template forKey:kItemsTemplate];
    [aCoder encodeBool:_hiddenCoverImage forKey:kItemsHiddenCoverImage];
    [aCoder encodeObject:_featureList forKey:kItemsFeatureList];
    [aCoder encodeObject:_type forKey:kItemsType];
    [aCoder encodeDouble:_itemsIdentifier forKey:kItemsId];
    [aCoder encodeDouble:_contentType forKey:kItemsContentType];
    [aCoder encodeObject:_contentUrl forKey:kItemsContentUrl];
    [aCoder encodeObject:_shareMsg forKey:kItemsShareMsg];
    [aCoder encodeDouble:_likesCount forKey:kItemsLikesCount];
    [aCoder encodeObject:_introduction forKey:kItemsIntroduction];
    [aCoder encodeDouble:_createdAt forKey:kItemsCreatedAt];
    [aCoder encodeObject:_shortTitle forKey:kItemsShortTitle];
    [aCoder encodeObject:_coverWebpUrl forKey:kItemsCoverWebpUrl];
    [aCoder encodeObject:_coverImageUrl forKey:kItemsCoverImageUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    Items *copy = [[Items alloc] init];
    
    if (copy) {

        copy.column = [self.column copyWithZone:zone];
        copy.labels = [self.labels copyWithZone:zone];
        copy.mediaType = self.mediaType;
        copy.liked = self.liked;
        copy.title = [self.title copyWithZone:zone];
        copy.editorId = self.editorId;
        copy.url = [self.url copyWithZone:zone];
        copy.adMonitors = [self.adMonitors copyWithZone:zone];
        copy.status = self.status;
        copy.publishedAt = self.publishedAt;
        copy.coverAnimatedWebpUrl = [self.coverAnimatedWebpUrl copyWithZone:zone];
        copy.updatedAt = self.updatedAt;
        copy.author = [self.author copyWithZone:zone];
        copy.approvedAt = self.approvedAt;
        copy.limitEndAt = [self.limitEndAt copyWithZone:zone];
        copy.template = [self.template copyWithZone:zone];
        copy.hiddenCoverImage = self.hiddenCoverImage;
        copy.featureList = [self.featureList copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.itemsIdentifier = self.itemsIdentifier;
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

//
//  LWSItemData.m
//
//  Created by  半夏 on 2018/1/4
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "LWSItemData.h"



NSString *const kLWSItemDataAuthentic = @"authentic";
NSString *const kLWSItemDataFavorited = @"favorited";
NSString *const kLWSItemDataPurchaseStatus = @"purchase_status";
NSString *const kLWSItemDataId = @"id";
NSString *const kLWSItemDataCreatedAt = @"created_at";
NSString *const kLWSItemDataPurchaseId = @"purchase_id";
NSString *const kLWSItemDataEditorId = @"editor_id";
NSString *const kLWSItemDataImageUrls = @"image_urls";
NSString *const kLWSItemDataWebpUrls = @"webp_urls";
NSString *const kLWSItemDataRank = @"rank";
NSString *const kLWSItemDataUrl = @"url";
NSString *const kLWSItemDataPurchaseUrl = @"purchase_url";
NSString *const kLWSItemDataFavoritesCount = @"favorites_count";
NSString *const kLWSItemDataDescription = @"description";
NSString *const kLWSItemDataBrandId = @"brand_id";
NSString *const kLWSItemDataDetailHtml = @"detail_html";
NSString *const kLWSItemDataCoverImageUrl = @"cover_image_url";
NSString *const kLWSItemDataSharesCount = @"shares_count";
NSString *const kLWSItemDataPostIds = @"post_ids";
NSString *const kLWSItemDataCoverWebpUrl = @"cover_webp_url";
NSString *const kLWSItemDataCoverImageKey = @"cover_image_key";
NSString *const kLWSItemDataCommentsCount = @"comments_count";
NSString *const kLWSItemDataLiked = @"liked";
NSString *const kLWSItemDataSource = @"source";
NSString *const kLWSItemDataName = @"name";
NSString *const kLWSItemDataSubcategoryId = @"subcategory_id";
NSString *const kLWSItemDataPrice = @"price";
NSString *const kLWSItemDataPurchaseType = @"purchase_type";
NSString *const kLWSItemDataPurchaseShopId = @"purchase_shop_id";
NSString *const kLWSItemDataBrandOrder = @"brand_order";
NSString *const kLWSItemDataUpdatedAt = @"updated_at";
NSString *const kLWSItemDataKeywords = @"keywords";
NSString *const kLWSItemDataLikesCount = @"likes_count";
NSString *const kLWSItemDataCategoryId = @"category_id";
NSString *const kLWSItemDataShortDescription = @"short_description";
NSString *const kLWSItemDataAdMonitors = @"ad_monitors";


@interface LWSItemData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LWSItemData

@synthesize authentic = _authentic;
@synthesize favorited = _favorited;
@synthesize purchaseStatus = _purchaseStatus;
@synthesize itemDataIdentifier = _itemDataIdentifier;
@synthesize createdAt = _createdAt;
@synthesize purchaseId = _purchaseId;
@synthesize editorId = _editorId;
@synthesize imageUrls = _imageUrls;
@synthesize webpUrls = _webpUrls;
@synthesize rank = _rank;
@synthesize url = _url;
@synthesize purchaseUrl = _purchaseUrl;
@synthesize favoritesCount = _favoritesCount;
@synthesize itemDataDescription = _itemDataDescription;
@synthesize brandId = _brandId;
@synthesize detailHtml = _detailHtml;
@synthesize coverImageUrl = _coverImageUrl;
@synthesize sharesCount = _sharesCount;
@synthesize postIds = _postIds;
@synthesize coverWebpUrl = _coverWebpUrl;
@synthesize coverImageKey = _coverImageKey;
@synthesize commentsCount = _commentsCount;
@synthesize liked = _liked;
@synthesize source = _source;
@synthesize name = _name;
@synthesize subcategoryId = _subcategoryId;
@synthesize price = _price;
@synthesize purchaseType = _purchaseType;
@synthesize purchaseShopId = _purchaseShopId;
@synthesize brandOrder = _brandOrder;
@synthesize updatedAt = _updatedAt;
@synthesize keywords = _keywords;
@synthesize likesCount = _likesCount;
@synthesize categoryId = _categoryId;
@synthesize shortDescription = _shortDescription;
@synthesize adMonitors = _adMonitors;


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
            self.authentic = [self objectOrNilForKey:kLWSItemDataAuthentic fromDictionary:dict];
            self.favorited = [[self objectOrNilForKey:kLWSItemDataFavorited fromDictionary:dict] boolValue];
            self.purchaseStatus = [[self objectOrNilForKey:kLWSItemDataPurchaseStatus fromDictionary:dict] doubleValue];
            self.itemDataIdentifier = [[self objectOrNilForKey:kLWSItemDataId fromDictionary:dict] doubleValue];
            self.createdAt = [[self objectOrNilForKey:kLWSItemDataCreatedAt fromDictionary:dict] doubleValue];
            self.purchaseId = [self objectOrNilForKey:kLWSItemDataPurchaseId fromDictionary:dict];
            self.editorId = [[self objectOrNilForKey:kLWSItemDataEditorId fromDictionary:dict] doubleValue];
            self.imageUrls = [self objectOrNilForKey:kLWSItemDataImageUrls fromDictionary:dict];
            self.webpUrls = [self objectOrNilForKey:kLWSItemDataWebpUrls fromDictionary:dict];
            self.rank = [self objectOrNilForKey:kLWSItemDataRank fromDictionary:dict];
            self.url = [self objectOrNilForKey:kLWSItemDataUrl fromDictionary:dict];
            self.purchaseUrl = [self objectOrNilForKey:kLWSItemDataPurchaseUrl fromDictionary:dict];
            self.favoritesCount = [[self objectOrNilForKey:kLWSItemDataFavoritesCount fromDictionary:dict] doubleValue];
            self.itemDataDescription = [self objectOrNilForKey:kLWSItemDataDescription fromDictionary:dict];
            self.brandId = [self objectOrNilForKey:kLWSItemDataBrandId fromDictionary:dict];
            self.detailHtml = [self objectOrNilForKey:kLWSItemDataDetailHtml fromDictionary:dict];
            self.coverImageUrl = [self objectOrNilForKey:kLWSItemDataCoverImageUrl fromDictionary:dict];
            self.sharesCount = [[self objectOrNilForKey:kLWSItemDataSharesCount fromDictionary:dict] doubleValue];
            self.postIds = [self objectOrNilForKey:kLWSItemDataPostIds fromDictionary:dict];
            self.coverWebpUrl = [self objectOrNilForKey:kLWSItemDataCoverWebpUrl fromDictionary:dict];
            self.coverImageKey = [self objectOrNilForKey:kLWSItemDataCoverImageKey fromDictionary:dict];
            self.commentsCount = [[self objectOrNilForKey:kLWSItemDataCommentsCount fromDictionary:dict] doubleValue];
            self.liked = [[self objectOrNilForKey:kLWSItemDataLiked fromDictionary:dict] boolValue];
            self.source = [LWSSource modelObjectWithDictionary:[dict objectForKey:kLWSItemDataSource]];
            self.name = [self objectOrNilForKey:kLWSItemDataName fromDictionary:dict];
            self.subcategoryId = [self objectOrNilForKey:kLWSItemDataSubcategoryId fromDictionary:dict];
            self.price = [self objectOrNilForKey:kLWSItemDataPrice fromDictionary:dict];
            self.purchaseType = [[self objectOrNilForKey:kLWSItemDataPurchaseType fromDictionary:dict] doubleValue];
            self.purchaseShopId = [self objectOrNilForKey:kLWSItemDataPurchaseShopId fromDictionary:dict];
            self.brandOrder = [self objectOrNilForKey:kLWSItemDataBrandOrder fromDictionary:dict];
            self.updatedAt = [[self objectOrNilForKey:kLWSItemDataUpdatedAt fromDictionary:dict] doubleValue];
            self.keywords = [self objectOrNilForKey:kLWSItemDataKeywords fromDictionary:dict];
            self.likesCount = [[self objectOrNilForKey:kLWSItemDataLikesCount fromDictionary:dict] doubleValue];
            self.categoryId = [self objectOrNilForKey:kLWSItemDataCategoryId fromDictionary:dict];
            self.shortDescription = [self objectOrNilForKey:kLWSItemDataShortDescription fromDictionary:dict];
            self.adMonitors = [self objectOrNilForKey:kLWSItemDataAdMonitors fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.authentic forKey:kLWSItemDataAuthentic];
    [mutableDict setValue:[NSNumber numberWithBool:self.favorited] forKey:kLWSItemDataFavorited];
    [mutableDict setValue:[NSNumber numberWithDouble:self.purchaseStatus] forKey:kLWSItemDataPurchaseStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemDataIdentifier] forKey:kLWSItemDataId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdAt] forKey:kLWSItemDataCreatedAt];
    [mutableDict setValue:self.purchaseId forKey:kLWSItemDataPurchaseId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.editorId] forKey:kLWSItemDataEditorId];
    NSMutableArray *tempArrayForImageUrls = [NSMutableArray array];
    for (NSObject *subArrayObject in self.imageUrls) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForImageUrls addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForImageUrls addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForImageUrls] forKey:kLWSItemDataImageUrls];
    NSMutableArray *tempArrayForWebpUrls = [NSMutableArray array];
    for (NSObject *subArrayObject in self.webpUrls) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForWebpUrls addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForWebpUrls addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForWebpUrls] forKey:kLWSItemDataWebpUrls];
    [mutableDict setValue:self.rank forKey:kLWSItemDataRank];
    [mutableDict setValue:self.url forKey:kLWSItemDataUrl];
    [mutableDict setValue:self.purchaseUrl forKey:kLWSItemDataPurchaseUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.favoritesCount] forKey:kLWSItemDataFavoritesCount];
    [mutableDict setValue:self.itemDataDescription forKey:kLWSItemDataDescription];
    [mutableDict setValue:self.brandId forKey:kLWSItemDataBrandId];
    [mutableDict setValue:self.detailHtml forKey:kLWSItemDataDetailHtml];
    [mutableDict setValue:self.coverImageUrl forKey:kLWSItemDataCoverImageUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sharesCount] forKey:kLWSItemDataSharesCount];
    NSMutableArray *tempArrayForPostIds = [NSMutableArray array];
    for (NSObject *subArrayObject in self.postIds) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPostIds addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPostIds addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPostIds] forKey:kLWSItemDataPostIds];
    [mutableDict setValue:self.coverWebpUrl forKey:kLWSItemDataCoverWebpUrl];
    [mutableDict setValue:self.coverImageKey forKey:kLWSItemDataCoverImageKey];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentsCount] forKey:kLWSItemDataCommentsCount];
    [mutableDict setValue:[NSNumber numberWithBool:self.liked] forKey:kLWSItemDataLiked];
    [mutableDict setValue:[self.source dictionaryRepresentation] forKey:kLWSItemDataSource];
    [mutableDict setValue:self.name forKey:kLWSItemDataName];
    [mutableDict setValue:self.subcategoryId forKey:kLWSItemDataSubcategoryId];
    [mutableDict setValue:self.price forKey:kLWSItemDataPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.purchaseType] forKey:kLWSItemDataPurchaseType];
    [mutableDict setValue:self.purchaseShopId forKey:kLWSItemDataPurchaseShopId];
    [mutableDict setValue:self.brandOrder forKey:kLWSItemDataBrandOrder];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updatedAt] forKey:kLWSItemDataUpdatedAt];
    [mutableDict setValue:self.keywords forKey:kLWSItemDataKeywords];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likesCount] forKey:kLWSItemDataLikesCount];
    [mutableDict setValue:self.categoryId forKey:kLWSItemDataCategoryId];
    [mutableDict setValue:self.shortDescription forKey:kLWSItemDataShortDescription];
    [mutableDict setValue:self.adMonitors forKey:kLWSItemDataAdMonitors];

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

    self.authentic = [aDecoder decodeObjectForKey:kLWSItemDataAuthentic];
    self.favorited = [aDecoder decodeBoolForKey:kLWSItemDataFavorited];
    self.purchaseStatus = [aDecoder decodeDoubleForKey:kLWSItemDataPurchaseStatus];
    self.itemDataIdentifier = [aDecoder decodeDoubleForKey:kLWSItemDataId];
    self.createdAt = [aDecoder decodeDoubleForKey:kLWSItemDataCreatedAt];
    self.purchaseId = [aDecoder decodeObjectForKey:kLWSItemDataPurchaseId];
    self.editorId = [aDecoder decodeDoubleForKey:kLWSItemDataEditorId];
    self.imageUrls = [aDecoder decodeObjectForKey:kLWSItemDataImageUrls];
    self.webpUrls = [aDecoder decodeObjectForKey:kLWSItemDataWebpUrls];
    self.rank = [aDecoder decodeObjectForKey:kLWSItemDataRank];
    self.url = [aDecoder decodeObjectForKey:kLWSItemDataUrl];
    self.purchaseUrl = [aDecoder decodeObjectForKey:kLWSItemDataPurchaseUrl];
    self.favoritesCount = [aDecoder decodeDoubleForKey:kLWSItemDataFavoritesCount];
    self.itemDataDescription = [aDecoder decodeObjectForKey:kLWSItemDataDescription];
    self.brandId = [aDecoder decodeObjectForKey:kLWSItemDataBrandId];
    self.detailHtml = [aDecoder decodeObjectForKey:kLWSItemDataDetailHtml];
    self.coverImageUrl = [aDecoder decodeObjectForKey:kLWSItemDataCoverImageUrl];
    self.sharesCount = [aDecoder decodeDoubleForKey:kLWSItemDataSharesCount];
    self.postIds = [aDecoder decodeObjectForKey:kLWSItemDataPostIds];
    self.coverWebpUrl = [aDecoder decodeObjectForKey:kLWSItemDataCoverWebpUrl];
    self.coverImageKey = [aDecoder decodeObjectForKey:kLWSItemDataCoverImageKey];
    self.commentsCount = [aDecoder decodeDoubleForKey:kLWSItemDataCommentsCount];
    self.liked = [aDecoder decodeBoolForKey:kLWSItemDataLiked];
    self.source = [aDecoder decodeObjectForKey:kLWSItemDataSource];
    self.name = [aDecoder decodeObjectForKey:kLWSItemDataName];
    self.subcategoryId = [aDecoder decodeObjectForKey:kLWSItemDataSubcategoryId];
    self.price = [aDecoder decodeObjectForKey:kLWSItemDataPrice];
    self.purchaseType = [aDecoder decodeDoubleForKey:kLWSItemDataPurchaseType];
    self.purchaseShopId = [aDecoder decodeObjectForKey:kLWSItemDataPurchaseShopId];
    self.brandOrder = [aDecoder decodeObjectForKey:kLWSItemDataBrandOrder];
    self.updatedAt = [aDecoder decodeDoubleForKey:kLWSItemDataUpdatedAt];
    self.keywords = [aDecoder decodeObjectForKey:kLWSItemDataKeywords];
    self.likesCount = [aDecoder decodeDoubleForKey:kLWSItemDataLikesCount];
    self.categoryId = [aDecoder decodeObjectForKey:kLWSItemDataCategoryId];
    self.shortDescription = [aDecoder decodeObjectForKey:kLWSItemDataShortDescription];
    self.adMonitors = [aDecoder decodeObjectForKey:kLWSItemDataAdMonitors];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_authentic forKey:kLWSItemDataAuthentic];
    [aCoder encodeBool:_favorited forKey:kLWSItemDataFavorited];
    [aCoder encodeDouble:_purchaseStatus forKey:kLWSItemDataPurchaseStatus];
    [aCoder encodeDouble:_itemDataIdentifier forKey:kLWSItemDataId];
    [aCoder encodeDouble:_createdAt forKey:kLWSItemDataCreatedAt];
    [aCoder encodeObject:_purchaseId forKey:kLWSItemDataPurchaseId];
    [aCoder encodeDouble:_editorId forKey:kLWSItemDataEditorId];
    [aCoder encodeObject:_imageUrls forKey:kLWSItemDataImageUrls];
    [aCoder encodeObject:_webpUrls forKey:kLWSItemDataWebpUrls];
    [aCoder encodeObject:_rank forKey:kLWSItemDataRank];
    [aCoder encodeObject:_url forKey:kLWSItemDataUrl];
    [aCoder encodeObject:_purchaseUrl forKey:kLWSItemDataPurchaseUrl];
    [aCoder encodeDouble:_favoritesCount forKey:kLWSItemDataFavoritesCount];
    [aCoder encodeObject:_itemDataDescription forKey:kLWSItemDataDescription];
    [aCoder encodeObject:_brandId forKey:kLWSItemDataBrandId];
    [aCoder encodeObject:_detailHtml forKey:kLWSItemDataDetailHtml];
    [aCoder encodeObject:_coverImageUrl forKey:kLWSItemDataCoverImageUrl];
    [aCoder encodeDouble:_sharesCount forKey:kLWSItemDataSharesCount];
    [aCoder encodeObject:_postIds forKey:kLWSItemDataPostIds];
    [aCoder encodeObject:_coverWebpUrl forKey:kLWSItemDataCoverWebpUrl];
    [aCoder encodeObject:_coverImageKey forKey:kLWSItemDataCoverImageKey];
    [aCoder encodeDouble:_commentsCount forKey:kLWSItemDataCommentsCount];
    [aCoder encodeBool:_liked forKey:kLWSItemDataLiked];
    [aCoder encodeObject:_source forKey:kLWSItemDataSource];
    [aCoder encodeObject:_name forKey:kLWSItemDataName];
    [aCoder encodeObject:_subcategoryId forKey:kLWSItemDataSubcategoryId];
    [aCoder encodeObject:_price forKey:kLWSItemDataPrice];
    [aCoder encodeDouble:_purchaseType forKey:kLWSItemDataPurchaseType];
    [aCoder encodeObject:_purchaseShopId forKey:kLWSItemDataPurchaseShopId];
    [aCoder encodeObject:_brandOrder forKey:kLWSItemDataBrandOrder];
    [aCoder encodeDouble:_updatedAt forKey:kLWSItemDataUpdatedAt];
    [aCoder encodeObject:_keywords forKey:kLWSItemDataKeywords];
    [aCoder encodeDouble:_likesCount forKey:kLWSItemDataLikesCount];
    [aCoder encodeObject:_categoryId forKey:kLWSItemDataCategoryId];
    [aCoder encodeObject:_shortDescription forKey:kLWSItemDataShortDescription];
    [aCoder encodeObject:_adMonitors forKey:kLWSItemDataAdMonitors];
}

- (id)copyWithZone:(NSZone *)zone
{
    LWSItemData *copy = [[LWSItemData alloc] init];
    
    if (copy) {

        copy.authentic = [self.authentic copyWithZone:zone];
        copy.favorited = self.favorited;
        copy.purchaseStatus = self.purchaseStatus;
        copy.itemDataIdentifier = self.itemDataIdentifier;
        copy.createdAt = self.createdAt;
        copy.purchaseId = [self.purchaseId copyWithZone:zone];
        copy.editorId = self.editorId;
        copy.imageUrls = [self.imageUrls copyWithZone:zone];
        copy.webpUrls = [self.webpUrls copyWithZone:zone];
        copy.rank = [self.rank copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.purchaseUrl = [self.purchaseUrl copyWithZone:zone];
        copy.favoritesCount = self.favoritesCount;
        copy.itemDataDescription = [self.itemDataDescription copyWithZone:zone];
        copy.brandId = [self.brandId copyWithZone:zone];
        copy.detailHtml = [self.detailHtml copyWithZone:zone];
        copy.coverImageUrl = [self.coverImageUrl copyWithZone:zone];
        copy.sharesCount = self.sharesCount;
        copy.postIds = [self.postIds copyWithZone:zone];
        copy.coverWebpUrl = [self.coverWebpUrl copyWithZone:zone];
        copy.coverImageKey = [self.coverImageKey copyWithZone:zone];
        copy.commentsCount = self.commentsCount;
        copy.liked = self.liked;
        copy.source = [self.source copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.subcategoryId = [self.subcategoryId copyWithZone:zone];
        copy.price = [self.price copyWithZone:zone];
        copy.purchaseType = self.purchaseType;
        copy.purchaseShopId = [self.purchaseShopId copyWithZone:zone];
        copy.brandOrder = [self.brandOrder copyWithZone:zone];
        copy.updatedAt = self.updatedAt;
        copy.keywords = [self.keywords copyWithZone:zone];
        copy.likesCount = self.likesCount;
        copy.categoryId = [self.categoryId copyWithZone:zone];
        copy.shortDescription = [self.shortDescription copyWithZone:zone];
        copy.adMonitors = [self.adMonitors copyWithZone:zone];
    }
    
    return copy;
}


@end

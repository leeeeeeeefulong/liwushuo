//
//  LWSRecommendItems.m
//
//  Created by  半夏 on 2018/1/8
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "LWSRecommendItems.h"


NSString *const kLWSRecommendItemsDescription = @"description";
NSString *const kLWSRecommendItemsEditorId = @"editor_id";
NSString *const kLWSRecommendItemsUrl = @"url";
NSString *const kLWSRecommendItemsAdMonitors = @"ad_monitors";
NSString *const kLWSRecommendItemsPurchaseUrl = @"purchase_url";
NSString *const kLWSRecommendItemsUpdatedAt = @"updated_at";
NSString *const kLWSRecommendItemsImageUrls = @"image_urls";
NSString *const kLWSRecommendItemsWebpUrls = @"webp_urls";
NSString *const kLWSRecommendItemsCoverImageKey = @"cover_image_key";
NSString *const kLWSRecommendItemsPurchaseType = @"purchase_type";
NSString *const kLWSRecommendItemsKeywords = @"keywords";
NSString *const kLWSRecommendItemsBrandId = @"brand_id";
NSString *const kLWSRecommendItemsName = @"name";
NSString *const kLWSRecommendItemsTargetType = @"target_type";
NSString *const kLWSRecommendItemsPurchaseStatus = @"purchase_status";
NSString *const kLWSRecommendItemsPostIds = @"post_ids";
NSString *const kLWSRecommendItemsId = @"id";
NSString *const kLWSRecommendItemsFavoritesCount = @"favorites_count";
NSString *const kLWSRecommendItemsShortDescription = @"short_description";
NSString *const kLWSRecommendItemsPurchaseShopId = @"purchase_shop_id";
NSString *const kLWSRecommendItemsPurchaseId = @"purchase_id";
NSString *const kLWSRecommendItemsBrandOrder = @"brand_order";
NSString *const kLWSRecommendItemsSubcategoryId = @"subcategory_id";
NSString *const kLWSRecommendItemsCreatedAt = @"created_at";
NSString *const kLWSRecommendItemsPrice = @"price";
NSString *const kLWSRecommendItemsCategoryId = @"category_id";
NSString *const kLWSRecommendItemsCoverWebpUrl = @"cover_webp_url";
NSString *const kLWSRecommendItemsCoverImageUrl = @"cover_image_url";


@interface LWSRecommendItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LWSRecommendItems

@synthesize recommendItemsDescription = _recommendItemsDescription;
@synthesize editorId = _editorId;
@synthesize url = _url;
@synthesize adMonitors = _adMonitors;
@synthesize purchaseUrl = _purchaseUrl;
@synthesize updatedAt = _updatedAt;
@synthesize imageUrls = _imageUrls;
@synthesize webpUrls = _webpUrls;
@synthesize coverImageKey = _coverImageKey;
@synthesize purchaseType = _purchaseType;
@synthesize keywords = _keywords;
@synthesize brandId = _brandId;
@synthesize name = _name;
@synthesize targetType = _targetType;
@synthesize purchaseStatus = _purchaseStatus;
@synthesize postIds = _postIds;
@synthesize recommendItemsIdentifier = _recommendItemsIdentifier;
@synthesize favoritesCount = _favoritesCount;
@synthesize shortDescription = _shortDescription;
@synthesize purchaseShopId = _purchaseShopId;
@synthesize purchaseId = _purchaseId;
@synthesize brandOrder = _brandOrder;
@synthesize subcategoryId = _subcategoryId;
@synthesize createdAt = _createdAt;
@synthesize price = _price;
@synthesize categoryId = _categoryId;
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
            self.recommendItemsDescription = [self objectOrNilForKey:kLWSRecommendItemsDescription fromDictionary:dict];
            self.editorId = [[self objectOrNilForKey:kLWSRecommendItemsEditorId fromDictionary:dict] doubleValue];
            self.url = [self objectOrNilForKey:kLWSRecommendItemsUrl fromDictionary:dict];
            self.adMonitors = [self objectOrNilForKey:kLWSRecommendItemsAdMonitors fromDictionary:dict];
            self.purchaseUrl = [self objectOrNilForKey:kLWSRecommendItemsPurchaseUrl fromDictionary:dict];
            self.updatedAt = [[self objectOrNilForKey:kLWSRecommendItemsUpdatedAt fromDictionary:dict] doubleValue];
            self.imageUrls = [self objectOrNilForKey:kLWSRecommendItemsImageUrls fromDictionary:dict];
            self.webpUrls = [self objectOrNilForKey:kLWSRecommendItemsWebpUrls fromDictionary:dict];
            self.coverImageKey = [self objectOrNilForKey:kLWSRecommendItemsCoverImageKey fromDictionary:dict];
            self.purchaseType = [[self objectOrNilForKey:kLWSRecommendItemsPurchaseType fromDictionary:dict] doubleValue];
            self.keywords = [self objectOrNilForKey:kLWSRecommendItemsKeywords fromDictionary:dict];
            self.brandId = [self objectOrNilForKey:kLWSRecommendItemsBrandId fromDictionary:dict];
            self.name = [self objectOrNilForKey:kLWSRecommendItemsName fromDictionary:dict];
            self.targetType = [self objectOrNilForKey:kLWSRecommendItemsTargetType fromDictionary:dict];
            self.purchaseStatus = [[self objectOrNilForKey:kLWSRecommendItemsPurchaseStatus fromDictionary:dict] doubleValue];
            self.postIds = [self objectOrNilForKey:kLWSRecommendItemsPostIds fromDictionary:dict];
            self.recommendItemsIdentifier = [[self objectOrNilForKey:kLWSRecommendItemsId fromDictionary:dict] doubleValue];
            self.favoritesCount = [[self objectOrNilForKey:kLWSRecommendItemsFavoritesCount fromDictionary:dict] doubleValue];
            self.shortDescription = [self objectOrNilForKey:kLWSRecommendItemsShortDescription fromDictionary:dict];
            self.purchaseShopId = [self objectOrNilForKey:kLWSRecommendItemsPurchaseShopId fromDictionary:dict];
            self.purchaseId = [self objectOrNilForKey:kLWSRecommendItemsPurchaseId fromDictionary:dict];
            self.brandOrder = [self objectOrNilForKey:kLWSRecommendItemsBrandOrder fromDictionary:dict];
            self.subcategoryId = [self objectOrNilForKey:kLWSRecommendItemsSubcategoryId fromDictionary:dict];
            self.createdAt = [[self objectOrNilForKey:kLWSRecommendItemsCreatedAt fromDictionary:dict] doubleValue];
            self.price = [self objectOrNilForKey:kLWSRecommendItemsPrice fromDictionary:dict];
            self.categoryId = [self objectOrNilForKey:kLWSRecommendItemsCategoryId fromDictionary:dict];
            self.coverWebpUrl = [self objectOrNilForKey:kLWSRecommendItemsCoverWebpUrl fromDictionary:dict];
            self.coverImageUrl = [self objectOrNilForKey:kLWSRecommendItemsCoverImageUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.recommendItemsDescription forKey:kLWSRecommendItemsDescription];
    [mutableDict setValue:[NSNumber numberWithDouble:self.editorId] forKey:kLWSRecommendItemsEditorId];
    [mutableDict setValue:self.url forKey:kLWSRecommendItemsUrl];
    [mutableDict setValue:self.adMonitors forKey:kLWSRecommendItemsAdMonitors];
    [mutableDict setValue:self.purchaseUrl forKey:kLWSRecommendItemsPurchaseUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updatedAt] forKey:kLWSRecommendItemsUpdatedAt];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForImageUrls] forKey:kLWSRecommendItemsImageUrls];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForWebpUrls] forKey:kLWSRecommendItemsWebpUrls];
    [mutableDict setValue:self.coverImageKey forKey:kLWSRecommendItemsCoverImageKey];
    [mutableDict setValue:[NSNumber numberWithDouble:self.purchaseType] forKey:kLWSRecommendItemsPurchaseType];
    [mutableDict setValue:self.keywords forKey:kLWSRecommendItemsKeywords];
    [mutableDict setValue:self.brandId forKey:kLWSRecommendItemsBrandId];
    [mutableDict setValue:self.name forKey:kLWSRecommendItemsName];
    [mutableDict setValue:self.targetType forKey:kLWSRecommendItemsTargetType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.purchaseStatus] forKey:kLWSRecommendItemsPurchaseStatus];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPostIds] forKey:kLWSRecommendItemsPostIds];
    [mutableDict setValue:[NSNumber numberWithDouble:self.recommendItemsIdentifier] forKey:kLWSRecommendItemsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.favoritesCount] forKey:kLWSRecommendItemsFavoritesCount];
    [mutableDict setValue:self.shortDescription forKey:kLWSRecommendItemsShortDescription];
    [mutableDict setValue:self.purchaseShopId forKey:kLWSRecommendItemsPurchaseShopId];
    [mutableDict setValue:self.purchaseId forKey:kLWSRecommendItemsPurchaseId];
    [mutableDict setValue:self.brandOrder forKey:kLWSRecommendItemsBrandOrder];
    [mutableDict setValue:self.subcategoryId forKey:kLWSRecommendItemsSubcategoryId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdAt] forKey:kLWSRecommendItemsCreatedAt];
    [mutableDict setValue:self.price forKey:kLWSRecommendItemsPrice];
    [mutableDict setValue:self.categoryId forKey:kLWSRecommendItemsCategoryId];
    [mutableDict setValue:self.coverWebpUrl forKey:kLWSRecommendItemsCoverWebpUrl];
    [mutableDict setValue:self.coverImageUrl forKey:kLWSRecommendItemsCoverImageUrl];

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

    self.recommendItemsDescription = [aDecoder decodeObjectForKey:kLWSRecommendItemsDescription];
    self.editorId = [aDecoder decodeDoubleForKey:kLWSRecommendItemsEditorId];
    self.url = [aDecoder decodeObjectForKey:kLWSRecommendItemsUrl];
    self.adMonitors = [aDecoder decodeObjectForKey:kLWSRecommendItemsAdMonitors];
    self.purchaseUrl = [aDecoder decodeObjectForKey:kLWSRecommendItemsPurchaseUrl];
    self.updatedAt = [aDecoder decodeDoubleForKey:kLWSRecommendItemsUpdatedAt];
    self.imageUrls = [aDecoder decodeObjectForKey:kLWSRecommendItemsImageUrls];
    self.webpUrls = [aDecoder decodeObjectForKey:kLWSRecommendItemsWebpUrls];
    self.coverImageKey = [aDecoder decodeObjectForKey:kLWSRecommendItemsCoverImageKey];
    self.purchaseType = [aDecoder decodeDoubleForKey:kLWSRecommendItemsPurchaseType];
    self.keywords = [aDecoder decodeObjectForKey:kLWSRecommendItemsKeywords];
    self.brandId = [aDecoder decodeObjectForKey:kLWSRecommendItemsBrandId];
    self.name = [aDecoder decodeObjectForKey:kLWSRecommendItemsName];
    self.targetType = [aDecoder decodeObjectForKey:kLWSRecommendItemsTargetType];
    self.purchaseStatus = [aDecoder decodeDoubleForKey:kLWSRecommendItemsPurchaseStatus];
    self.postIds = [aDecoder decodeObjectForKey:kLWSRecommendItemsPostIds];
    self.recommendItemsIdentifier = [aDecoder decodeDoubleForKey:kLWSRecommendItemsId];
    self.favoritesCount = [aDecoder decodeDoubleForKey:kLWSRecommendItemsFavoritesCount];
    self.shortDescription = [aDecoder decodeObjectForKey:kLWSRecommendItemsShortDescription];
    self.purchaseShopId = [aDecoder decodeObjectForKey:kLWSRecommendItemsPurchaseShopId];
    self.purchaseId = [aDecoder decodeObjectForKey:kLWSRecommendItemsPurchaseId];
    self.brandOrder = [aDecoder decodeObjectForKey:kLWSRecommendItemsBrandOrder];
    self.subcategoryId = [aDecoder decodeObjectForKey:kLWSRecommendItemsSubcategoryId];
    self.createdAt = [aDecoder decodeDoubleForKey:kLWSRecommendItemsCreatedAt];
    self.price = [aDecoder decodeObjectForKey:kLWSRecommendItemsPrice];
    self.categoryId = [aDecoder decodeObjectForKey:kLWSRecommendItemsCategoryId];
    self.coverWebpUrl = [aDecoder decodeObjectForKey:kLWSRecommendItemsCoverWebpUrl];
    self.coverImageUrl = [aDecoder decodeObjectForKey:kLWSRecommendItemsCoverImageUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_recommendItemsDescription forKey:kLWSRecommendItemsDescription];
    [aCoder encodeDouble:_editorId forKey:kLWSRecommendItemsEditorId];
    [aCoder encodeObject:_url forKey:kLWSRecommendItemsUrl];
    [aCoder encodeObject:_adMonitors forKey:kLWSRecommendItemsAdMonitors];
    [aCoder encodeObject:_purchaseUrl forKey:kLWSRecommendItemsPurchaseUrl];
    [aCoder encodeDouble:_updatedAt forKey:kLWSRecommendItemsUpdatedAt];
    [aCoder encodeObject:_imageUrls forKey:kLWSRecommendItemsImageUrls];
    [aCoder encodeObject:_webpUrls forKey:kLWSRecommendItemsWebpUrls];
    [aCoder encodeObject:_coverImageKey forKey:kLWSRecommendItemsCoverImageKey];
    [aCoder encodeDouble:_purchaseType forKey:kLWSRecommendItemsPurchaseType];
    [aCoder encodeObject:_keywords forKey:kLWSRecommendItemsKeywords];
    [aCoder encodeObject:_brandId forKey:kLWSRecommendItemsBrandId];
    [aCoder encodeObject:_name forKey:kLWSRecommendItemsName];
    [aCoder encodeObject:_targetType forKey:kLWSRecommendItemsTargetType];
    [aCoder encodeDouble:_purchaseStatus forKey:kLWSRecommendItemsPurchaseStatus];
    [aCoder encodeObject:_postIds forKey:kLWSRecommendItemsPostIds];
    [aCoder encodeDouble:_recommendItemsIdentifier forKey:kLWSRecommendItemsId];
    [aCoder encodeDouble:_favoritesCount forKey:kLWSRecommendItemsFavoritesCount];
    [aCoder encodeObject:_shortDescription forKey:kLWSRecommendItemsShortDescription];
    [aCoder encodeObject:_purchaseShopId forKey:kLWSRecommendItemsPurchaseShopId];
    [aCoder encodeObject:_purchaseId forKey:kLWSRecommendItemsPurchaseId];
    [aCoder encodeObject:_brandOrder forKey:kLWSRecommendItemsBrandOrder];
    [aCoder encodeObject:_subcategoryId forKey:kLWSRecommendItemsSubcategoryId];
    [aCoder encodeDouble:_createdAt forKey:kLWSRecommendItemsCreatedAt];
    [aCoder encodeObject:_price forKey:kLWSRecommendItemsPrice];
    [aCoder encodeObject:_categoryId forKey:kLWSRecommendItemsCategoryId];
    [aCoder encodeObject:_coverWebpUrl forKey:kLWSRecommendItemsCoverWebpUrl];
    [aCoder encodeObject:_coverImageUrl forKey:kLWSRecommendItemsCoverImageUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    LWSRecommendItems *copy = [[LWSRecommendItems alloc] init];
    
    if (copy) {

        copy.recommendItemsDescription = [self.recommendItemsDescription copyWithZone:zone];
        copy.editorId = self.editorId;
        copy.url = [self.url copyWithZone:zone];
        copy.adMonitors = [self.adMonitors copyWithZone:zone];
        copy.purchaseUrl = [self.purchaseUrl copyWithZone:zone];
        copy.updatedAt = self.updatedAt;
        copy.imageUrls = [self.imageUrls copyWithZone:zone];
        copy.webpUrls = [self.webpUrls copyWithZone:zone];
        copy.coverImageKey = [self.coverImageKey copyWithZone:zone];
        copy.purchaseType = self.purchaseType;
        copy.keywords = [self.keywords copyWithZone:zone];
        copy.brandId = [self.brandId copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.targetType = [self.targetType copyWithZone:zone];
        copy.purchaseStatus = self.purchaseStatus;
        copy.postIds = [self.postIds copyWithZone:zone];
        copy.recommendItemsIdentifier = self.recommendItemsIdentifier;
        copy.favoritesCount = self.favoritesCount;
        copy.shortDescription = [self.shortDescription copyWithZone:zone];
        copy.purchaseShopId = [self.purchaseShopId copyWithZone:zone];
        copy.purchaseId = [self.purchaseId copyWithZone:zone];
        copy.brandOrder = [self.brandOrder copyWithZone:zone];
        copy.subcategoryId = [self.subcategoryId copyWithZone:zone];
        copy.createdAt = self.createdAt;
        copy.price = [self.price copyWithZone:zone];
        copy.categoryId = [self.categoryId copyWithZone:zone];
        copy.coverWebpUrl = [self.coverWebpUrl copyWithZone:zone];
        copy.coverImageUrl = [self.coverImageUrl copyWithZone:zone];
    }
    
    return copy;
}


@end

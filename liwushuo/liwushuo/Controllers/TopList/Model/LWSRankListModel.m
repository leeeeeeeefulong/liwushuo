//
//  LWSItems.m
//
//  Created by  半夏 on 2017/12/13
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "LWSRankListModel.h"


NSString *const kLWSItemsCoverImageUrl = @"cover_image_url";
NSString *const kLWSItemsEditorId = @"editor_id";
NSString *const kLWSItemsUrl = @"url";
NSString *const kLWSItemsAdMonitors = @"ad_monitors";
NSString *const kLWSItemsPurchaseUrl = @"purchase_url";
NSString *const kLWSItemsUpdatedAt = @"updated_at";
NSString *const kLWSItemsImageUrls = @"image_urls";
NSString *const kLWSItemsCoverImageKey = @"cover_image_key";
NSString *const kLWSItemsPurchaseType = @"purchase_type";
NSString *const kLWSItemsKeywords = @"keywords";
NSString *const kLWSItemsBrandId = @"brand_id";
NSString *const kLWSItemsName = @"name";
NSString *const kLWSItemsTargetType = @"target_type";
NSString *const kLWSItemsPurchaseStatus = @"purchase_status";
NSString *const kLWSItemsPostIds = @"post_ids";
NSString *const kLWSItemsId = @"id";
NSString *const kLWSItemsFavoritesCount = @"favorites_count";
NSString *const kLWSItemsShortDescription = @"short_description";
NSString *const kLWSItemsPurchaseShopId = @"purchase_shop_id";
NSString *const kLWSItemsPurchaseId = @"purchase_id";
NSString *const kLWSItemsBrandOrder = @"brand_order";
NSString *const kLWSItemsSubcategoryId = @"subcategory_id";
NSString *const kLWSItemsCreatedAt = @"created_at";
NSString *const kLWSItemsPrice = @"price";
NSString *const kLWSItemsCategoryId = @"category_id";
NSString *const kLWSItemsCoverWebpUrl = @"cover_webp_url";
NSString *const kLWSItemsDescription = @"description";


@interface LWSRankListModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LWSRankListModel

@synthesize coverImageUrl = _coverImageUrl;
@synthesize editorId = _editorId;
@synthesize url = _url;
@synthesize adMonitors = _adMonitors;
@synthesize purchaseUrl = _purchaseUrl;
@synthesize updatedAt = _updatedAt;
@synthesize imageUrls = _imageUrls;
@synthesize coverImageKey = _coverImageKey;
@synthesize purchaseType = _purchaseType;
@synthesize keywords = _keywords;
@synthesize brandId = _brandId;
@synthesize name = _name;
@synthesize targetType = _targetType;
@synthesize purchaseStatus = _purchaseStatus;
@synthesize postIds = _postIds;
@synthesize itemsIdentifier = _itemsIdentifier;
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
@synthesize itemsDescription = _itemsDescription;


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
            self.coverImageUrl = [self objectOrNilForKey:kLWSItemsCoverImageUrl fromDictionary:dict];
            self.editorId = [[self objectOrNilForKey:kLWSItemsEditorId fromDictionary:dict] doubleValue];
            self.url = [self objectOrNilForKey:kLWSItemsUrl fromDictionary:dict];
            self.adMonitors = [self objectOrNilForKey:kLWSItemsAdMonitors fromDictionary:dict];
            self.purchaseUrl = [self objectOrNilForKey:kLWSItemsPurchaseUrl fromDictionary:dict];
            self.updatedAt = [[self objectOrNilForKey:kLWSItemsUpdatedAt fromDictionary:dict] doubleValue];
            self.imageUrls = [self objectOrNilForKey:kLWSItemsImageUrls fromDictionary:dict];
            self.coverImageKey = [self objectOrNilForKey:kLWSItemsCoverImageKey fromDictionary:dict];
            self.purchaseType = [[self objectOrNilForKey:kLWSItemsPurchaseType fromDictionary:dict] doubleValue];
            self.keywords = [self objectOrNilForKey:kLWSItemsKeywords fromDictionary:dict];
            self.brandId = [self objectOrNilForKey:kLWSItemsBrandId fromDictionary:dict];
            self.name = [self objectOrNilForKey:kLWSItemsName fromDictionary:dict];
            self.targetType = [self objectOrNilForKey:kLWSItemsTargetType fromDictionary:dict];
            self.purchaseStatus = [[self objectOrNilForKey:kLWSItemsPurchaseStatus fromDictionary:dict] doubleValue];
            self.postIds = [self objectOrNilForKey:kLWSItemsPostIds fromDictionary:dict];
            self.itemsIdentifier = [[self objectOrNilForKey:kLWSItemsId fromDictionary:dict] doubleValue];
            self.favoritesCount = [[self objectOrNilForKey:kLWSItemsFavoritesCount fromDictionary:dict] doubleValue];
            self.shortDescription = [self objectOrNilForKey:kLWSItemsShortDescription fromDictionary:dict];
            self.purchaseShopId = [self objectOrNilForKey:kLWSItemsPurchaseShopId fromDictionary:dict];
            self.purchaseId = [self objectOrNilForKey:kLWSItemsPurchaseId fromDictionary:dict];
            self.brandOrder = [self objectOrNilForKey:kLWSItemsBrandOrder fromDictionary:dict];
            self.subcategoryId = [self objectOrNilForKey:kLWSItemsSubcategoryId fromDictionary:dict];
            self.createdAt = [[self objectOrNilForKey:kLWSItemsCreatedAt fromDictionary:dict] doubleValue];
            self.price = [self objectOrNilForKey:kLWSItemsPrice fromDictionary:dict];
            self.categoryId = [self objectOrNilForKey:kLWSItemsCategoryId fromDictionary:dict];
            self.coverWebpUrl = [self objectOrNilForKey:kLWSItemsCoverWebpUrl fromDictionary:dict];
            self.itemsDescription = [self objectOrNilForKey:kLWSItemsDescription fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.coverImageUrl forKey:kLWSItemsCoverImageUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.editorId] forKey:kLWSItemsEditorId];
    [mutableDict setValue:self.url forKey:kLWSItemsUrl];
    [mutableDict setValue:self.adMonitors forKey:kLWSItemsAdMonitors];
    [mutableDict setValue:self.purchaseUrl forKey:kLWSItemsPurchaseUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updatedAt] forKey:kLWSItemsUpdatedAt];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForImageUrls] forKey:kLWSItemsImageUrls];
    [mutableDict setValue:self.coverImageKey forKey:kLWSItemsCoverImageKey];
    [mutableDict setValue:[NSNumber numberWithDouble:self.purchaseType] forKey:kLWSItemsPurchaseType];
    [mutableDict setValue:self.keywords forKey:kLWSItemsKeywords];
    [mutableDict setValue:self.brandId forKey:kLWSItemsBrandId];
    [mutableDict setValue:self.name forKey:kLWSItemsName];
    [mutableDict setValue:self.targetType forKey:kLWSItemsTargetType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.purchaseStatus] forKey:kLWSItemsPurchaseStatus];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPostIds] forKey:kLWSItemsPostIds];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemsIdentifier] forKey:kLWSItemsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.favoritesCount] forKey:kLWSItemsFavoritesCount];
    [mutableDict setValue:self.shortDescription forKey:kLWSItemsShortDescription];
    [mutableDict setValue:self.purchaseShopId forKey:kLWSItemsPurchaseShopId];
    [mutableDict setValue:self.purchaseId forKey:kLWSItemsPurchaseId];
    [mutableDict setValue:self.brandOrder forKey:kLWSItemsBrandOrder];
    [mutableDict setValue:self.subcategoryId forKey:kLWSItemsSubcategoryId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdAt] forKey:kLWSItemsCreatedAt];
    [mutableDict setValue:self.price forKey:kLWSItemsPrice];
    [mutableDict setValue:self.categoryId forKey:kLWSItemsCategoryId];
    [mutableDict setValue:self.coverWebpUrl forKey:kLWSItemsCoverWebpUrl];
    [mutableDict setValue:self.itemsDescription forKey:kLWSItemsDescription];

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

    self.coverImageUrl = [aDecoder decodeObjectForKey:kLWSItemsCoverImageUrl];
    self.editorId = [aDecoder decodeDoubleForKey:kLWSItemsEditorId];
    self.url = [aDecoder decodeObjectForKey:kLWSItemsUrl];
    self.adMonitors = [aDecoder decodeObjectForKey:kLWSItemsAdMonitors];
    self.purchaseUrl = [aDecoder decodeObjectForKey:kLWSItemsPurchaseUrl];
    self.updatedAt = [aDecoder decodeDoubleForKey:kLWSItemsUpdatedAt];
    self.imageUrls = [aDecoder decodeObjectForKey:kLWSItemsImageUrls];
    self.coverImageKey = [aDecoder decodeObjectForKey:kLWSItemsCoverImageKey];
    self.purchaseType = [aDecoder decodeDoubleForKey:kLWSItemsPurchaseType];
    self.keywords = [aDecoder decodeObjectForKey:kLWSItemsKeywords];
    self.brandId = [aDecoder decodeObjectForKey:kLWSItemsBrandId];
    self.name = [aDecoder decodeObjectForKey:kLWSItemsName];
    self.targetType = [aDecoder decodeObjectForKey:kLWSItemsTargetType];
    self.purchaseStatus = [aDecoder decodeDoubleForKey:kLWSItemsPurchaseStatus];
    self.postIds = [aDecoder decodeObjectForKey:kLWSItemsPostIds];
    self.itemsIdentifier = [aDecoder decodeDoubleForKey:kLWSItemsId];
    self.favoritesCount = [aDecoder decodeDoubleForKey:kLWSItemsFavoritesCount];
    self.shortDescription = [aDecoder decodeObjectForKey:kLWSItemsShortDescription];
    self.purchaseShopId = [aDecoder decodeObjectForKey:kLWSItemsPurchaseShopId];
    self.purchaseId = [aDecoder decodeObjectForKey:kLWSItemsPurchaseId];
    self.brandOrder = [aDecoder decodeObjectForKey:kLWSItemsBrandOrder];
    self.subcategoryId = [aDecoder decodeObjectForKey:kLWSItemsSubcategoryId];
    self.createdAt = [aDecoder decodeDoubleForKey:kLWSItemsCreatedAt];
    self.price = [aDecoder decodeObjectForKey:kLWSItemsPrice];
    self.categoryId = [aDecoder decodeObjectForKey:kLWSItemsCategoryId];
    self.coverWebpUrl = [aDecoder decodeObjectForKey:kLWSItemsCoverWebpUrl];
    self.itemsDescription = [aDecoder decodeObjectForKey:kLWSItemsDescription];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_coverImageUrl forKey:kLWSItemsCoverImageUrl];
    [aCoder encodeDouble:_editorId forKey:kLWSItemsEditorId];
    [aCoder encodeObject:_url forKey:kLWSItemsUrl];
    [aCoder encodeObject:_adMonitors forKey:kLWSItemsAdMonitors];
    [aCoder encodeObject:_purchaseUrl forKey:kLWSItemsPurchaseUrl];
    [aCoder encodeDouble:_updatedAt forKey:kLWSItemsUpdatedAt];
    [aCoder encodeObject:_imageUrls forKey:kLWSItemsImageUrls];
    [aCoder encodeObject:_coverImageKey forKey:kLWSItemsCoverImageKey];
    [aCoder encodeDouble:_purchaseType forKey:kLWSItemsPurchaseType];
    [aCoder encodeObject:_keywords forKey:kLWSItemsKeywords];
    [aCoder encodeObject:_brandId forKey:kLWSItemsBrandId];
    [aCoder encodeObject:_name forKey:kLWSItemsName];
    [aCoder encodeObject:_targetType forKey:kLWSItemsTargetType];
    [aCoder encodeDouble:_purchaseStatus forKey:kLWSItemsPurchaseStatus];
    [aCoder encodeObject:_postIds forKey:kLWSItemsPostIds];
    [aCoder encodeDouble:_itemsIdentifier forKey:kLWSItemsId];
    [aCoder encodeDouble:_favoritesCount forKey:kLWSItemsFavoritesCount];
    [aCoder encodeObject:_shortDescription forKey:kLWSItemsShortDescription];
    [aCoder encodeObject:_purchaseShopId forKey:kLWSItemsPurchaseShopId];
    [aCoder encodeObject:_purchaseId forKey:kLWSItemsPurchaseId];
    [aCoder encodeObject:_brandOrder forKey:kLWSItemsBrandOrder];
    [aCoder encodeObject:_subcategoryId forKey:kLWSItemsSubcategoryId];
    [aCoder encodeDouble:_createdAt forKey:kLWSItemsCreatedAt];
    [aCoder encodeObject:_price forKey:kLWSItemsPrice];
    [aCoder encodeObject:_categoryId forKey:kLWSItemsCategoryId];
    [aCoder encodeObject:_coverWebpUrl forKey:kLWSItemsCoverWebpUrl];
    [aCoder encodeObject:_itemsDescription forKey:kLWSItemsDescription];
}

- (id)copyWithZone:(NSZone *)zone
{
    LWSRankListModel *copy = [[LWSRankListModel alloc] init];
    
    if (copy) {

        copy.coverImageUrl = [self.coverImageUrl copyWithZone:zone];
        copy.editorId = self.editorId;
        copy.url = [self.url copyWithZone:zone];
        copy.adMonitors = [self.adMonitors copyWithZone:zone];
        copy.purchaseUrl = [self.purchaseUrl copyWithZone:zone];
        copy.updatedAt = self.updatedAt;
        copy.imageUrls = [self.imageUrls copyWithZone:zone];
        copy.coverImageKey = [self.coverImageKey copyWithZone:zone];
        copy.purchaseType = self.purchaseType;
        copy.keywords = [self.keywords copyWithZone:zone];
        copy.brandId = [self.brandId copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.targetType = [self.targetType copyWithZone:zone];
        copy.purchaseStatus = self.purchaseStatus;
        copy.postIds = [self.postIds copyWithZone:zone];
        copy.itemsIdentifier = self.itemsIdentifier;
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
        copy.itemsDescription = [self.itemsDescription copyWithZone:zone];
    }
    
    return copy;
}


@end

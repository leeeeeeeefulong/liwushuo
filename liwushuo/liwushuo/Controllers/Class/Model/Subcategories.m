//
//  Subcategories.m
//
//  Created by  半夏 on 2017/12/15
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Subcategories.h"


NSString *const kSubcategoriesStatus = @"status";
NSString *const kSubcategoriesId = @"id";
NSString *const kSubcategoriesItemsCount = @"items_count";
NSString *const kSubcategoriesOrder = @"order";
NSString *const kSubcategoriesIconUrl = @"icon_url";
NSString *const kSubcategoriesParentId = @"parent_id";
NSString *const kSubcategoriesName = @"name";


@interface Subcategories ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Subcategories

@synthesize status = _status;
@synthesize subcategoriesIdentifier = _subcategoriesIdentifier;
@synthesize itemsCount = _itemsCount;
@synthesize order = _order;
@synthesize iconUrl = _iconUrl;
@synthesize parentId = _parentId;
@synthesize name = _name;


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
            self.status = [[self objectOrNilForKey:kSubcategoriesStatus fromDictionary:dict] doubleValue];
            self.subcategoriesIdentifier = [[self objectOrNilForKey:kSubcategoriesId fromDictionary:dict] doubleValue];
            self.itemsCount = [[self objectOrNilForKey:kSubcategoriesItemsCount fromDictionary:dict] doubleValue];
            self.order = [[self objectOrNilForKey:kSubcategoriesOrder fromDictionary:dict] doubleValue];
            self.iconUrl = [self objectOrNilForKey:kSubcategoriesIconUrl fromDictionary:dict];
            self.parentId = [[self objectOrNilForKey:kSubcategoriesParentId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kSubcategoriesName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kSubcategoriesStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.subcategoriesIdentifier] forKey:kSubcategoriesId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemsCount] forKey:kSubcategoriesItemsCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.order] forKey:kSubcategoriesOrder];
    [mutableDict setValue:self.iconUrl forKey:kSubcategoriesIconUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.parentId] forKey:kSubcategoriesParentId];
    [mutableDict setValue:self.name forKey:kSubcategoriesName];

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

    self.status = [aDecoder decodeDoubleForKey:kSubcategoriesStatus];
    self.subcategoriesIdentifier = [aDecoder decodeDoubleForKey:kSubcategoriesId];
    self.itemsCount = [aDecoder decodeDoubleForKey:kSubcategoriesItemsCount];
    self.order = [aDecoder decodeDoubleForKey:kSubcategoriesOrder];
    self.iconUrl = [aDecoder decodeObjectForKey:kSubcategoriesIconUrl];
    self.parentId = [aDecoder decodeDoubleForKey:kSubcategoriesParentId];
    self.name = [aDecoder decodeObjectForKey:kSubcategoriesName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_status forKey:kSubcategoriesStatus];
    [aCoder encodeDouble:_subcategoriesIdentifier forKey:kSubcategoriesId];
    [aCoder encodeDouble:_itemsCount forKey:kSubcategoriesItemsCount];
    [aCoder encodeDouble:_order forKey:kSubcategoriesOrder];
    [aCoder encodeObject:_iconUrl forKey:kSubcategoriesIconUrl];
    [aCoder encodeDouble:_parentId forKey:kSubcategoriesParentId];
    [aCoder encodeObject:_name forKey:kSubcategoriesName];
}

- (id)copyWithZone:(NSZone *)zone
{
    Subcategories *copy = [[Subcategories alloc] init];
    
    if (copy) {

        copy.status = self.status;
        copy.subcategoriesIdentifier = self.subcategoriesIdentifier;
        copy.itemsCount = self.itemsCount;
        copy.order = self.order;
        copy.iconUrl = [self.iconUrl copyWithZone:zone];
        copy.parentId = self.parentId;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end

//
//  Categories.m
//
//  Created by  半夏 on 2017/12/15
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Categories.h"



NSString *const kCategoriesStatus = @"status";
NSString *const kCategoriesId = @"id";
NSString *const kCategoriesIconUrl = @"icon_url";
NSString *const kCategoriesOrder = @"order";
NSString *const kCategoriesName = @"name";
NSString *const kCategoriesSubcategories = @"subcategories";


@interface Categories ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Categories

@synthesize status = _status;
@synthesize categoriesIdentifier = _categoriesIdentifier;
@synthesize iconUrl = _iconUrl;
@synthesize order = _order;
@synthesize name = _name;
@synthesize subcategories = _subcategories;


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
            self.status = [[self objectOrNilForKey:kCategoriesStatus fromDictionary:dict] doubleValue];
            self.categoriesIdentifier = [[self objectOrNilForKey:kCategoriesId fromDictionary:dict] doubleValue];
            self.iconUrl = [self objectOrNilForKey:kCategoriesIconUrl fromDictionary:dict];
            self.order = [[self objectOrNilForKey:kCategoriesOrder fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kCategoriesName fromDictionary:dict];
    NSObject *receivedSubcategories = [dict objectForKey:kCategoriesSubcategories];
    NSMutableArray *parsedSubcategories = [NSMutableArray array];
    if ([receivedSubcategories isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSubcategories) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSubcategories addObject:[Subcategories modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSubcategories isKindOfClass:[NSDictionary class]]) {
       [parsedSubcategories addObject:[Subcategories modelObjectWithDictionary:(NSDictionary *)receivedSubcategories]];
    }

    self.subcategories = [NSArray arrayWithArray:parsedSubcategories];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kCategoriesStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categoriesIdentifier] forKey:kCategoriesId];
    [mutableDict setValue:self.iconUrl forKey:kCategoriesIconUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.order] forKey:kCategoriesOrder];
    [mutableDict setValue:self.name forKey:kCategoriesName];
    NSMutableArray *tempArrayForSubcategories = [NSMutableArray array];
    for (NSObject *subArrayObject in self.subcategories) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSubcategories addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSubcategories addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSubcategories] forKey:kCategoriesSubcategories];

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

    self.status = [aDecoder decodeDoubleForKey:kCategoriesStatus];
    self.categoriesIdentifier = [aDecoder decodeDoubleForKey:kCategoriesId];
    self.iconUrl = [aDecoder decodeObjectForKey:kCategoriesIconUrl];
    self.order = [aDecoder decodeDoubleForKey:kCategoriesOrder];
    self.name = [aDecoder decodeObjectForKey:kCategoriesName];
    self.subcategories = [aDecoder decodeObjectForKey:kCategoriesSubcategories];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_status forKey:kCategoriesStatus];
    [aCoder encodeDouble:_categoriesIdentifier forKey:kCategoriesId];
    [aCoder encodeObject:_iconUrl forKey:kCategoriesIconUrl];
    [aCoder encodeDouble:_order forKey:kCategoriesOrder];
    [aCoder encodeObject:_name forKey:kCategoriesName];
    [aCoder encodeObject:_subcategories forKey:kCategoriesSubcategories];
}

- (id)copyWithZone:(NSZone *)zone
{
    Categories *copy = [[Categories alloc] init];
    
    if (copy) {

        copy.status = self.status;
        copy.categoriesIdentifier = self.categoriesIdentifier;
        copy.iconUrl = [self.iconUrl copyWithZone:zone];
        copy.order = self.order;
        copy.name = [self.name copyWithZone:zone];
        copy.subcategories = [self.subcategories copyWithZone:zone];
    }
    
    return copy;
}


@end

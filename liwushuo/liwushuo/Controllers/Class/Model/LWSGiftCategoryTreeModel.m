//
//  Data.m
//
//  Created by  半夏 on 2017/12/15
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "LWSGiftCategoryTreeModel.h"



NSString *const kDataCategories = @"categories";


@interface LWSGiftCategoryTreeModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LWSGiftCategoryTreeModel

@synthesize categories = _categories;


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
    NSObject *receivedCategories = [dict objectForKey:kDataCategories];
    NSMutableArray *parsedCategories = [NSMutableArray array];
    if ([receivedCategories isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCategories) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCategories addObject:[Categories modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCategories isKindOfClass:[NSDictionary class]]) {
       [parsedCategories addObject:[Categories modelObjectWithDictionary:(NSDictionary *)receivedCategories]];
    }

    self.categories = [NSArray arrayWithArray:parsedCategories];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForCategories = [NSMutableArray array];
    for (NSObject *subArrayObject in self.categories) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCategories addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCategories addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCategories] forKey:kDataCategories];

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

    self.categories = [aDecoder decodeObjectForKey:kDataCategories];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_categories forKey:kDataCategories];
}

- (id)copyWithZone:(NSZone *)zone
{
    LWSGiftCategoryTreeModel *copy = [[LWSGiftCategoryTreeModel alloc] init];
    
    if (copy) {

        copy.categories = [self.categories copyWithZone:zone];
    }
    
    return copy;
}


@end

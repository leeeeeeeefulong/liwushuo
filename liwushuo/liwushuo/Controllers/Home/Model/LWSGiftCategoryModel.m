//
//  Data.m
//
//  Created by  半夏 on 2017/12/11
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "LWSGiftCategoryModel.h"
#import "Items.h"
#import "Paging.h"

NSString *const kDataItems = @"items";
NSString *const kDataPaging = @"paging";

@interface LWSGiftCategoryModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LWSGiftCategoryModel

@synthesize items = _items;
@synthesize paging = _paging;

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
    NSObject *receivedItems = [dict objectForKey:kDataItems];
    NSMutableArray *parsedItems = [NSMutableArray array];
    if ([receivedItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedItems addObject:[Items modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedItems isKindOfClass:[NSDictionary class]]) {
       [parsedItems addObject:[Items modelObjectWithDictionary:(NSDictionary *)receivedItems]];
    }

    self.items = [NSArray arrayWithArray:parsedItems];
            self.paging = [Paging modelObjectWithDictionary:[dict objectForKey:kDataPaging]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForItems = [NSMutableArray array];
    for (NSObject *subArrayObject in self.items) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kDataItems];
    [mutableDict setValue:[self.paging dictionaryRepresentation] forKey:kDataPaging];

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

    self.items = [aDecoder decodeObjectForKey:kDataItems];
    self.paging = [aDecoder decodeObjectForKey:kDataPaging];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_items forKey:kDataItems];
    [aCoder encodeObject:_paging forKey:kDataPaging];
}

- (id)copyWithZone:(NSZone *)zone
{
    LWSGiftCategoryModel *copy = [[LWSGiftCategoryModel alloc] init];
    
    if (copy) {

        copy.items = [self.items copyWithZone:zone];
        copy.paging = [self.paging copyWithZone:zone];
    }
    
    return copy;
}


@end

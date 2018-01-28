//
//  LWSMineViewModel.m
//
//  Created by  半夏 on 2017/12/29
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "LWSMineViewModel.h"
#import "LWSFavoriteLists.h"
#import "LWSPaging.h"


NSString *const kLWSMineViewModelFavoriteLists = @"favorite_lists";
NSString *const kLWSMineViewModelPaging = @"paging";


@interface LWSMineViewModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LWSMineViewModel

@synthesize favoriteLists = _favoriteLists;
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
    NSObject *receivedLWSFavoriteLists = [dict objectForKey:kLWSMineViewModelFavoriteLists];
    NSMutableArray *parsedLWSFavoriteLists = [NSMutableArray array];
    if ([receivedLWSFavoriteLists isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedLWSFavoriteLists) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedLWSFavoriteLists addObject:[LWSFavoriteLists modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedLWSFavoriteLists isKindOfClass:[NSDictionary class]]) {
       [parsedLWSFavoriteLists addObject:[LWSFavoriteLists modelObjectWithDictionary:(NSDictionary *)receivedLWSFavoriteLists]];
    }

    self.favoriteLists = [NSArray arrayWithArray:parsedLWSFavoriteLists];
            self.paging = [LWSPaging modelObjectWithDictionary:[dict objectForKey:kLWSMineViewModelPaging]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForFavoriteLists = [NSMutableArray array];
    for (NSObject *subArrayObject in self.favoriteLists) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForFavoriteLists addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForFavoriteLists addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForFavoriteLists] forKey:kLWSMineViewModelFavoriteLists];
    [mutableDict setValue:[self.paging dictionaryRepresentation] forKey:kLWSMineViewModelPaging];

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

    self.favoriteLists = [aDecoder decodeObjectForKey:kLWSMineViewModelFavoriteLists];
    self.paging = [aDecoder decodeObjectForKey:kLWSMineViewModelPaging];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_favoriteLists forKey:kLWSMineViewModelFavoriteLists];
    [aCoder encodeObject:_paging forKey:kLWSMineViewModelPaging];
}

- (id)copyWithZone:(NSZone *)zone
{
    LWSMineViewModel *copy = [[LWSMineViewModel alloc] init];
    
    if (copy) {

        copy.favoriteLists = [self.favoriteLists copyWithZone:zone];
        copy.paging = [self.paging copyWithZone:zone];
    }
    
    return copy;
}


@end

//
//  LWSRecommendData.m
//
//  Created by  半夏 on 2018/1/8
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "LWSRecommendData.h"



NSString *const kLWSRecommendDataRecommendItems = @"recommend_items";
NSString *const kLWSRecommendDataRecommendPosts = @"recommend_posts";


@interface LWSRecommendData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LWSRecommendData

@synthesize recommendItems = _recommendItems;
@synthesize recommendPosts = _recommendPosts;


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
    NSObject *receivedLWSRecommendItems = [dict objectForKey:kLWSRecommendDataRecommendItems];
    NSMutableArray *parsedLWSRecommendItems = [NSMutableArray array];
    if ([receivedLWSRecommendItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedLWSRecommendItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedLWSRecommendItems addObject:[LWSRecommendItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedLWSRecommendItems isKindOfClass:[NSDictionary class]]) {
       [parsedLWSRecommendItems addObject:[LWSRecommendItems modelObjectWithDictionary:(NSDictionary *)receivedLWSRecommendItems]];
    }

    self.recommendItems = [NSArray arrayWithArray:parsedLWSRecommendItems];
    NSObject *receivedLWSRecommendPosts = [dict objectForKey:kLWSRecommendDataRecommendPosts];
    NSMutableArray *parsedLWSRecommendPosts = [NSMutableArray array];
    if ([receivedLWSRecommendPosts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedLWSRecommendPosts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedLWSRecommendPosts addObject:[LWSRecommendPosts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedLWSRecommendPosts isKindOfClass:[NSDictionary class]]) {
       [parsedLWSRecommendPosts addObject:[LWSRecommendPosts modelObjectWithDictionary:(NSDictionary *)receivedLWSRecommendPosts]];
    }

    self.recommendPosts = [NSArray arrayWithArray:parsedLWSRecommendPosts];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForRecommendItems = [NSMutableArray array];
    for (NSObject *subArrayObject in self.recommendItems) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForRecommendItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForRecommendItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForRecommendItems] forKey:kLWSRecommendDataRecommendItems];
    NSMutableArray *tempArrayForRecommendPosts = [NSMutableArray array];
    for (NSObject *subArrayObject in self.recommendPosts) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForRecommendPosts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForRecommendPosts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForRecommendPosts] forKey:kLWSRecommendDataRecommendPosts];

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

    self.recommendItems = [aDecoder decodeObjectForKey:kLWSRecommendDataRecommendItems];
    self.recommendPosts = [aDecoder decodeObjectForKey:kLWSRecommendDataRecommendPosts];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_recommendItems forKey:kLWSRecommendDataRecommendItems];
    [aCoder encodeObject:_recommendPosts forKey:kLWSRecommendDataRecommendPosts];
}

- (id)copyWithZone:(NSZone *)zone
{
    LWSRecommendData *copy = [[LWSRecommendData alloc] init];
    
    if (copy) {

        copy.recommendItems = [self.recommendItems copyWithZone:zone];
        copy.recommendPosts = [self.recommendPosts copyWithZone:zone];
    }
    
    return copy;
}


@end

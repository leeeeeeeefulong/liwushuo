//
//  LWSData.m
//
//  Created by  半夏 on 2017/12/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "LWSCategoryPostCollectionModel.h"
#import "LWSColumns.h"
#import "LWSPaging.h"


NSString *const kLWSDataColumns = @"columns";
NSString *const kLWSDataPaging = @"paging";


@interface LWSCategoryPostCollectionModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LWSCategoryPostCollectionModel

@synthesize columns = _columns;
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
    NSObject *receivedLWSColumns = [dict objectForKey:kLWSDataColumns];
    NSMutableArray *parsedLWSColumns = [NSMutableArray array];
    if ([receivedLWSColumns isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedLWSColumns) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedLWSColumns addObject:[LWSColumns modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedLWSColumns isKindOfClass:[NSDictionary class]]) {
       [parsedLWSColumns addObject:[LWSColumns modelObjectWithDictionary:(NSDictionary *)receivedLWSColumns]];
    }

    self.columns = [NSArray arrayWithArray:parsedLWSColumns];
            self.paging = [LWSPaging modelObjectWithDictionary:[dict objectForKey:kLWSDataPaging]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForColumns = [NSMutableArray array];
    for (NSObject *subArrayObject in self.columns) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForColumns addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForColumns addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForColumns] forKey:kLWSDataColumns];
    [mutableDict setValue:[self.paging dictionaryRepresentation] forKey:kLWSDataPaging];

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

    self.columns = [aDecoder decodeObjectForKey:kLWSDataColumns];
    self.paging = [aDecoder decodeObjectForKey:kLWSDataPaging];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_columns forKey:kLWSDataColumns];
    [aCoder encodeObject:_paging forKey:kLWSDataPaging];
}

- (id)copyWithZone:(NSZone *)zone
{
    LWSCategoryPostCollectionModel *copy = [[LWSCategoryPostCollectionModel alloc] init];
    
    if (copy) {

        copy.columns = [self.columns copyWithZone:zone];
        copy.paging = [self.paging copyWithZone:zone];
    }
    
    return copy;
}


@end

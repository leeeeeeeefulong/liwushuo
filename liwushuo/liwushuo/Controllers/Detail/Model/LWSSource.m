//
//  LWSSource.m
//
//  Created by  半夏 on 2018/1/4
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "LWSSource.h"


NSString *const kLWSSourcePageTitle = @"page_title";
NSString *const kLWSSourceButtonTitle = @"button_title";
NSString *const kLWSSourceName = @"name";
NSString *const kLWSSourceType = @"type";


@interface LWSSource ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LWSSource

@synthesize pageTitle = _pageTitle;
@synthesize buttonTitle = _buttonTitle;
@synthesize name = _name;
@synthesize type = _type;


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
            self.pageTitle = [self objectOrNilForKey:kLWSSourcePageTitle fromDictionary:dict];
            self.buttonTitle = [self objectOrNilForKey:kLWSSourceButtonTitle fromDictionary:dict];
            self.name = [self objectOrNilForKey:kLWSSourceName fromDictionary:dict];
            self.type = [self objectOrNilForKey:kLWSSourceType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.pageTitle forKey:kLWSSourcePageTitle];
    [mutableDict setValue:self.buttonTitle forKey:kLWSSourceButtonTitle];
    [mutableDict setValue:self.name forKey:kLWSSourceName];
    [mutableDict setValue:self.type forKey:kLWSSourceType];

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

    self.pageTitle = [aDecoder decodeObjectForKey:kLWSSourcePageTitle];
    self.buttonTitle = [aDecoder decodeObjectForKey:kLWSSourceButtonTitle];
    self.name = [aDecoder decodeObjectForKey:kLWSSourceName];
    self.type = [aDecoder decodeObjectForKey:kLWSSourceType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageTitle forKey:kLWSSourcePageTitle];
    [aCoder encodeObject:_buttonTitle forKey:kLWSSourceButtonTitle];
    [aCoder encodeObject:_name forKey:kLWSSourceName];
    [aCoder encodeObject:_type forKey:kLWSSourceType];
}

- (id)copyWithZone:(NSZone *)zone
{
    LWSSource *copy = [[LWSSource alloc] init];
    
    if (copy) {

        copy.pageTitle = [self.pageTitle copyWithZone:zone];
        copy.buttonTitle = [self.buttonTitle copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
    }
    
    return copy;
}


@end

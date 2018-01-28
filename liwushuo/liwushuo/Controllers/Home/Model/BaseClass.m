//
//  BaseClass.m
//
//  Created by  半夏 on 2017/12/11
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "BaseClass.h"
#import "LWSGiftCategoryModel.h"


NSString *const kBaseClassMessage = @"message";
NSString *const kBaseClassData = @"data";
NSString *const kBaseClassCode = @"code";


@interface BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BaseClass

@synthesize message = _message;
@synthesize data = _data;
@synthesize code = _code;


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
            self.message = [self objectOrNilForKey:kBaseClassMessage fromDictionary:dict];
            self.data = [LWSGiftCategoryModel modelObjectWithDictionary:[dict objectForKey:kBaseClassData]];
            self.code = [[self objectOrNilForKey:kBaseClassCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.message forKey:kBaseClassMessage];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kBaseClassData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kBaseClassCode];

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

    self.message = [aDecoder decodeObjectForKey:kBaseClassMessage];
    self.data = [aDecoder decodeObjectForKey:kBaseClassData];
    self.code = [aDecoder decodeDoubleForKey:kBaseClassCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_message forKey:kBaseClassMessage];
    [aCoder encodeObject:_data forKey:kBaseClassData];
    [aCoder encodeDouble:_code forKey:kBaseClassCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    BaseClass *copy = [[BaseClass alloc] init];
    
    if (copy) {

        copy.message = [self.message copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end

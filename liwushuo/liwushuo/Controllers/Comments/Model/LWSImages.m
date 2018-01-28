//
//  LWSImages.m
//
//  Created by  半夏 on 2018/1/3
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "LWSImages.h"


NSString *const kLWSImagesOriginal = @"original";
NSString *const kLWSImagesW = @"w";
NSString *const kLWSImagesUrl = @"url";
NSString *const kLWSImagesH = @"h";
NSString *const kLWSImagesThumbnail = @"thumbnail";


@interface LWSImages ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LWSImages

@synthesize original = _original;
@synthesize imgW = _imgW;
@synthesize url = _url;
@synthesize imgH = _imgH;
@synthesize thumbnail = _thumbnail;


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
            self.original = [self objectOrNilForKey:kLWSImagesOriginal fromDictionary:dict];
            self.imgW = [[self objectOrNilForKey:kLWSImagesW fromDictionary:dict] floatValue];
            self.url = [self objectOrNilForKey:kLWSImagesUrl fromDictionary:dict];
            self.imgH = [[self objectOrNilForKey:kLWSImagesH fromDictionary:dict] floatValue];
            self.thumbnail = [self objectOrNilForKey:kLWSImagesThumbnail fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.original forKey:kLWSImagesOriginal];
    [mutableDict setValue:[NSNumber numberWithFloat:self.imgW] forKey:kLWSImagesW];
    [mutableDict setValue:self.url forKey:kLWSImagesUrl];
    [mutableDict setValue:[NSNumber numberWithFloat:self.imgH] forKey:kLWSImagesH];
    [mutableDict setValue:self.thumbnail forKey:kLWSImagesThumbnail];

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

    self.original = [aDecoder decodeObjectForKey:kLWSImagesOriginal];
    self.imgW = [aDecoder decodeFloatForKey:kLWSImagesW];
    self.url = [aDecoder decodeObjectForKey:kLWSImagesUrl];
    self.imgH = [aDecoder decodeFloatForKey:kLWSImagesH];
    self.thumbnail = [aDecoder decodeObjectForKey:kLWSImagesThumbnail];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_original forKey:kLWSImagesOriginal];
    [aCoder encodeFloat:_imgW forKey:kLWSImagesW];
    [aCoder encodeObject:_url forKey:kLWSImagesUrl];
    [aCoder encodeFloat:_imgH forKey:kLWSImagesH];
    [aCoder encodeObject:_thumbnail forKey:kLWSImagesThumbnail];
}

- (id)copyWithZone:(NSZone *)zone
{
    LWSImages *copy = [[LWSImages alloc] init];
    
    if (copy) {

        copy.original = [self.original copyWithZone:zone];
        copy.imgW = self.imgW;
        copy.url = [self.url copyWithZone:zone];
        copy.imgH = self.imgH;
        copy.thumbnail = [self.thumbnail copyWithZone:zone];
    }
    
    return copy;
}


@end

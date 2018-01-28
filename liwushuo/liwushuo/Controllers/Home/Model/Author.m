//
//  Author.m
//
//  Created by  半夏 on 2017/12/11
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Author.h"


NSString *const kAuthorId = @"id";
NSString *const kAuthorIntroduction = @"introduction";
NSString *const kAuthorAvatarUrl = @"avatar_url";
NSString *const kAuthorNickname = @"nickname";
NSString *const kAuthorAvatarWebpUrl = @"avatar_webp_url";
NSString *const kAuthorCreatedAt = @"created_at";


@interface Author ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Author

@synthesize authorIdentifier = _authorIdentifier;
@synthesize introduction = _introduction;
@synthesize avatarUrl = _avatarUrl;
@synthesize nickname = _nickname;
@synthesize avatarWebpUrl = _avatarWebpUrl;
@synthesize createdAt = _createdAt;


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
            self.authorIdentifier = [[self objectOrNilForKey:kAuthorId fromDictionary:dict] doubleValue];
            self.introduction = [self objectOrNilForKey:kAuthorIntroduction fromDictionary:dict];
            self.avatarUrl = [self objectOrNilForKey:kAuthorAvatarUrl fromDictionary:dict];
            self.nickname = [self objectOrNilForKey:kAuthorNickname fromDictionary:dict];
            self.avatarWebpUrl = [self objectOrNilForKey:kAuthorAvatarWebpUrl fromDictionary:dict];
            self.createdAt = [[self objectOrNilForKey:kAuthorCreatedAt fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.authorIdentifier] forKey:kAuthorId];
    [mutableDict setValue:self.introduction forKey:kAuthorIntroduction];
    [mutableDict setValue:self.avatarUrl forKey:kAuthorAvatarUrl];
    [mutableDict setValue:self.nickname forKey:kAuthorNickname];
    [mutableDict setValue:self.avatarWebpUrl forKey:kAuthorAvatarWebpUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdAt] forKey:kAuthorCreatedAt];

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

    self.authorIdentifier = [aDecoder decodeDoubleForKey:kAuthorId];
    self.introduction = [aDecoder decodeObjectForKey:kAuthorIntroduction];
    self.avatarUrl = [aDecoder decodeObjectForKey:kAuthorAvatarUrl];
    self.nickname = [aDecoder decodeObjectForKey:kAuthorNickname];
    self.avatarWebpUrl = [aDecoder decodeObjectForKey:kAuthorAvatarWebpUrl];
    self.createdAt = [aDecoder decodeDoubleForKey:kAuthorCreatedAt];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_authorIdentifier forKey:kAuthorId];
    [aCoder encodeObject:_introduction forKey:kAuthorIntroduction];
    [aCoder encodeObject:_avatarUrl forKey:kAuthorAvatarUrl];
    [aCoder encodeObject:_nickname forKey:kAuthorNickname];
    [aCoder encodeObject:_avatarWebpUrl forKey:kAuthorAvatarWebpUrl];
    [aCoder encodeDouble:_createdAt forKey:kAuthorCreatedAt];
}

- (id)copyWithZone:(NSZone *)zone
{
    Author *copy = [[Author alloc] init];
    
    if (copy) {

        copy.authorIdentifier = self.authorIdentifier;
        copy.introduction = [self.introduction copyWithZone:zone];
        copy.avatarUrl = [self.avatarUrl copyWithZone:zone];
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.avatarWebpUrl = [self.avatarWebpUrl copyWithZone:zone];
        copy.createdAt = self.createdAt;
    }
    
    return copy;
}


@end

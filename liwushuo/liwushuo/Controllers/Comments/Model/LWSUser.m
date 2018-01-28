//
//  LWSUser.m
//
//  Created by  半夏 on 2018/1/3
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "LWSUser.h"


NSString *const kLWSUserId = @"id";
NSString *const kLWSUserGuestUuid = @"guest_uuid";
NSString *const kLWSUserAvatarUrl = @"avatar_url";
NSString *const kLWSUserNickname = @"nickname";
NSString *const kLWSUserRole = @"role";
NSString *const kLWSUserCanMobileLogin = @"can_mobile_login";


@interface LWSUser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LWSUser

@synthesize userIdentifier = _userIdentifier;
@synthesize guestUuid = _guestUuid;
@synthesize avatarUrl = _avatarUrl;
@synthesize nickname = _nickname;
@synthesize role = _role;
@synthesize canMobileLogin = _canMobileLogin;


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
            self.userIdentifier = [[self objectOrNilForKey:kLWSUserId fromDictionary:dict] doubleValue];
            self.guestUuid = [self objectOrNilForKey:kLWSUserGuestUuid fromDictionary:dict];
            self.avatarUrl = [self objectOrNilForKey:kLWSUserAvatarUrl fromDictionary:dict];
            self.nickname = [self objectOrNilForKey:kLWSUserNickname fromDictionary:dict];
            self.role = [[self objectOrNilForKey:kLWSUserRole fromDictionary:dict] doubleValue];
            self.canMobileLogin = [[self objectOrNilForKey:kLWSUserCanMobileLogin fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userIdentifier] forKey:kLWSUserId];
    [mutableDict setValue:self.guestUuid forKey:kLWSUserGuestUuid];
    [mutableDict setValue:self.avatarUrl forKey:kLWSUserAvatarUrl];
    [mutableDict setValue:self.nickname forKey:kLWSUserNickname];
    [mutableDict setValue:[NSNumber numberWithDouble:self.role] forKey:kLWSUserRole];
    [mutableDict setValue:[NSNumber numberWithBool:self.canMobileLogin] forKey:kLWSUserCanMobileLogin];

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

    self.userIdentifier = [aDecoder decodeDoubleForKey:kLWSUserId];
    self.guestUuid = [aDecoder decodeObjectForKey:kLWSUserGuestUuid];
    self.avatarUrl = [aDecoder decodeObjectForKey:kLWSUserAvatarUrl];
    self.nickname = [aDecoder decodeObjectForKey:kLWSUserNickname];
    self.role = [aDecoder decodeDoubleForKey:kLWSUserRole];
    self.canMobileLogin = [aDecoder decodeBoolForKey:kLWSUserCanMobileLogin];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_userIdentifier forKey:kLWSUserId];
    [aCoder encodeObject:_guestUuid forKey:kLWSUserGuestUuid];
    [aCoder encodeObject:_avatarUrl forKey:kLWSUserAvatarUrl];
    [aCoder encodeObject:_nickname forKey:kLWSUserNickname];
    [aCoder encodeDouble:_role forKey:kLWSUserRole];
    [aCoder encodeBool:_canMobileLogin forKey:kLWSUserCanMobileLogin];
}

- (id)copyWithZone:(NSZone *)zone
{
    LWSUser *copy = [[LWSUser alloc] init];
    
    if (copy) {

        copy.userIdentifier = self.userIdentifier;
        copy.guestUuid = [self.guestUuid copyWithZone:zone];
        copy.avatarUrl = [self.avatarUrl copyWithZone:zone];
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.role = self.role;
        copy.canMobileLogin = self.canMobileLogin;
    }
    
    return copy;
}


@end

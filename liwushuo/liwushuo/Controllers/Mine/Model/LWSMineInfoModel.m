//
//  LWSMineInfoModel.m
//
//  Created by  半夏 on 2017/12/29
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "LWSMineInfoModel.h"


NSString *const kLWSMineInfoModelId = @"id";
NSString *const kLWSMineInfoModelCanMobileLogin = @"can_mobile_login";
NSString *const kLWSMineInfoModelMobile = @"mobile";
NSString *const kLWSMineInfoModelAvatarUrl = @"avatar_url";
NSString *const kLWSMineInfoModelLikePostsCount = @"like_posts_count";
NSString *const kLWSMineInfoModelGuestUuid = @"guest_uuid";
NSString *const kLWSMineInfoModelFollowColumnsCount = @"follow_columns_count";
NSString *const kLWSMineInfoModelCredit = @"credit";
NSString *const kLWSMineInfoModelGvipLevel = @"gvip_level";
NSString *const kLWSMineInfoModelRole = @"role";
NSString *const kLWSMineInfoModelNickname = @"nickname";
NSString *const kLWSMineInfoModelHasPassword = @"has_password";


@interface LWSMineInfoModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LWSMineInfoModel

@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize canMobileLogin = _canMobileLogin;
@synthesize mobile = _mobile;
@synthesize avatarUrl = _avatarUrl;
@synthesize likePostsCount = _likePostsCount;
@synthesize guestUuid = _guestUuid;
@synthesize followColumnsCount = _followColumnsCount;
@synthesize credit = _credit;
@synthesize gvipLevel = _gvipLevel;
@synthesize role = _role;
@synthesize nickname = _nickname;
@synthesize hasPassword = _hasPassword;


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
            self.internalBaseClassIdentifier = [[self objectOrNilForKey:kLWSMineInfoModelId fromDictionary:dict] doubleValue];
            self.canMobileLogin = [[self objectOrNilForKey:kLWSMineInfoModelCanMobileLogin fromDictionary:dict] boolValue];
            self.mobile = [self objectOrNilForKey:kLWSMineInfoModelMobile fromDictionary:dict];
            self.avatarUrl = [self objectOrNilForKey:kLWSMineInfoModelAvatarUrl fromDictionary:dict];
            self.likePostsCount = [[self objectOrNilForKey:kLWSMineInfoModelLikePostsCount fromDictionary:dict] doubleValue];
            self.guestUuid = [self objectOrNilForKey:kLWSMineInfoModelGuestUuid fromDictionary:dict];
            self.followColumnsCount = [[self objectOrNilForKey:kLWSMineInfoModelFollowColumnsCount fromDictionary:dict] doubleValue];
            self.credit = [[self objectOrNilForKey:kLWSMineInfoModelCredit fromDictionary:dict] doubleValue];
            self.gvipLevel = [[self objectOrNilForKey:kLWSMineInfoModelGvipLevel fromDictionary:dict] doubleValue];
            self.role = [[self objectOrNilForKey:kLWSMineInfoModelRole fromDictionary:dict] doubleValue];
            self.nickname = [self objectOrNilForKey:kLWSMineInfoModelNickname fromDictionary:dict];
            self.hasPassword = [[self objectOrNilForKey:kLWSMineInfoModelHasPassword fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.internalBaseClassIdentifier] forKey:kLWSMineInfoModelId];
    [mutableDict setValue:[NSNumber numberWithBool:self.canMobileLogin] forKey:kLWSMineInfoModelCanMobileLogin];
    [mutableDict setValue:self.mobile forKey:kLWSMineInfoModelMobile];
    [mutableDict setValue:self.avatarUrl forKey:kLWSMineInfoModelAvatarUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likePostsCount] forKey:kLWSMineInfoModelLikePostsCount];
    [mutableDict setValue:self.guestUuid forKey:kLWSMineInfoModelGuestUuid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.followColumnsCount] forKey:kLWSMineInfoModelFollowColumnsCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.credit] forKey:kLWSMineInfoModelCredit];
    [mutableDict setValue:[NSNumber numberWithDouble:self.gvipLevel] forKey:kLWSMineInfoModelGvipLevel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.role] forKey:kLWSMineInfoModelRole];
    [mutableDict setValue:self.nickname forKey:kLWSMineInfoModelNickname];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasPassword] forKey:kLWSMineInfoModelHasPassword];

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

    self.internalBaseClassIdentifier = [aDecoder decodeDoubleForKey:kLWSMineInfoModelId];
    self.canMobileLogin = [aDecoder decodeBoolForKey:kLWSMineInfoModelCanMobileLogin];
    self.mobile = [aDecoder decodeObjectForKey:kLWSMineInfoModelMobile];
    self.avatarUrl = [aDecoder decodeObjectForKey:kLWSMineInfoModelAvatarUrl];
    self.likePostsCount = [aDecoder decodeDoubleForKey:kLWSMineInfoModelLikePostsCount];
    self.guestUuid = [aDecoder decodeObjectForKey:kLWSMineInfoModelGuestUuid];
    self.followColumnsCount = [aDecoder decodeDoubleForKey:kLWSMineInfoModelFollowColumnsCount];
    self.credit = [aDecoder decodeDoubleForKey:kLWSMineInfoModelCredit];
    self.gvipLevel = [aDecoder decodeDoubleForKey:kLWSMineInfoModelGvipLevel];
    self.role = [aDecoder decodeDoubleForKey:kLWSMineInfoModelRole];
    self.nickname = [aDecoder decodeObjectForKey:kLWSMineInfoModelNickname];
    self.hasPassword = [aDecoder decodeBoolForKey:kLWSMineInfoModelHasPassword];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_internalBaseClassIdentifier forKey:kLWSMineInfoModelId];
    [aCoder encodeBool:_canMobileLogin forKey:kLWSMineInfoModelCanMobileLogin];
    [aCoder encodeObject:_mobile forKey:kLWSMineInfoModelMobile];
    [aCoder encodeObject:_avatarUrl forKey:kLWSMineInfoModelAvatarUrl];
    [aCoder encodeDouble:_likePostsCount forKey:kLWSMineInfoModelLikePostsCount];
    [aCoder encodeObject:_guestUuid forKey:kLWSMineInfoModelGuestUuid];
    [aCoder encodeDouble:_followColumnsCount forKey:kLWSMineInfoModelFollowColumnsCount];
    [aCoder encodeDouble:_credit forKey:kLWSMineInfoModelCredit];
    [aCoder encodeDouble:_gvipLevel forKey:kLWSMineInfoModelGvipLevel];
    [aCoder encodeDouble:_role forKey:kLWSMineInfoModelRole];
    [aCoder encodeObject:_nickname forKey:kLWSMineInfoModelNickname];
    [aCoder encodeBool:_hasPassword forKey:kLWSMineInfoModelHasPassword];
}

- (id)copyWithZone:(NSZone *)zone
{
    LWSMineInfoModel *copy = [[LWSMineInfoModel alloc] init];
    
    if (copy) {

        copy.internalBaseClassIdentifier = self.internalBaseClassIdentifier;
        copy.canMobileLogin = self.canMobileLogin;
        copy.mobile = [self.mobile copyWithZone:zone];
        copy.avatarUrl = [self.avatarUrl copyWithZone:zone];
        copy.likePostsCount = self.likePostsCount;
        copy.guestUuid = [self.guestUuid copyWithZone:zone];
        copy.followColumnsCount = self.followColumnsCount;
        copy.credit = self.credit;
        copy.gvipLevel = self.gvipLevel;
        copy.role = self.role;
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.hasPassword = self.hasPassword;
    }
    
    return copy;
}


@end

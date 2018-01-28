//
//  LWSComments.m
//
//  Created by  半夏 on 2018/1/3
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "LWSComments.h"
#import "LWSUser.h"


NSString *const kLWSCommentsImages = @"images";
NSString *const kLWSCommentsContent = @"content";
NSString *const kLWSCommentsLikesCount = @"likes_count";
NSString *const kLWSCommentsId = @"id";
NSString *const kLWSCommentsCreatedAt = @"created_at";
NSString *const kLWSCommentsPostId = @"post_id";
NSString *const kLWSCommentsDoesLike = @"does_like";
NSString *const kLWSCommentsReplyToId = @"reply_to_id";
NSString *const kLWSCommentsFakeLikesCount = @"fake_likes_count";
NSString *const kLWSCommentsUpdatedAt = @"updated_at";
NSString *const kLWSCommentsUser = @"user";


@interface LWSComments ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LWSComments

@synthesize images = _images;
@synthesize content = _content;
@synthesize likesCount = _likesCount;
@synthesize commentsIdentifier = _commentsIdentifier;
@synthesize createdAt = _createdAt;
@synthesize postId = _postId;
@synthesize doesLike = _doesLike;
@synthesize replyToId = _replyToId;
@synthesize fakeLikesCount = _fakeLikesCount;
@synthesize updatedAt = _updatedAt;
@synthesize user = _user;


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
            self.images = [self objectOrNilForKey:kLWSCommentsImages fromDictionary:dict];
            self.content = [self objectOrNilForKey:kLWSCommentsContent fromDictionary:dict];
            self.likesCount = [[self objectOrNilForKey:kLWSCommentsLikesCount fromDictionary:dict] doubleValue];
            self.commentsIdentifier = [[self objectOrNilForKey:kLWSCommentsId fromDictionary:dict] doubleValue];
            self.createdAt = [[self objectOrNilForKey:kLWSCommentsCreatedAt fromDictionary:dict] doubleValue];
            self.postId = [[self objectOrNilForKey:kLWSCommentsPostId fromDictionary:dict] doubleValue];
            self.doesLike = [[self objectOrNilForKey:kLWSCommentsDoesLike fromDictionary:dict] boolValue];
            self.replyToId = [self objectOrNilForKey:kLWSCommentsReplyToId fromDictionary:dict];
            self.fakeLikesCount = [[self objectOrNilForKey:kLWSCommentsFakeLikesCount fromDictionary:dict] doubleValue];
            self.updatedAt = [[self objectOrNilForKey:kLWSCommentsUpdatedAt fromDictionary:dict] doubleValue];
            self.user = [LWSUser modelObjectWithDictionary:[dict objectForKey:kLWSCommentsUser]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForImages = [NSMutableArray array];
    for (NSObject *subArrayObject in self.images) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForImages addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForImages addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForImages] forKey:kLWSCommentsImages];
    [mutableDict setValue:self.content forKey:kLWSCommentsContent];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likesCount] forKey:kLWSCommentsLikesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentsIdentifier] forKey:kLWSCommentsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdAt] forKey:kLWSCommentsCreatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.postId] forKey:kLWSCommentsPostId];
    [mutableDict setValue:[NSNumber numberWithBool:self.doesLike] forKey:kLWSCommentsDoesLike];
    [mutableDict setValue:self.replyToId forKey:kLWSCommentsReplyToId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.fakeLikesCount] forKey:kLWSCommentsFakeLikesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updatedAt] forKey:kLWSCommentsUpdatedAt];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kLWSCommentsUser];

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

    self.images = [aDecoder decodeObjectForKey:kLWSCommentsImages];
    self.content = [aDecoder decodeObjectForKey:kLWSCommentsContent];
    self.likesCount = [aDecoder decodeDoubleForKey:kLWSCommentsLikesCount];
    self.commentsIdentifier = [aDecoder decodeDoubleForKey:kLWSCommentsId];
    self.createdAt = [aDecoder decodeDoubleForKey:kLWSCommentsCreatedAt];
    self.postId = [aDecoder decodeDoubleForKey:kLWSCommentsPostId];
    self.doesLike = [aDecoder decodeBoolForKey:kLWSCommentsDoesLike];
    self.replyToId = [aDecoder decodeObjectForKey:kLWSCommentsReplyToId];
    self.fakeLikesCount = [aDecoder decodeDoubleForKey:kLWSCommentsFakeLikesCount];
    self.updatedAt = [aDecoder decodeDoubleForKey:kLWSCommentsUpdatedAt];
    self.user = [aDecoder decodeObjectForKey:kLWSCommentsUser];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_images forKey:kLWSCommentsImages];
    [aCoder encodeObject:_content forKey:kLWSCommentsContent];
    [aCoder encodeDouble:_likesCount forKey:kLWSCommentsLikesCount];
    [aCoder encodeDouble:_commentsIdentifier forKey:kLWSCommentsId];
    [aCoder encodeDouble:_createdAt forKey:kLWSCommentsCreatedAt];
    [aCoder encodeDouble:_postId forKey:kLWSCommentsPostId];
    [aCoder encodeBool:_doesLike forKey:kLWSCommentsDoesLike];
    [aCoder encodeObject:_replyToId forKey:kLWSCommentsReplyToId];
    [aCoder encodeDouble:_fakeLikesCount forKey:kLWSCommentsFakeLikesCount];
    [aCoder encodeDouble:_updatedAt forKey:kLWSCommentsUpdatedAt];
    [aCoder encodeObject:_user forKey:kLWSCommentsUser];
}

- (id)copyWithZone:(NSZone *)zone
{
    LWSComments *copy = [[LWSComments alloc] init];
    
    if (copy) {

        copy.images = [self.images copyWithZone:zone];
        copy.content = [self.content copyWithZone:zone];
        copy.likesCount = self.likesCount;
        copy.commentsIdentifier = self.commentsIdentifier;
        copy.createdAt = self.createdAt;
        copy.postId = self.postId;
        copy.doesLike = self.doesLike;
        copy.replyToId = [self.replyToId copyWithZone:zone];
        copy.fakeLikesCount = self.fakeLikesCount;
        copy.updatedAt = self.updatedAt;
        copy.user = [self.user copyWithZone:zone];
    }
    
    return copy;
}


@end

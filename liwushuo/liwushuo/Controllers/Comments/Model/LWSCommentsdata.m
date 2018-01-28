//
//  LWSCommentsdata.m
//
//  Created by  半夏 on 2018/1/3
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "LWSCommentsdata.h"
#import "LWSPaging.h"
#import "LWSComments.h"


NSString *const kLWSCommentsdataPaging = @"paging";
NSString *const kLWSCommentsdataComments = @"comments";


@interface LWSCommentsdata ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LWSCommentsdata

@synthesize paging = _paging;
@synthesize comments = _comments;


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
            self.paging = [LWSPaging modelObjectWithDictionary:[dict objectForKey:kLWSCommentsdataPaging]];
    NSObject *receivedLWSComments = [dict objectForKey:kLWSCommentsdataComments];
    NSMutableArray *parsedLWSComments = [NSMutableArray array];
    if ([receivedLWSComments isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedLWSComments) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedLWSComments addObject:[LWSComments modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedLWSComments isKindOfClass:[NSDictionary class]]) {
       [parsedLWSComments addObject:[LWSComments modelObjectWithDictionary:(NSDictionary *)receivedLWSComments]];
    }

    self.comments = [NSArray arrayWithArray:parsedLWSComments];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.paging dictionaryRepresentation] forKey:kLWSCommentsdataPaging];
    NSMutableArray *tempArrayForComments = [NSMutableArray array];
    for (NSObject *subArrayObject in self.comments) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForComments addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForComments addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForComments] forKey:kLWSCommentsdataComments];

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

    self.paging = [aDecoder decodeObjectForKey:kLWSCommentsdataPaging];
    self.comments = [aDecoder decodeObjectForKey:kLWSCommentsdataComments];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_paging forKey:kLWSCommentsdataPaging];
    [aCoder encodeObject:_comments forKey:kLWSCommentsdataComments];
}

- (id)copyWithZone:(NSZone *)zone
{
    LWSCommentsdata *copy = [[LWSCommentsdata alloc] init];
    
    if (copy) {

        copy.paging = [self.paging copyWithZone:zone];
        copy.comments = [self.comments copyWithZone:zone];
    }
    
    return copy;
}


@end

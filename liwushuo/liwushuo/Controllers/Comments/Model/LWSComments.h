//
//  LWSComments.h
//
//  Created by  半夏 on 2018/1/3
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LWSUser;

@interface LWSComments : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, assign) double likesCount;
@property (nonatomic, assign) double commentsIdentifier;
@property (nonatomic, assign) double createdAt;
@property (nonatomic, assign) double postId;
@property (nonatomic, assign) BOOL doesLike;
@property (nonatomic, assign) id replyToId;
@property (nonatomic, assign) double fakeLikesCount;
@property (nonatomic, assign) double updatedAt;
@property (nonatomic, strong) LWSUser *user;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

//
//  LWSRecommendPosts.h
//
//  Created by  半夏 on 2018/1/8
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface LWSRecommendPosts : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double mediaType;
@property (nonatomic, assign) double status;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double editorId;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) id adMonitors;
@property (nonatomic, assign) double publishedAt;
@property (nonatomic, assign) double updatedAt;
@property (nonatomic, assign) id limitEndAt;
@property (nonatomic, strong) NSString *template;
@property (nonatomic, assign) id approvedAt;
@property (nonatomic, strong) NSArray *featureList;
@property (nonatomic, strong) NSArray *labelIds;
@property (nonatomic, assign) double recommendPostsIdentifier;
@property (nonatomic, assign) double contentType;
@property (nonatomic, strong) NSString *contentUrl;
@property (nonatomic, strong) NSString *shareMsg;
@property (nonatomic, assign) double likesCount;
@property (nonatomic, strong) NSString *introduction;
@property (nonatomic, assign) double createdAt;
@property (nonatomic, strong) NSString *shortTitle;
@property (nonatomic, strong) NSString *coverWebpUrl;
@property (nonatomic, strong) NSString *coverImageUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

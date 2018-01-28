//
//  Author.h
//
//  Created by  半夏 on 2017/12/11
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Author : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double authorIdentifier;
@property (nonatomic, strong) NSString *introduction;
@property (nonatomic, strong) NSString *avatarUrl;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, assign) id avatarWebpUrl;
@property (nonatomic, assign) double createdAt;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

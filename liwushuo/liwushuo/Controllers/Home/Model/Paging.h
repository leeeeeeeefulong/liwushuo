//
//  Paging.h
//
//  Created by  半夏 on 2017/12/11
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Paging : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *nextUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

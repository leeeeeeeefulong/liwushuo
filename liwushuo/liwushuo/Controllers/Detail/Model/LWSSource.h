//
//  LWSSource.h
//
//  Created by  半夏 on 2018/1/4
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface LWSSource : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *pageTitle;
@property (nonatomic, strong) NSString *buttonTitle;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *type;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

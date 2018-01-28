//
//  LWSImages.h
//
//  Created by  半夏 on 2018/1/3
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface LWSImages : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *original;
@property (nonatomic, assign) CGFloat imgW;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) CGFloat imgH;
@property (nonatomic, strong) NSString *thumbnail;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

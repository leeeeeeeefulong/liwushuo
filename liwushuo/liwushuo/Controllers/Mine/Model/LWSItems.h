//
//  LWSItems.h
//
//  Created by  半夏 on 2017/12/29
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface LWSItems : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) id targetUrl;
@property (nonatomic, assign) double itemsIdentifier;
@property (nonatomic, strong) NSString *coverWebpUrl;
@property (nonatomic, strong) NSString *targetType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

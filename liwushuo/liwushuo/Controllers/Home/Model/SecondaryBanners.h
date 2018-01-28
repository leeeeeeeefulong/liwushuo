//
//  SecondaryBanners.h
//
//  Created by  半夏 on 2017/12/13
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SecondaryBanners : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *targetUrl;
@property (nonatomic, assign) double secondaryBannersIdentifier;
@property (nonatomic, strong) NSArray *adMonitors;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSString *webpUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

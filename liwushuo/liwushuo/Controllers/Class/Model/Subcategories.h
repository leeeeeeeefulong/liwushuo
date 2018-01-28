//
//  Subcategories.h
//
//  Created by  半夏 on 2017/12/15
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Subcategories : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double status;
@property (nonatomic, assign) double subcategoriesIdentifier;
@property (nonatomic, assign) double itemsCount;
@property (nonatomic, assign) double order;
@property (nonatomic, strong) NSString *iconUrl;
@property (nonatomic, assign) double parentId;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

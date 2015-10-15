//
//  Query.m
//  QLU
//
//  Created by 巩洪楼 on 15/9/30.
//  Copyright (c) 2015年 QLU. All rights reserved.
//

#import "Query.h"

@implementation Query

- (id)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        // 解析字典属性
        self.image = dict[@"image"];
        self.title = dict[@"title"];
        self.author = dict[@"author"];
        self.publish = dict[@"publish"];
        self.number = dict[@"number"];
        self.place = dict[@"place"];
        self.desc = dict[@"desc"];
    }
    return self;
}

+ (id)queryWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end

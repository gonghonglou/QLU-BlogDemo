//
//  Borrow.m
//  QiluUniversityOfTechnology
//
//  Created by 巩洪楼 on 15/9/20.
//  Copyright (c) 2015年 巩洪楼. All rights reserved.
//

#import "Borrow.h"

@implementation Borrow

- (id)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        // 解析字典属性
        self.image = dict[@"image"];
        self.title = dict[@"title"];
        self.author = dict[@"author"];
        self.publish = dict[@"publish"];
        self.number = dict[@"number"];
        self.place = dict[@"place"];
        self.time = dict[@"time"];
        self.bill = dict[@"bill"];
    }
    return self;
}

+ (id)borrowWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end

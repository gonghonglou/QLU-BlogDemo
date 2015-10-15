//
//  Exam.m
//  QiluUniversityOfTechnology
//
//  Created by 巩洪楼 on 15/9/19.
//  Copyright (c) 2015年 巩洪楼. All rights reserved.
//

#import "Exam.h"

@implementation Exam

- (id)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        // 解析字典属性
        self.name = dict[@"name"];
        self.time = dict[@"time"];
        self.room = dict[@"room"];
    }
    return self;
}

+ (id)examWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}


@end

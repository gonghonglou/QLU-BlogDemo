//
//  Mark.m
//  QiluUniversityOfTechnology
//
//  Created by 巩洪楼 on 15/9/19.
//  Copyright (c) 2015年 巩洪楼. All rights reserved.
//

#import "Mark.h"

@implementation Mark

- (id)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.name = dict[@"name"]; // 课程名称
        self.type = dict[@"type"]; // 课程性质
        self.credit = dict[@"credit"]; // 学分
        self.point = dict[@"point"]; // 绩点
        self.achievement = dict[@"achievement"]; // 成绩
        self.reachievement = dict[@"reachievement"]; // 补考成绩
        self.restudy = dict[@"restudy"]; // 重修标志
    }
    return self;
}

+ (id)markWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}


@end

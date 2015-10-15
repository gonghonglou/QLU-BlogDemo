//
//  Mark.h
//  QiluUniversityOfTechnology
//
//  Created by 巩洪楼 on 15/9/19.
//  Copyright (c) 2015年 巩洪楼. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mark : NSObject

@property (nonatomic, copy) NSString *name; // 课程名称
@property (nonatomic, copy) NSString *type; // 课程性质
@property (nonatomic, copy) NSString *credit; // 学分
@property (nonatomic, copy) NSString *point; // 绩点
@property (nonatomic, copy) NSString *achievement; // 成绩
@property (nonatomic, copy) NSString *reachievement; // 补考成绩
@property (nonatomic, copy) NSString *restudy; // 重修标志


- (id)initWithDict:(NSDictionary *)dict;
+ (id)markWithDict:(NSDictionary *)dict;

@end

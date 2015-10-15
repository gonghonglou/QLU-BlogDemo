//
//  Exam.h
//  QiluUniversityOfTechnology
//
//  Created by 巩洪楼 on 15/9/19.
//  Copyright (c) 2015年 巩洪楼. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Exam : NSObject

@property (nonatomic, copy) NSString *name; // 课程名称
@property (nonatomic, copy) NSString *time; // 考试时间
@property (nonatomic, copy) NSString *room; // 考试地点


- (id)initWithDict:(NSDictionary *)dict;
+ (id)examWithDict:(NSDictionary *)dict;

@end

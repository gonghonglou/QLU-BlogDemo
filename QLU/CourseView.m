//
//  CourseView.m
//  QiluUniversityOfTechnology
//
//  Created by 巩洪楼 on 15/9/9.
//  Copyright (c) 2015年 巩洪楼. All rights reserved.
//

#import "CourseView.h"

@implementation CourseView


/**
 *  设置弹出的课程详情
 */
+ (void)setCourseDetailsView:(UIView *)view coursename:(NSString *)name courseroom:(NSString *)room teacher:(NSString *)teacher number:(NSString *)number week:(NSString *)week {
    
    // 设置课程详情-label
    [self setCourseLabel:view name1:@"名称：" rect1:CGRectMake(10,30,40,20) name2:name rect2:CGRectMake(50,30,200,20)];
    [self setCourseLabel:view name1:@"教室：" rect1:CGRectMake(10,60,40,20) name2:room rect2:CGRectMake(50,60,200,20)];
    [self setCourseLabel:view name1:@"老师：" rect1:CGRectMake(10,90,40,20) name2:teacher rect2:CGRectMake(50,90,200,20)];
    [self setCourseLabel:view name1:@"节数：" rect1:CGRectMake(10,120,40,20) name2:number rect2:CGRectMake(50,120,200,20)];
    [self setCourseLabel:view name1:@"周数：" rect1:CGRectMake(10,150,40,20) name2:week rect2:CGRectMake(50,150,200,20)];
    
}

// 设置课程详情-label
+ (void)setCourseLabel:(UIView *)view name1:(NSString *)name1 rect1:(CGRect)rect1 name2:(NSString *)name2 rect2:(CGRect)rect2 {
    UILabel *label1 = [[UILabel alloc] initWithFrame:rect1];
    [label1 setText:name1];
    label1.font = [UIFont systemFontOfSize:12];
    [label1 setBackgroundColor:[UIColor clearColor]];
    [view addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:rect2];
    label2.text = name2;
    label2.font = [UIFont systemFontOfSize:12];
    label2.numberOfLines = 0;
    [view addSubview:label2];
}

@end

//
//  CourseView.h
//  QiluUniversityOfTechnology
//
//  Created by 巩洪楼 on 15/9/9.
//  Copyright (c) 2015年 巩洪楼. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CourseView : UIView

/**
 *  设置弹出的课程详情
 */
+ (void)setCourseDetailsView:(UIView *)view coursename:(NSString *)name courseroom:(NSString *)room teacher:(NSString *)teacher number:(NSString *)number week:(NSString *)week;

@end

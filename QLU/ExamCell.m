//
//  ExamCell.m
//  QiluUniversityOfTechnology
//
//  Created by 巩洪楼 on 15/9/19.
//  Copyright (c) 2015年 巩洪楼. All rights reserved.
//

#import "ExamCell.h"
#import "Exam.h"

@implementation ExamCell

+ (id)examCell {
    return [[NSBundle mainBundle] loadNibNamed:@"ExamCell" owner:nil options:nil][0];
}

- (void)setExam:(Exam *)exam {
    _exam = exam;
    
    // 1.课程名称
    _nameLabel.text = exam.name;
    
    // 2.考试时间
    _timeLabel.text = exam.time;
    
    // 3.考试地点
    _roomLabel.text = exam.room;
}


+ (NSString *)ID {
    return @"ExamCell";
}


@end

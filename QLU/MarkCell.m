//
//  MarkCell.m
//  QiluUniversityOfTechnology
//
//  Created by 巩洪楼 on 15/9/19.
//  Copyright (c) 2015年 巩洪楼. All rights reserved.
//

#import "MarkCell.h"
#import "Mark.h"

@implementation MarkCell

+ (id)markCell {
    return [[NSBundle mainBundle] loadNibNamed:@"MarkCell" owner:nil options:nil][0];
}

- (void)setMark:(Mark *)mark {
    _mark = mark;
    
    // 1.课程名称
    _name.text = mark.name;
    
    // 2.课程性质
    _type.text = mark.type;
    
    // 3.学分
    _credit.text = mark.credit;
    
    // 4.绩点
    _point.text = mark.point;
    
    // 5.成绩
    _achievement.text = mark.achievement;
    
    // 6.补考成绩
    _reachievement.text = mark.reachievement;
    
    // 7.重修标志
    _restudy.text = mark.restudy;
    
}


+ (id)ID {
    return @"MarkCell";
}

@end

//
//  ExamCell.h
//  QiluUniversityOfTechnology
//
//  Created by 巩洪楼 on 15/9/19.
//  Copyright (c) 2015年 巩洪楼. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Exam;

@interface ExamCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *roomLabel;

@property (nonatomic, strong) Exam *exam; // 模型数据

+ (id)examCell;

// Identifier
+ (NSString *)ID;

@end

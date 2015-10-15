//
//  MarkCell.h
//  QiluUniversityOfTechnology
//
//  Created by 巩洪楼 on 15/9/19.
//  Copyright (c) 2015年 巩洪楼. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Mark;
@interface MarkCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UILabel *credit;
@property (weak, nonatomic) IBOutlet UILabel *point;
@property (weak, nonatomic) IBOutlet UILabel *achievement;
@property (weak, nonatomic) IBOutlet UILabel *reachievement;
@property (weak, nonatomic) IBOutlet UILabel *restudy;

@property (nonatomic, strong) Mark *mark; // 模型数据

+ (id)markCell;

// Identifier
+ (id)ID;

@end

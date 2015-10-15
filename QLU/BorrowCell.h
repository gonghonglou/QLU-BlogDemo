//
//  BorrowCell.h
//  QiluUniversityOfTechnology
//
//  Created by 巩洪楼 on 15/9/20.
//  Copyright (c) 2015年 巩洪楼. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Borrow;
@interface BorrowCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image; // 封面
@property (weak, nonatomic) IBOutlet UILabel *title; // 书名
@property (weak, nonatomic) IBOutlet UILabel *author; // 作者
@property (weak, nonatomic) IBOutlet UILabel *publish; // 出版社
@property (weak, nonatomic) IBOutlet UILabel *number; // 索书号
@property (weak, nonatomic) IBOutlet UILabel *place; // 馆藏地
@property (weak, nonatomic) IBOutlet UILabel *time; // 时间
@property (weak, nonatomic) IBOutlet UILabel *bill; // 超时计费

// 模型数据
@property (nonatomic, strong) Borrow *borrow;

+ (id)borrowCell;

// Identifier
+ (NSString *)ID;

@end

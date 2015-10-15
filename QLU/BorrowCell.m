//
//  BorrowCell.m
//  QiluUniversityOfTechnology
//
//  Created by 巩洪楼 on 15/9/20.
//  Copyright (c) 2015年 巩洪楼. All rights reserved.
//

#import "BorrowCell.h"
#import "Borrow.h"

#import <UIImageView+WebCache.h>


@implementation BorrowCell

+ (id)borrowCell {
    return [[NSBundle mainBundle] loadNibNamed:@"BorrowCell" owner:nil options:nil][0];
}

- (void)setBorrow:(Borrow *)borrow {
    _borrow = borrow;
    
    // 封面
    NSString *imageStr = [borrow.image stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:imageStr];
    [_image sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"book.png"]];
    
    // 书名
    _title.text = borrow.title;
    
    // 作者
    _author.text = borrow.author;
    
    // 出版社
    _publish.text = borrow.publish;
    
    // 索书号
    _number.text = borrow.number;
    
    // 馆藏地
    _place.text = borrow.place;
    
    // 时间
    _time.text = borrow.time;
    
    // 超时计费
    _bill.text = borrow.bill;
}

+ (NSString *)ID {
    return @"BorrowCell";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  QueryFrame.m
//  QLU
//
//  Created by 巩洪楼 on 15/9/30.
//  Copyright (c) 2015年 QLU. All rights reserved.
//

#import "QueryFrame.h"
#import "Query.h"

#define kImageXY 20
#define kImageW 90
#define kImageH 100
#define kCellBorder 10
#define kLabelH 20

@implementation QueryFrame

- (void)setQuery:(Query *)query {
    _query = query;
    
    // 1.图片
    CGFloat imageX = kImageXY;
    CGFloat imageY = kImageXY;
    CGFloat imageW = kImageW;
    CGFloat imageH = kImageH;
    _imageF = CGRectMake(imageX, imageY, imageW, imageH);
    
    // 2.书名
    CGFloat titleX = CGRectGetMaxX(_imageF)+kCellBorder;
    CGFloat titleY = imageY;
    CGFloat titleW = 375-titleX-kCellBorder;
    CGFloat titleH = 41;
    _titleF = CGRectMake(titleX, titleY, titleW, titleH);
    
    // 3.作者
    CGFloat authorX = titleX + 46;
    CGFloat authorY = titleY + titleH + kCellBorder;
    CGFloat authorW = 189;
    CGFloat authorH = kLabelH;
    _authorF = CGRectMake(authorX, authorY, authorW, authorH);
    
    // 4.出版社
    CGFloat publishX = titleX + 60;
    CGFloat publishY = CGRectGetMaxY(_authorF) + kCellBorder;
    CGFloat publishW = 175;
    CGFloat publishH = kLabelH;
    _publishF = CGRectMake(publishX, publishY, publishW, publishH);
    
    // 5.索书号
    CGFloat numberX = imageX + 60;
    CGFloat numberY = CGRectGetMaxY(_imageF) + kCellBorder;
    CGFloat numberW = 120;
    CGFloat numberH = kLabelH;
    _numberF = CGRectMake(numberX, numberY, numberW, numberH);
    
    // 6.馆藏地
    CGFloat placeX = CGRectGetMaxX(_numberF)+60;
    CGFloat placeY = CGRectGetMaxY(_imageF) + kCellBorder;
    CGFloat placeW = 95;
    CGFloat placeH = kLabelH;
    _placeF = CGRectMake(placeX, placeY, placeW, placeH);
    
    // 7.简介
    CGFloat descX = imageX;
    CGFloat descY = CGRectGetMaxY(_numberF) + kCellBorder + kLabelH + kCellBorder;
    CGFloat descW = 375 - 2*imageX;
    CGSize contentSize = [_query.desc boundingRectWithSize:CGSizeMake(descW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil].size;
    _descF = CGRectMake(descX, descY, descW, contentSize.height);
    
    // 行高
    _cellHeight = descY + contentSize.height + kCellBorder;
}

@end

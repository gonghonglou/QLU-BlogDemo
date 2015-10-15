//
//  QueryCell.m
//  QLU
//
//  Created by 巩洪楼 on 15/9/30.
//  Copyright (c) 2015年 QLU. All rights reserved.
//

#import "QueryCell.h"
#import "Query.h"
#import "QueryFrame.h"

#define kImageXY 20
#define kImageW 90
#define kImageH 100
#define kCellBorder 10
#define kLabelH 20

#import <UIImageView+WebCache.h>

@interface QueryCell () {
    // 1.封面
    UIImageView *_image;
    // 2.书名
    UILabel *_title;
    
    // 3.“作者”
    UILabel *_authorLabel;
    // 3.作者
    UILabel *_author;
    
    // 4.“出版社”
    UILabel *_publishLabel;
    // 4.出版社
    UILabel *_publish;
    
    // 5.“索书号”
    UILabel *_numberLabel;
    // 5.索书号
    UILabel *_number;
    
    // 6.“馆藏地”
    UILabel *_placeLabel;
    // 6.馆藏地
    UILabel *_place;
    
    // 7.“简介”
    UILabel *_descLabel;
    // 7.简介
    UILabel *_desc;
    
}

@end

@implementation QueryCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 添加内部的子控件
        // 1.封面
        _image = [[UIImageView alloc] init];
        [self.contentView addSubview:_image];
        
        // 2.书名
        _title = [[UILabel alloc] init];
        _title.numberOfLines = 0;
        [self.contentView addSubview:_title];
        
        // 3.“作者”
        CGFloat authorLabelX = kImageXY + kImageW + kCellBorder;
        CGFloat authorLabelY = kImageXY + 41 + kCellBorder;
        CGFloat authorLabelW = 46;
        CGFloat authorLabelH = kLabelH;
        _authorLabel = [[UILabel alloc] initWithFrame:CGRectMake(authorLabelX, authorLabelY, authorLabelW, authorLabelH)];
        _authorLabel.text = @"作者：";
        _authorLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_authorLabel];
        // 3.作者
        _author = [[UILabel alloc] init];
        [self.contentView addSubview:_author];
        
        // 4.“出版社”
        CGFloat publishLabelX = authorLabelX;
        CGFloat publishLabelY = authorLabelY + authorLabelH + kCellBorder;
        CGFloat publishLabelW = 60;
        CGFloat publishLabelH = kLabelH;
        _publishLabel = [[UILabel alloc] initWithFrame:CGRectMake(publishLabelX, publishLabelY, publishLabelW, publishLabelH)];
        _publishLabel.text = @"出版社：";
        _publishLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_publishLabel];
        // 4.出版社
        _publish = [[UILabel alloc] init];
        [self.contentView addSubview:_publish];
        
        // 5.“索书号”
        CGFloat numberLabelX = kImageXY;
        CGFloat numberLabelY = kImageXY + kImageH + kCellBorder;
        CGFloat numberLabelW = 60;
        CGFloat numberLabelH = kLabelH;
        _numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(numberLabelX, numberLabelY, numberLabelW, numberLabelH)];
        _numberLabel.text = @"索书号：";
        _numberLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_numberLabel];
        // 5.索书号
        _number = [[UILabel alloc] init];
        [self.contentView addSubview:_number];
        
        // 6.“馆藏地”
        CGFloat placeLabelX = kImageXY + numberLabelW + 120;
        CGFloat placeLabelY = numberLabelY;
        CGFloat placeLabelW = 60;
        CGFloat placeLabelH = kLabelH;
        _placeLabel = [[UILabel alloc] initWithFrame:CGRectMake(placeLabelX, placeLabelY, placeLabelW, placeLabelH)];
        _placeLabel.text = @"馆藏地：";
        _placeLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_placeLabel];
        // 6.馆藏地
        _place = [[UILabel alloc] init];
        [self.contentView addSubview:_place];
        
        
        // 7.“简介”
        CGFloat descX = kImageXY;
        CGFloat descY = numberLabelY + numberLabelH + kCellBorder;
        CGFloat descW = 80;
        CGFloat descH = kLabelH;
        _descLabel = [[UILabel alloc] initWithFrame:CGRectMake(descX, descY, descW, descH)];
        _descLabel.text = @"图书简介：";
        _descLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_descLabel];
        // 简介
        _desc = [[UILabel alloc] init];
        _desc.numberOfLines = 0;
        [self.contentView addSubview:_desc];
        
    }
    return self;
}

- (void)setQueryFrame:(QueryFrame *)queryFrame {
    _queryFrame = queryFrame;
    // 1.设置微博数据
    [self settingData];
    
    // 2.设置子控件的frame（x, y, width, height）
    [self settingSubviewFrame];
    
}

#pragma mark 设置子控件的frame
- (void) settingSubviewFrame {
    // 1.封面
    _image.frame = _queryFrame.imageF;
    
    // 2.书名
    _title.frame = _queryFrame.titleF;
    
    // 3.作者
    _author.frame = _queryFrame.authorF;
    
    // 4.出版社
    _publish.frame = _queryFrame.publishF;
    
    // 5.索书号
    _number.frame = _queryFrame.numberF;
    
    // 6.馆藏地
    _place.frame = _queryFrame.placeF;
    
    // 简介
    _desc.frame = _queryFrame.descF;}

#pragma mark 设置微博数据
- (void)settingData{
    Query *query = _queryFrame.query;
    
    // 封面
    NSString *imageStr = [query.image stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:imageStr];
    [_image sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"book.png"]];
    
    // 2.书名
    _title.text = query.title;
    _title.textColor = [UIColor grayColor];
    
    // 3.作者
    _author.text = query.author;
    _author.textColor = [UIColor grayColor];
    
    // 4.出版社
    _publish.text = query.publish;
    _publish.textColor = [UIColor grayColor];
    
    // 5.索书号
    _number.text = query.number;
    _number.textColor = [UIColor grayColor];
    
    // 6.馆藏地
    _place.text = query.place;
    _place.textColor = [UIColor grayColor];
    
    // 简介
    _desc.text = query.desc;
    _desc.textColor = [UIColor grayColor];
    
}


@end

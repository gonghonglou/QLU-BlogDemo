//
//  QueryFrame.h
//  QLU
//
//  Created by 巩洪楼 on 15/9/30.
//  Copyright (c) 2015年 QLU. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Query;

@interface QueryFrame : UIView 

@property (nonatomic, assign, readonly) CGRect imageF; // 封面图片
@property (nonatomic, assign, readonly) CGRect titleF; // 书名
@property (nonatomic, assign, readonly) CGRect authorF; // 作者
@property (nonatomic, assign, readonly) CGRect publishF; // 出版社
@property (nonatomic, assign, readonly) CGRect numberF; // 索书号
@property (nonatomic, assign, readonly) CGRect placeF; // 馆藏地
@property (nonatomic, assign, readonly) CGRect descF; // 简介

@property (nonatomic, assign, readonly) CGFloat cellHeight;

@property (nonatomic, strong) Query *query;

@end

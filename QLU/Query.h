//
//  Query.h
//  QLU
//
//  Created by 巩洪楼 on 15/9/30.
//  Copyright (c) 2015年 QLU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Query : NSObject

@property (nonatomic, copy) NSString *image; // 封面
@property (nonatomic, copy) NSString *title; // 书名
@property (nonatomic, copy) NSString *author; // 作者
@property (nonatomic, copy) NSString *publish; // 出版社
@property (nonatomic, copy) NSString *number; // 索书号
@property (nonatomic, copy) NSString *place; // 馆藏地
@property (nonatomic, copy) NSString *desc; // 简介


- (id)initWithDict:(NSDictionary *)dict;
+ (id)queryWithDict:(NSDictionary *)dict;

@end

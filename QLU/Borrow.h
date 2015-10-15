//
//  Borrow.h
//  QiluUniversityOfTechnology
//
//  Created by 巩洪楼 on 15/9/20.
//  Copyright (c) 2015年 巩洪楼. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Borrow : NSObject

@property (nonatomic, copy) NSString *image; // 封面
@property (nonatomic, copy) NSString *title; // 书名
@property (nonatomic, copy) NSString *author; // 作者
@property (nonatomic, copy) NSString *publish; // 出版社
@property (nonatomic, copy) NSString *number; // 索书号
@property (nonatomic, copy) NSString *place; // 馆藏地
@property (nonatomic, copy) NSString *time; // 时间
@property (nonatomic, copy) NSString *bill; // 超时计费

- (id)initWithDict:(NSDictionary *)dict;

+ (id)borrowWithDict:(NSDictionary *)dict;

@end

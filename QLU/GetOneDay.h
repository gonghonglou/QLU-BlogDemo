//
//  GetOneDay.h
//  QLU
//
//  Created by 巩洪楼 on 15/10/1.
//  Copyright (c) 2015年 QLU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetOneDay : NSObject

/**
 *  获取几年几月几日后的日期，0表示今天，负数表示之前
 */
+ (int)getOneDay:(int)day;

@end

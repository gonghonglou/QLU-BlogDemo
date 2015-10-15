//
//  GetsavePath.m
//  QiluUniversityOfTechnology
//
//  Created by 巩洪楼 on 15/9/19.
//  Copyright (c) 2015年 巩洪楼. All rights reserved.
//

#import "GetsavePath.h"

@implementation GetsavePath

+ (NSString *)savePath:(NSString *)string {
    
    // 数据接收完保存文件（注意苹果官方要求：下载数据只能保存在缓存目录）
    NSString *savePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    savePath = [savePath stringByAppendingPathComponent:string];
    NSLog(@"path:%@", savePath);
    
    return savePath;
}



@end

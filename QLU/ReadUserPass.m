//
//  ReadUserPass.m
//  QLU
//
//  Created by 巩洪楼 on 15/9/30.
//  Copyright (c) 2015年 QLU. All rights reserved.
//

#import "ReadUserPass.h"

@implementation ReadUserPass

+ (NSString *)readUsername {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *username = [defaults objectForKey:@"username"];
    return username;
}

+ (NSString *)readUsernameAndPassword {
    // 1.获取NSUserDefaults对象
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // 2.读取保存的数据
    NSString *username = [defaults objectForKey:@"username"];
    NSString *password = [defaults objectForKey:@"password"];
    
    return [NSString stringWithFormat:@"username = %@, password = %@", username, password];
}

@end

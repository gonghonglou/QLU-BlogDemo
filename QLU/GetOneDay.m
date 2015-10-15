//
//  GetOneDay.m
//  QLU
//
//  Created by 巩洪楼 on 15/10/1.
//  Copyright (c) 2015年 QLU. All rights reserved.
//

#import "GetOneDay.h"

@implementation GetOneDay

/**
 *  获取几年几月几日后的日期，0表示今天，负数表示之前
 */
+ (int)getOneDay:(int)day {
    int year = 0, month = 0;
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = nil;
    comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[NSDate date]];
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setYear:year];
    [adcomps setMonth:month];
    [adcomps setDay:day];
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:[NSDate date] options:0];
    
    NSDateFormatter  *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd"];
    NSString *  dayString = [formatter stringFromDate:newdate];
    return [dayString intValue];
}

@end

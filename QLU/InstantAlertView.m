//
//  InstantAlertView.m
//  QiluUniversityOfTechnology
//
//  Created by 巩洪楼 on 15/9/5.
//  Copyright (c) 2015年 巩洪楼. All rights reserved.
//

#import "InstantAlertView.h"

@implementation InstantAlertView

/**
 *  自动消失的弹框
 */
+ (void)timerFireMethod:(NSTimer*)theTimer//弹出框
{
    UIAlertView *promptAlert = (UIAlertView*)[theTimer userInfo];
    [promptAlert dismissWithClickedButtonIndex:0 animated:NO];
    promptAlert = NULL;
}


+ (void)showAlert:(NSString *) message{//时间
    UIAlertView *promptAlert = [[UIAlertView alloc] initWithTitle:message message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    [NSTimer scheduledTimerWithTimeInterval:1.0f
                                     target:self
                                   selector:@selector(timerFireMethod:)
                                   userInfo:promptAlert
                                    repeats:YES];
    [promptAlert show];
}

@end

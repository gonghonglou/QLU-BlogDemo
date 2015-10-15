//
//  EmbtyViewController.m
//  QiluUniversityOfTechnology
//
//  Created by 巩洪楼 on 15/9/3.
//  Copyright (c) 2015年 巩洪楼. All rights reserved.
//

#import "EmbtyViewController.h"

@interface EmbtyViewController ()

@end

@implementation EmbtyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"空余教室查询";

    //轻扫手势
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(popController)];
    swipeGesture.direction = UISwipeGestureRecognizerDirectionRight; // 设置轻扫方向
    [self.view addGestureRecognizer:swipeGesture];
    
}

- (void)popController{
    [self.navigationController popViewControllerAnimated:YES];
}


@end

//
//  QuestionViewController.m
//  QLU
//
//  Created by 巩洪楼 on 15/9/28.
//  Copyright (c) 2015年 QLU. All rights reserved.
//

#import "QuestionViewController.h"

@interface QuestionViewController ()

@end

@implementation QuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"常见问题";
    
    
    //轻扫手势
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(popController)];
    swipeGesture.direction = UISwipeGestureRecognizerDirectionRight; // 设置轻扫方向
    [self.view addGestureRecognizer:swipeGesture];
    
}

- (void)popController{
    [self.navigationController popViewControllerAnimated:YES];
}


@end

//
//  ElectricViewController.m
//  QiluUniversityOfTechnology
//
//  Created by 巩洪楼 on 15/9/3.
//  Copyright (c) 2015年 巩洪楼. All rights reserved.
//

#import "ElectricViewController.h"
#import "InstantAlertView.h"

#define kTextFieldX 10
#define kTextFieldY 120

@interface ElectricViewController ()  {
    UITextField *_building;
    UITextField *_dormitory;
}

@end

@implementation ElectricViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"宿舍电费查询";
    
    [self setSubview];

    //轻扫手势
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(popController)];
    swipeGesture.direction = UISwipeGestureRecognizerDirectionRight; // 设置轻扫方向
    [self.view addGestureRecognizer:swipeGesture];
    
}

- (void)popController{
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)setSubview {
    UILabel *txt = [[UILabel alloc] initWithFrame:CGRectMake(kTextFieldX,kTextFieldY-40,self.view.frame.size.width-2*kTextFieldX,40)];
    txt.text = [NSString stringWithFormat:@"输入宿舍楼与宿舍号查询宿舍剩余电费"];
    txt.textColor = [UIColor grayColor];
    txt.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:txt];
    
    _building = [[UITextField alloc]initWithFrame:CGRectMake(kTextFieldX,kTextFieldY, self.view.frame.size.width-2*kTextFieldX, 40)];
    [_building setBorderStyle:UITextBorderStyleRoundedRect];
    _building.placeholder=[NSString stringWithFormat:@"请输入宿舍楼"];
    _building.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:_building];
    
    _dormitory = [[UITextField alloc]initWithFrame:CGRectMake(kTextFieldX,kTextFieldY+50, self.view.frame.size.width-2*kTextFieldX, 40)];
    [_dormitory setBorderStyle:UITextBorderStyleRoundedRect];
    _dormitory.placeholder=[NSString stringWithFormat:@"请输入宿舍号"];
    _dormitory.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:_dormitory];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"查         询" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(query) forControlEvents:UIControlEventTouchUpInside];
    [btn setFrame:CGRectMake(kTextFieldX, kTextFieldY+120, self.view.frame.size.width-2*kTextFieldX, 44)];
    btn.backgroundColor = [UIColor colorWithRed:160.0/255 green:213.0/255 blue:255.0/255 alpha:1];
    btn.layer.cornerRadius=5;
    [self.view addSubview:btn];
}

- (void)query {
    
    if ([_building.text isEqual: @""] || [_dormitory.text isEqual: @""]) {
        
        [InstantAlertView showAlert:@"宿舍楼或者宿舍号不能为空哦"];
        
        return;
    }
    
    NSLog(@"向服务器发送请求");
    
    //隐藏键盘
    [_building resignFirstResponder];
    [_dormitory resignFirstResponder];
}


@end

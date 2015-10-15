//
//  CodeViewController.m
//  QiluUniversityOfTechnology
//
//  Created by 巩洪楼 on 15/9/2.
//  Copyright (c) 2015年 巩洪楼. All rights reserved.
//

#import "CodeViewController.h"
#import "InstantAlertView.h"
#import "ReadUserPass.h"

#define kLabelX 10
#define kLabelY 80


@interface CodeViewController () {
    UITextField *_odePassword;
    UITextField *_nowPassword;
    UITextField *_surePassword;
    UIButton *_btn;
}

@end

@implementation CodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"修改一卡通密码";
    
    [self setSubView];
    
    //轻扫手势
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(popController)];
    swipeGesture.direction = UISwipeGestureRecognizerDirectionRight; // 设置轻扫方向
    [self.view addGestureRecognizer:swipeGesture];
    
}

- (void)popController{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:NO];
}

- (void)setSubView {
    UILabel *txt1 = [[UILabel alloc] initWithFrame:CGRectMake(kLabelX,kLabelY,200,40)];
    txt1.text = [NSString stringWithFormat:@"当前学号  %@", [ReadUserPass readUsername]]; // 从服务器获取学号数据
    txt1.textColor = [UIColor whiteColor];
    txt1.backgroundColor = [UIColor colorWithRed:160.0/255 green:213.0/255 blue:255.0/255 alpha:1];
    [txt1.layer setMasksToBounds:YES];
    txt1.layer.cornerRadius = 5;
    [self.view addSubview:txt1];
    
    UILabel *txt2 = [[UILabel alloc] initWithFrame:CGRectMake(kLabelX,kLabelY+50,self.view.frame.size.width-2*kLabelX,40)];
    txt2.text = [NSString stringWithFormat:@"为了保证你的数据，修改密码前请填写原密码"];
    txt2.textColor = [UIColor grayColor];
    txt2.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:txt2];
    
    _odePassword = [[UITextField alloc]initWithFrame:CGRectMake(kLabelX,kLabelY+90, self.view.frame.size.width-2*kLabelX, 40)];
    [_odePassword setBorderStyle:UITextBorderStyleRoundedRect];
    [_odePassword setSecureTextEntry:YES];
    _odePassword.placeholder=[NSString stringWithFormat:@"一卡通原密码"];
    _odePassword.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:_odePassword];
    
    UILabel *txt3 = [[UILabel alloc] initWithFrame:CGRectMake(kLabelX,kLabelY+140,self.view.frame.size.width-2*kLabelX,40)];
    txt3.text = [NSString stringWithFormat:@"请输入新密码并确认新密码"];
    txt3.textColor = [UIColor grayColor];
    txt3.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:txt3];
    
    _nowPassword = [[UITextField alloc]initWithFrame:CGRectMake(kLabelX,kLabelY+180, self.view.frame.size.width-2*kLabelX, 40)];
    [_nowPassword setBorderStyle:UITextBorderStyleRoundedRect];
    [_nowPassword setSecureTextEntry:YES];
    _nowPassword.placeholder=[NSString stringWithFormat:@"一卡通新密码"];
    _nowPassword.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:_nowPassword];
    
    _surePassword = [[UITextField alloc]initWithFrame:CGRectMake(kLabelX,kLabelY+230, self.view.frame.size.width-2*kLabelX, 40)];
    [_surePassword setBorderStyle:UITextBorderStyleRoundedRect];
    [_surePassword setSecureTextEntry:YES];
    _surePassword.placeholder=[NSString stringWithFormat:@"确认新密码"];
    _surePassword.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:_surePassword];
    
    _btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_btn setTitle:@"修          改" forState:UIControlStateNormal];
    [_btn setFrame:CGRectMake(kLabelX, kLabelY+300, self.view.frame.size.width-2*kLabelX, 44)];
    _btn.backgroundColor = [UIColor colorWithRed:160.0/255 green:213.0/255 blue:255.0/255 alpha:1];
    _btn.layer.cornerRadius=5;
    [_btn addTarget:self action:@selector(changeCode) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
}

// 点击修改
- (void)changeCode {
    if ([_odePassword.text isEqual: @""] || [_nowPassword.text isEqual: @""] || [_surePassword.text isEqual: @""]) {
        [InstantAlertView showAlert:@"账号或密码不能为空哦"];
        return;
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"确认修改" message:nil delegate:self cancelButtonTitle:@"是的" otherButtonTitles:@"放弃", nil];
    alert.alertViewStyle = UIAlertViewStyleDefault;
    [alert show];
}

//根据被点击按钮的索引处理点击事件
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(buttonIndex == 0) {
        NSLog(@"向服务器发送指令修改一卡通密码");
        [InstantAlertView showAlert:@"修改一卡通密码成功"];
    } 
}


@end

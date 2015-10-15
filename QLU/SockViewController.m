//
//  SockViewController.m
//  QiluUniversityOfTechnology
//
//  Created by 巩洪楼 on 15/9/2.
//  Copyright (c) 2015年 巩洪楼. All rights reserved.
//

#import "SockViewController.h"
#import "InstantAlertView.h"
#import "ReadUserPass.h"

#define kTextFieldX 10
#define kTextFieldY 150


@interface SockViewController () <UIAlertViewDelegate> {
    UITextField *_username;
    UITextField *_password;
    UILabel *_txtSock2;
}

@end

@implementation SockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"挂失/解挂";
    
    [self setSubview];
    
    //轻扫手势
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(popController)];
    swipeGesture.direction = UISwipeGestureRecognizerDirectionRight; // 设置轻扫方向
    [self.view addGestureRecognizer:swipeGesture];
}

- (void)popController{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [_username resignFirstResponder];
    [_password resignFirstResponder];
}


- (void)setSubview {
    _username = [[UITextField alloc]initWithFrame:CGRectMake(kTextFieldX,kTextFieldY, self.view.frame.size.width-2*kTextFieldX, 40)];
    [_username setBorderStyle:UITextBorderStyleRoundedRect];
    _username.placeholder=[NSString stringWithFormat:@"请输入学号"];
    _username.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:_username];
    
    _password = [[UITextField alloc]initWithFrame:CGRectMake(kTextFieldX,kTextFieldY+50, self.view.frame.size.width-2*kTextFieldX, 40)];
    [_password setBorderStyle:UITextBorderStyleRoundedRect];
    [_password setSecureTextEntry:YES];
    _password.placeholder=[NSString stringWithFormat:@"请输入一卡通密码"];
    _password.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:_password];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn1 setTitle:@"挂  失" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(sock) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setFrame:CGRectMake(kTextFieldX, kTextFieldY+120, (self.view.frame.size.width-4*kTextFieldX)/2, 44)];
    btn1.backgroundColor = [UIColor colorWithRed:160.0/255 green:213.0/255 blue:255.0/255 alpha:1];
    // 设置圆角
    btn1.layer.cornerRadius=5;
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn2 setTitle:@"解  挂" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(unsock) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setFrame:CGRectMake((self.view.frame.size.width-4*kTextFieldX)/2+3*kTextFieldX, kTextFieldY+120, (self.view.frame.size.width-4*kTextFieldX)/2, 44)];
    btn2.backgroundColor = [UIColor colorWithRed:160.0/255 green:213.0/255 blue:255.0/255 alpha:1];
    btn2.layer.cornerRadius = 5;
    [self.view addSubview:btn2];
    
    
    UILabel *txtSock1 = [[UILabel alloc] initWithFrame:CGRectMake(kTextFieldX,100,60,35)];
    [txtSock1 setText:@"状  态 : "];
    txtSock1.backgroundColor = [UIColor colorWithRed:160.0/255 green:213.0/255 blue:255.0/255 alpha:1];
    // 设置圆角,注意引用头文件#import <QuartzCore/QuartzCore.h>
    [txtSock1.layer setMasksToBounds:YES];
    txtSock1.layer.cornerRadius = 5;
    [self.view addSubview:txtSock1];
    
    _txtSock2 = [[UILabel alloc] initWithFrame:CGRectMake(kTextFieldX+70,100,70,35)];
    [_txtSock2 setText:@"未挂失"];
    _txtSock2.textColor = [UIColor redColor];
    [self.view addSubview:_txtSock2];
}

// 挂失
- (void)sock {
    [self subSock:1001];
}

// 解挂
- (void)unsock {
    [self subSock:1002];
}

- (void)subSock:(int)tag {
    if ([_username.text isEqual: @""] || [_password.text isEqual: @""]) {
        [InstantAlertView showAlert:@"账号或密码不能为空哦"];
        return;
    } else if (![_username.text isEqualToString: [ReadUserPass readUsername]]) {
        [InstantAlertView showAlert:@"所输学号与当前账号不符，请重新输入"];
        return;
    }
    [_username resignFirstResponder];
    [_password resignFirstResponder];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"确认挂失" message:nil delegate:self cancelButtonTitle:@"是的" otherButtonTitles:@"放弃", nil];
    alert.alertViewStyle = UIAlertViewStyleDefault;
    //这个属性继承自UIView，当一个视图中有多个AlertView时，可以用这个属性来区分
    alert.tag = tag;
    [alert show];
}

//根据被点击按钮的索引处理点击事件
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    // 点击挂失弹出的alertView
    if(alertView .tag == 1001 )
    {
        if(buttonIndex == 0) {
            if ([_txtSock2.text  isEqual: @"已挂失"]) {
                [InstantAlertView showAlert:@"一卡通已处于挂失状态"];
                return;
            }
            NSLog(@"确认挂失，向服务器发送指令");
            _txtSock2.text = @"已挂失";
            [InstantAlertView showAlert:@"挂失成功"];
            
        } else {
            NSLog(@"放弃挂失");
        }
    }
    // 点击解挂弹出的alertView
    if(alertView .tag == 1002 )
    {
        if(buttonIndex == 0) {
            if ([_txtSock2.text  isEqual: @"未挂失"]) {
                [InstantAlertView showAlert:@"一卡通处于未挂失状态"];
                return;
            }
            NSLog(@"确认解挂，向服务器发送指令");
            _txtSock2.text = @"未挂失";
            [InstantAlertView showAlert:@"解挂成功"];
        } else {
            NSLog(@"放弃挂失");
        }
    }
}

@end

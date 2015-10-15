//
//  ViewController.m
//  QLU
//
//  Created by 巩洪楼 on 15/9/28.
//  Copyright (c) 2015年 QLU. All rights reserved.
//

#import "ViewController.h"
#import "InstantAlertView.h"
#import "CourseViewController.h"
#import "CardViewController.h"
#import "LibraryViewController.h"
#import "OtherViewController.h"
#import "MineViewController.h"
#import "ReadUserPass.h"
#import "GetsavePath.h"


#import <MBProgressHUD.h>


#define kTextFieldX 10
#define kTextFieldY 180

@interface ViewController () {
    UITextField *_username;
    UITextField *_password;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setSubview];
    
    // 读取账号密码
    [self readUsernameAndPassword];
    if (!([_username.text isEqual: @""] || [_password.text isEqual: @""])) {
        [NSTimer scheduledTimerWithTimeInterval:0.0 target:self selector:@selector(presentTabBarController:)  userInfo:nil repeats:NO];
    }
}


- (void)setSubview {
    UIImageView *emblem = [[UIImageView alloc] init];
    emblem.image = [UIImage imageNamed:@"emblem.jpg"];
    emblem.frame = CGRectMake((self.view.frame.size.width-100)/2,60,100,100);
    [self.view addSubview:emblem];
    
    _username = [[UITextField alloc] initWithFrame:CGRectMake(kTextFieldX,kTextFieldY, self.view.frame.size.width-2*kTextFieldX, 40)];
    [_username setBorderStyle:UITextBorderStyleRoundedRect];
    _username.placeholder=[NSString stringWithFormat:@"请输入学号"];
    _username.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:_username];
    
    _password = [[UITextField alloc] initWithFrame:CGRectMake(kTextFieldX,kTextFieldY+50, self.view.frame.size.width-2*kTextFieldX, 40)];
    [_password setBorderStyle:UITextBorderStyleRoundedRect];
    [_password setSecureTextEntry:YES];
    _password.placeholder=[NSString stringWithFormat:@"请输入密码"];
    _password.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:_password];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"登         录" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [btn setFrame:CGRectMake(kTextFieldX, kTextFieldY+120, self.view.frame.size.width-2*kTextFieldX, 44)];
    btn.backgroundColor = [UIColor colorWithRed:160.0/255 green:213.0/255 blue:255.0/255 alpha:1];
    btn.layer.cornerRadius=5;
    [self.view addSubview:btn];
}

// 点击屏幕退出键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [_username resignFirstResponder];
    [_password resignFirstResponder];
}

// 点击登录方法
- (void)login {
    if ([_username.text isEqual: @""] || [_password.text isEqual: @""]) {
        [InstantAlertView showAlert:@"账号或密码不能为空哦"];
        return;
    }
    [_username resignFirstResponder];
    [_password resignFirstResponder];
    
    [self loginHUD];
}


// 存储账号密码
- (void)saveUsernameAndPassword:(NSString *)name password:(NSString *)paw {
    // 1.获取NSUserDefaults对象
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    // 2.保存数据（如果设置数据之后没有同步，会在将来某一时间点自动将数据保存到preferences文件夹下面）
    [defaults setObject:name forKey:@"username"];
    [defaults setObject:paw forKey:@"password"];
    // 3.强制让数据立刻保存
    [defaults synchronize];
    
    NSLog(@"保存了username = %@, password = %@", _username.text, _password.text);
}
- (void)readUsernameAndPassword {
    
    // 1.获取NSUserDefaults对象
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // 2.读取保存的数据
    _username.text = [defaults objectForKey:@"username"];
    _password.text = [defaults objectForKey:@"password"];
    
    // 打印数据
    NSLog(@"username = %@, password = %@", _username.text, _password.text);
}


// 动画推出tabBarController
- (void)presentTabBarController:(BOOL)bo {
    CourseViewController *courseVC = [[CourseViewController alloc] init];
    UINavigationController *courseNC = [self addNavigationController:courseVC navigationItemTitle:@"课程表" tabBarItemTitle:@"课程表" image:@"course.png"];
    
    CardViewController *cardVC = [[CardViewController alloc] init];
    UINavigationController *cardNC = [self addNavigationController:cardVC navigationItemTitle:@"一卡通" tabBarItemTitle:@"一卡通" image:@"card.png"];
    
    LibraryViewController *libraryVC = [[LibraryViewController alloc] init];
    UINavigationController *libraryNC = [self addNavigationController:libraryVC navigationItemTitle:@"图书馆" tabBarItemTitle:@"图书馆" image:@"library.png"];
    
    OtherViewController *otherVC = [[OtherViewController alloc] init];
    UINavigationController *otherNC = [self addNavigationController:otherVC navigationItemTitle:@"其他" tabBarItemTitle:@"其他" image:@"other.png"];
    
    MineViewController *mineVC = [[MineViewController alloc] init];
    UINavigationController *mineNC = [self addNavigationController:mineVC navigationItemTitle:@"我" tabBarItemTitle:@"我" image:@"mine.png"];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.tabBar.backgroundColor = [UIColor whiteColor];
    tabBarController.viewControllers = [NSArray arrayWithObjects:courseNC, cardNC, libraryNC, otherNC, mineNC, nil];
    tabBarController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:tabBarController animated:bo completion:^{
    }];
}

// 返回UINavigationController方法
- (UINavigationController *)addNavigationController:(UIViewController *)VC navigationItemTitle:(NSString *)navigationItemStr tabBarItemTitle:(NSString *)tabBarItemStr image:(NSString *)image {
    VC.navigationItem.title = navigationItemStr;
    VC.tabBarItem.title = tabBarItemStr;
    VC.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    VC.tabBarItem.selectedImage = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController  *NC = [[UINavigationController alloc] initWithRootViewController:VC];
    NC.navigationBar.barStyle = UIBarStyleBlack;
    return NC;
}


- (void)loginHUD {
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
//    HUD.labelText = @"登录...";
    [HUD showAnimated:YES whileExecutingBlock:^{
        // 保存用户并推出tabbar
        [self saveUsernameAndPassword:_username.text password:_password.text];
        [self presentTabBarController:YES];
    } completionBlock:^{
        [HUD removeFromSuperview];
    }];
}


@end

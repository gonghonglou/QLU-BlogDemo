//
//  MineViewController.m
//  QLU
//
//  Created by 巩洪楼 on 15/9/28.
//  Copyright (c) 2015年 QLU. All rights reserved.
//

#import "MineViewController.h"
#import "ChangeViewController.h"
#import "SuggestViewController.h"
#import "FunctionViewController.h"
#import "ReadUserPass.h"

@interface MineViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //添加tableView
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 44) style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 2) {
        return 2;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    if (indexPath.section == 0) {
        cell.imageView.image = [UIImage imageNamed:@"me.png"];
        // 名字应当从服务器返回
        cell.textLabel.text = [NSString stringWithFormat:@"姓名：%@", @"巩洪楼"];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"学号：%@", [ReadUserPass readUsername]];
    } else if (indexPath.section == 1) {
        cell.imageView.image = [UIImage imageNamed:@"change.png"];
        cell.textLabel.text = @"修改登录密码";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            cell.imageView.image = [UIImage imageNamed:@"suggest.png"];
            cell.textLabel.text = @"意见反馈";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        } else {
            cell.imageView.image = [UIImage imageNamed:@"function.png"];
            cell.textLabel.text = @"功能介绍";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }else {
        cell.textLabel.text = @"                          退 出 登 录";
        cell.textLabel.textColor = [UIColor redColor];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 80;
    }
    return 44;
}

#pragma mark 监听cell的点击
#pragma mark 点击了cell就会调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 0.取消选中这一行(去掉选中背景)
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 1) {
        ChangeViewController *changeVC = [[ChangeViewController alloc] init];
        [self.navigationController pushViewController:changeVC animated:YES];
    } else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            SuggestViewController *suggestVC = [[SuggestViewController alloc] init];
            [self.navigationController pushViewController:suggestVC animated:YES];
        } else {
            FunctionViewController *functionVC = [[FunctionViewController alloc] init];
            [self.navigationController pushViewController:functionVC animated:YES];
        }
    }else if (indexPath.section == 3) {
        // 1.获取NSUserDefaults对象
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        // 2.删除数据
        [defaults removeObjectForKey:@"username"];
        [defaults removeObjectForKey:@"password"];
        
        [self dismissViewControllerAnimated:YES completion:^{
            NSLog(@"dismiss finished");
        }];
    }
}

@end

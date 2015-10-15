//
//  CardViewController.m
//  QLU
//
//  Created by 巩洪楼 on 15/9/28.
//  Copyright (c) 2015年 QLU. All rights reserved.
//

#import "CardViewController.h"
#import "SockViewController.h"
#import "CodeViewController.h"
#import "PayViewController.h"
#import "BillViewController.h"
#import "QuestionViewController.h"


@interface CardViewController () <UITableViewDataSource, UITableViewDelegate> {
    UITableView *_tableView;
}

@end

@implementation CardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //添加tableView
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.imageView.image = [UIImage imageNamed:@"money.png"];
            cell.textLabel.text = @"我的余额";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%@元", @"85.5"];
        } else {
            cell.imageView.image = [UIImage imageNamed:@"pay.png"];
            cell.textLabel.text = @"充值";
            //设置最右边的小图片
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.imageView.image = [UIImage imageNamed:@"sock.png"];
            cell.textLabel.text = @"挂失/解挂";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        } else {
            cell.imageView.image = [UIImage imageNamed:@"code.png"];
            cell.textLabel.text = @"密码修改";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    } else {
        if (indexPath.row == 0) {
            cell.imageView.image = [UIImage imageNamed:@"bill.png"];
            cell.textLabel.text = @"流水信息";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        } else {
            cell.imageView.image = [UIImage imageNamed:@"question.png"];
            cell.textLabel.text = @"常见问题";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    return cell;
}


#pragma mark 监听cell的点击
#pragma mark 点击了cell就会调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 0.取消选中这一行(去掉选中背景)
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        if (indexPath.row == 1) {
            PayViewController *payVC = [[PayViewController alloc] init];
            [self.navigationController pushViewController:payVC animated:YES];
        }
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            SockViewController *sockVC = [[SockViewController alloc] init];
            [self.navigationController pushViewController:sockVC animated:YES];
        } else {
            CodeViewController *codeVC = [[CodeViewController alloc] init];
            [self.navigationController pushViewController:codeVC animated:YES];
        }
    } else {
        if (indexPath.row == 0) {
            BillViewController *billVC = [[BillViewController alloc] init];
            [self.navigationController pushViewController:billVC animated:YES];
        } else {
            QuestionViewController *questionVC = [[QuestionViewController alloc] init];
            [self.navigationController pushViewController:questionVC animated:YES];
        }
    }
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return nil;
    } else if (section == 1) {
        return @"一卡通挂失与密码";
    } else {
        return @"一卡通其他资讯";
    }
}


@end

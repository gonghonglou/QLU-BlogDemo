//
//  OtherViewController.m
//  QLU
//
//  Created by 巩洪楼 on 15/9/28.
//  Copyright (c) 2015年 QLU. All rights reserved.
//

#import "OtherViewController.h"
#import "ExamViewController.h"
#import "MarkViewController.h"
#import "EmbtyViewController.h"
#import "ElectricViewController.h"
#import "BusViewController.h"

@interface OtherViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation OtherViewController

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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = nil;
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.imageView.image = [UIImage imageNamed:@"exam.png"];
            cell.textLabel.text = @"考试";
        } else {
            cell.imageView.image = [UIImage imageNamed:@"mark.png"];
            cell.textLabel.text = @"成绩";
        }
    } else {
        if (indexPath.row == 0) {
            cell.imageView.image = [UIImage imageNamed:@"empty.png"];
            cell.textLabel.text = @"空余教室";
        } else if (indexPath.row == 1) {
            cell.imageView.image = [UIImage imageNamed:@"electric.png"];
            cell.textLabel.text = @"宿舍电费";
        } else {
            cell.imageView.image = [UIImage imageNamed:@"bus.png"];
            cell.textLabel.text = @"班车信息";
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
        if (indexPath.row == 0) {
            ExamViewController *examVC = [[ExamViewController alloc] init];
            [self.navigationController pushViewController:examVC animated:YES];
        } else {
            MarkViewController *markVC = [[MarkViewController alloc] init];
            [self.navigationController pushViewController:markVC animated:YES];
        }
        
    } else {
        if (indexPath.row == 0) {
            EmbtyViewController *emptyVC = [[EmbtyViewController alloc] init];
            [self.navigationController pushViewController:emptyVC animated:YES];
        } else if (indexPath.row == 1) {
            ElectricViewController *electricVC = [[ElectricViewController alloc] init];
            [self.navigationController pushViewController:electricVC animated:YES];
        } else {
            BusViewController *busVC = [[BusViewController alloc] init];
            [self.navigationController pushViewController:busVC animated:YES];
        }
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"考试与成绩查询";
    } else {
        return @"其他信息查询";
    }
}

@end

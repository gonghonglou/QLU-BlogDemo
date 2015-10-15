//
//  LibraryViewController.m
//  QLU
//
//  Created by 巩洪楼 on 15/9/28.
//  Copyright (c) 2015年 QLU. All rights reserved.
//

#import "LibraryViewController.h"
#import "BorrowViewController.h"
#import "QueryViewController.h"
#import "ListViewController.h"
#import "OnlineViewController.h"
#import "NewsViewController.h"

@interface LibraryViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation LibraryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //添加tableView
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    
    if (indexPath.section == 0) {
        cell.imageView.image = [UIImage imageNamed:@"query.png"];
        cell.textLabel.text = @"查找书籍";
        //设置最右边的小图片
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.imageView.image = [UIImage imageNamed:@"borrow.png"];
            cell.textLabel.text = @"我的借阅";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        } else {
            cell.imageView.image = [UIImage imageNamed:@"list.png"];
            cell.textLabel.text = @"借阅记录";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    } else {
        if (indexPath.row == 0) {
            cell.imageView.image = [UIImage imageNamed:@"online.png"];
            cell.textLabel.text = @"在线阅读";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        } else {
            cell.imageView.image = [UIImage imageNamed:@"news.png"];
            cell.textLabel.text = @"资讯";
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
        QueryViewController *queryVC = [[QueryViewController alloc] init];
        [self.navigationController pushViewController:queryVC animated:YES];
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            BorrowViewController *borrowVC = [[BorrowViewController alloc] init];
            [self.navigationController pushViewController:borrowVC animated:YES];
        } else {
            ListViewController *listVC = [[ListViewController alloc] init];
            [self.navigationController pushViewController:listVC animated:YES];
        }
    } else {
        if (indexPath.row == 0) {
            OnlineViewController *onlineVC = [[OnlineViewController alloc] init];
            [self.navigationController pushViewController:onlineVC animated:YES];
        } else {
            NewsViewController *newsVC = [[NewsViewController alloc] init];
            [self.navigationController pushViewController:newsVC animated:YES];
        }
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return nil;
    } else if (section == 1) {
        return @"查询当前借阅和往期借阅";
    } else {
        return @"图书馆在线阅读与资讯";
    }
}

@end

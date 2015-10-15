//
//  BorrowViewController.m
//  QiluUniversityOfTechnology
//
//  Created by 巩洪楼 on 15/9/3.
//  Copyright (c) 2015年 巩洪楼. All rights reserved.
//

#import "BorrowViewController.h"
#import "Borrow.h"
#import "BorrowCell.h"

#import <MJRefresh.h>


@interface BorrowViewController () <UITableViewDataSource, UITableViewDelegate> {
    NSMutableArray *_borrows;
    UITableView *_tableView;
}

@end

@implementation BorrowViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"我的借阅";

    //轻扫手势
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(popController)];
    swipeGesture.direction = UISwipeGestureRecognizerDirectionRight; // 设置轻扫方向
    [self.view addGestureRecognizer:swipeGesture];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    // 高度固定
    _tableView.rowHeight = 200;
    
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(sendRequest)];
    header.lastUpdatedTimeLabel.hidden = YES;
    [header setTitle:@"小楼帮你刷新..." forState:MJRefreshStateRefreshing];
    [header beginRefreshing];
    _tableView.header = header;
}


- (void)popController{
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _borrows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BorrowCell *cell = [tableView dequeueReusableCellWithIdentifier:[BorrowCell ID]];
    if (!cell) {
        cell = [BorrowCell borrowCell];
    }
    Borrow *borrow = _borrows[indexPath.row];
    cell.borrow = borrow;
    return cell;
}

- (void)sendRequest {
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Borrow.plist" ofType:nil]];
    _borrows = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [_borrows addObject:[Borrow borrowWithDict:dict]];
    }
    [_tableView reloadData];
    [_tableView.header endRefreshing];

}

@end

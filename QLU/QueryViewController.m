//
//  QueryViewController.m
//  QiluUniversityOfTechnology
//
//  Created by 巩洪楼 on 15/9/3.
//  Copyright (c) 2015年 巩洪楼. All rights reserved.
//

#import "QueryViewController.h"
#import "InstantAlertView.h"
#import "QueryCell.h"
#import "Query.h"
#import "QueryFrame.h"

#define kLabelX 10
#define kLabelY 70

@interface QueryViewController () <UITableViewDataSource, UITableViewDelegate> {
    UITextField *_bookname;
    UITableView *_tableView;
    NSMutableArray *_queryFrames;
}

@end

@implementation QueryViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"查找书籍";

    //轻扫手势
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(popController)];
    swipeGesture.direction = UISwipeGestureRecognizerDirectionRight; // 设置轻扫方向
    [self.view addGestureRecognizer:swipeGesture];
    
    //添加tableView
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kLabelY+90, self.view.frame.size.width, self.view.frame.size.height-140) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    // 添加查询控件
    [self setSubview];
}

- (void)popController{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setSubview {
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(kLabelX, kLabelY, self.view.frame.size.width-2*kLabelX, 40)];
    name.text = @"请输入想要查询的数目名称或者关键字";
    name.textColor = [UIColor grayColor];
    name.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:name];
    
    _bookname = [[UITextField alloc] initWithFrame:CGRectMake(kLabelX, kLabelY+40, self.view.frame.size.width-2*kLabelX, 40)];
    [_bookname setBorderStyle:UITextBorderStyleRoundedRect];
    _bookname.placeholder=[NSString stringWithFormat:@"数目名称或者关键字"];
    _bookname.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:_bookname];

    UIButton *quere = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [quere setTitle:@"查      询" forState:UIControlStateNormal];
    [quere addTarget:self action:@selector(queueBook) forControlEvents:UIControlEventTouchUpInside];
    [quere setFrame:CGRectMake(kLabelX, kLabelY+90, self.view.frame.size.width-2*kLabelX, 44)];
    quere.backgroundColor = [UIColor colorWithRed:160.0/255 green:213.0/255 blue:255.0/255 alpha:1];
    quere.layer.cornerRadius=5;
    [self.view addSubview:quere];
}

- (void)queueBook {
    if ([_bookname.text isEqual: @""]) {
        [InstantAlertView showAlert:@"搜索内容不能为空哦"];
        return;
    }
    [_bookname resignFirstResponder];
    
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Query.plist" ofType:nil]];
    _queryFrames = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        // 创建frame对象
        QueryFrame *queryF = [[QueryFrame alloc] init];
        queryF.query = [Query queryWithDict:dict];
        [_queryFrames addObject:queryF];
    }
    [_tableView reloadData];
}

#pragma mark - tableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _queryFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    QueryCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (!cell) {
        cell = [[QueryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.queryFrame = _queryFrames[indexPath.row];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [_queryFrames[indexPath.row] cellHeight];
}



@end

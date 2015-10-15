//
//  MarkViewController.m
//  QiluUniversityOfTechnology
//
//  Created by 巩洪楼 on 15/9/3.
//  Copyright (c) 2015年 巩洪楼. All rights reserved.
//

#import "MarkViewController.h"
#import "InstantAlertView.h"
#import "Mark.h"
#import "MarkCell.h"

#define kLabel 10

@interface MarkViewController () <UIPickerViewDataSource,UIPickerViewDelegate, UITableViewDataSource> {
    NSString *_year;
    NSString *_term;
    NSArray *_arr1;
    NSArray *_arr2;
    NSMutableArray *_marks;
    UITableView *_tableView;
}
@end

@implementation MarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"成绩查询";
    
    //添加tableView
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, self.view.frame.size.height - 170) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    // 固定行高
    _tableView.rowHeight = 100;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(kLabel,70,100,40)];
    [label setText:@"学  年"];
    label.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:label];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-20)/2+50,70,100,40)];
    [label1 setText:@"学  期"];
    label1.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:label1];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"查         询" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(query) forControlEvents:UIControlEventTouchUpInside];
    [btn setFrame:CGRectMake(kLabel, 200, self.view.frame.size.width-20, 40)];
    btn.backgroundColor = [UIColor colorWithRed:160.0/255 green:213.0/255 blue:255.0/255 alpha:1];
    // 设置圆角,注意引用头文件#import <QuartzCore/QuartzCore.h>
    [btn.layer setMasksToBounds:YES];
    btn.layer.cornerRadius=5;
    [self.view addSubview:btn];
    
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(kLabel, 40, self.view.frame.size.width-20, 100)];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    pickerView.showsSelectionIndicator=YES;
    [self.view addSubview:pickerView];
    
    // 年份应当从服务器返回
    _arr1 = @[@"", @"2012-2013", @"2013-2014", @"2014-2015", @"2015-2016"];
    _arr2 = @[@"", @"1", @"2"];
    
    //轻扫手势
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(popController)];
    swipeGesture.direction = UISwipeGestureRecognizerDirectionRight; // 设置轻扫方向
    [self.view addGestureRecognizer:swipeGesture];
    
}

- (void)popController{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark- 设置数据
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return [_arr1 count];
    }
    return [_arr2 count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return _arr1[row];
    }
    return _arr2[row];
}

#pragma mark-设置下方的数据刷新
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    //获取对应列，对应行的数据
    if (component == 0) {
        _year = _arr1[row];
    } else {
        _term = _arr2[row];
    }
}

- (void)query {
    if ([_year isEqualToString:@""] || [_term isEqualToString:@""] || _year == NULL || _term == NULL) {
        [InstantAlertView showAlert:@"学年或者学期不能为空"];
    }
    NSLog(@"向服务器发送数据：%@学年,%@学期", _year, _term);
    
    // 加载数据
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Mark.plist" ofType:nil]];
    _marks = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [_marks addObject:[Mark markWithDict:dict]];
    }
    [_tableView reloadData];
}

#pragma mark - tableView数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _marks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MarkCell *cell = [tableView dequeueReusableCellWithIdentifier:[MarkCell ID]];
    if (!cell) {
        cell = [MarkCell markCell];
    }
    Mark *marks = _marks[indexPath.row];
    cell.mark = marks;
    return cell;
}

@end

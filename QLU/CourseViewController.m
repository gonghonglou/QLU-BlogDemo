//
//  CourseViewController.m
//  QLU
//
//  Created by 巩洪楼 on 15/9/28.
//  Copyright (c) 2015年 QLU. All rights reserved.
//

#import "CourseViewController.h"
#import "CourseView.h"
#import "GetsavePath.h"
#import "GetOneDay.h"

#define kTopY 66

@interface CourseViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout> {
    NSArray *_array;
    UIView *_aView;
    UIView *_bView;
    UIView *_cView;
    NSDictionary *courseDict;
}

@end

@implementation CourseViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 获取当前时间
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyy"];
    NSString *  yearString = [dateformatter stringFromDate:senddate];
    [dateformatter setDateFormat:@"MM"];
    NSString *  monthString = [dateformatter stringFromDate:senddate];
    [dateformatter setDateFormat:@"dd"];
    NSString *  dayString = [dateformatter stringFromDate:senddate];
    [dateformatter setDateFormat:@"EEE"];
    
    NSString *  weekString = [dateformatter stringFromDate:senddate];
    NSLog(@"-%@",weekString);
    int year = [yearString intValue];
    NSLog(@"-%d", year);
    int month = [monthString intValue];
    NSLog(@"--%d", month);
    int day = [dayString intValue];
    NSLog(@"---%d", day);
    
    // 添加月份
    [self setDateLabel:CGRectMake(0, kTopY, 30, 30) number:[NSString stringWithFormat:@"%d月", month]];
    
    // 判断当前天是周几，从而计算出当周的周一是几号（负数表示上个月月末）
    if ([weekString  isEqual: @"周一"]) {
        day = 0; // 因为下面有 day++;
    } else if ([weekString isEqual:@"周二"]) {
        day = -1;
    } else if ([weekString isEqual:@"周三"]) {
        day = -2;
    } else if ([weekString isEqual:@"周四"]) {
        day = -3;
    } else if ([weekString isEqual:@"周五"]) {
        day = -4;
    } else if ([weekString isEqual:@"周六"]) {
        day = -5;
    } else if ([weekString isEqual:@"周日"]) {
        day = -6;
    }
    // 放置日期
    for (int i = 0; i < 7; i++) {
         [self setDateLabel:CGRectMake(i*((self.view.frame.size.width-33.5)/7+0.5)+30.5, kTopY, (self.view.frame.size.width-33.5)/7, 15) number:[NSString stringWithFormat:@"%d", [GetOneDay getOneDay:day++]]];
    }
    
    // 添加周一到周日label
    for (int i = 0; i < 7; i++) {
        NSArray *week = @[@"周一", @"周二", @"周三", @"周四", @"周五", @"周六", @"周日"];
        [self setLabel:CGRectMake(i*((self.view.frame.size.width-33.5)/7+0.5)+30.5, kTopY+15, (self.view.frame.size.width-33.5)/7, 15) number:week[i]];
    }
    // 添加第一到第八节label
    for (int i = 0; i < 8; i++) {
        NSArray *num1 = @[@"1", @"2", @"3", @"4",  @"5", @"6", @"7", @"8"];
        [self setLabel:CGRectMake(0, i*(((self.view.frame.size.height-165)/5*4+12)/8+0.5)+30.5+kTopY, 30, ((self.view.frame.size.height-165)/5*4+12)/8) number:num1[i]];
    }
    // 添加第九到第十一节label
    for (int i = 0; i < 3; i++) {
        NSArray *num2 = @[@"9", @"10", @"11"];
        [self setLabel:CGRectMake(0,((self.view.frame.size.height-165)/5*4+47)+ i*((self.view.frame.size.height-165)/15+1)+kTopY, 30, (self.view.frame.size.height-165)/15+2) number:num2[i]];
    }
    
    //可以自己写layout 本利用用系统实现好的一个layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 0; // cell左右间隔有一个默认最小值（大概为5）
    layout.minimumLineSpacing = 4; // cell上下的间隔 没有默认最小值
    layout.itemSize = CGSizeMake((self.view.frame.size.width-60)/7, (self.view.frame.size.height-165)/5); // cell 的大小
    // layout.sectionInset = UIEdgeInsetsMake(5, 9, 5, 9);
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(30, kTopY+30, self.view.frame.size.width-30, self.view.frame.size.height - 30) collectionViewLayout:layout];
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier]; // 注册cell ，当然可以自定义一个cell
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
    collectionView.scrollEnabled =NO; //不能滚动
    
    // 弹出课程详情时添加有透明度的遮罩
    _aView = [[UIView alloc] init];
    [_aView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.2f]];
    [self.view addSubview:_aView];
    //  给aView添加点击事件
    UITapGestureRecognizer *tapGesturRecognizer1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeView)];
    [_aView addGestureRecognizer:tapGesturRecognizer1];
    
    // 加载课程数据
    _array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Course.plist" ofType:nil]];
//    _array = [NSArray arrayWithContentsOfFile:[GetsavePath savePath:@"Course.plist"]];
    
}


// 设置周一到周日和第1节到第11节
- (void)setLabel:(CGRect)rect number:(NSString *)number{
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = number;
    label.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:label];
}

// 添加月份
- (void)setDateLabel:(CGRect)rect number:(NSString *)number{
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    label.textColor = [UIColor colorWithRed:100.0/255 green:73.0/255 blue:250.0/255 alpha:1];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = number;
    label.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:label];
}


#pragma mark -- UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 35;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    //  UITableViewCell 设置圆角,注意引用头文件#import <QuartzCore/QuartzCore.h>
    [cell.layer setMasksToBounds:YES];
    cell.layer.cornerRadius=5;
    
    UILabel *label = [[UILabel alloc] initWithFrame:cell.contentView.bounds];
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = [UIColor colorWithRed:100.0/255 green:73.0/255 blue:250.0/255 alpha:1];
    label.numberOfLines = 0;
    [cell.contentView addSubview:label];
    
    courseDict = _array[indexPath.row];
    
    if (courseDict[@"name"]) { // 文件存在
        // 如果有课
        if (![courseDict[@"name"]  isEqual: @""]) {
            label.text = [NSString stringWithFormat:@"%@@%@", courseDict[@"name"], courseDict[@"room"]];
        }
    }

    if (label.text) {
        // 加上背景色
        cell.backgroundColor = [UIColor colorWithRed:160.0/255 green:213.0/255 blue:255.0/255 alpha:1];
    }
    
    return cell;
}


#pragma mark --UICollectionViewDelegate
// UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    courseDict = _array[indexPath.row];
    
    if (courseDict[@"name2"]) {
        
        _cView = [[UIView alloc] initWithFrame:CGRectMake(cell.frame.origin.x+50, cell.frame.origin.y+120, 0, 0)];
        //  给cView添加点击事件
        UITapGestureRecognizer *tapGesturRecognizeraView3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickcView)];
        [_cView addGestureRecognizer:tapGesturRecognizeraView3];
        [_cView setBackgroundColor:[UIColor colorWithRed:255/255 green:255/255 blue:255.0/255 alpha:0.8f]];
        // 设置圆角,注意引用头文件#import <QuartzCore/QuartzCore.h>
        [_cView.layer setMasksToBounds:YES];
        _cView.layer.cornerRadius=5;
        [self.view addSubview:_cView];
        
        [CourseView setCourseDetailsView:_cView coursename:courseDict[@"name2"] courseroom:courseDict[@"room2"] teacher:courseDict[@"teacher2"] number:courseDict[@"number2"] week:courseDict[@"week2"]];
        
        [UIView animateWithDuration:0.4 animations:^{
            _cView.frame = CGRectMake((self.view.frame.size.width-160)/2, (self.view.frame.size.height-300)/2, 220, 200);
        }];
    }
    
    
    _bView = [[UIView alloc] initWithFrame:CGRectMake(cell.frame.origin.x+50, cell.frame.origin.y+120, 0, 0)];
    //  给bView添加点击事件
    UITapGestureRecognizer *tapGesturRecognizerbView2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickbView)];
    [_bView addGestureRecognizer:tapGesturRecognizerbView2];
    [_bView setBackgroundColor:[UIColor colorWithRed:255/255 green:255/255 blue:255.0/255 alpha:0.8f]];
    // 设置圆角,注意引用头文件#import <QuartzCore/QuartzCore.h>
    [_bView.layer setMasksToBounds:YES];
    _bView.layer.cornerRadius=5;
    [self.view addSubview:_bView];
    
    [CourseView setCourseDetailsView:_bView coursename:courseDict[@"name"] courseroom:courseDict[@"room"] teacher:courseDict[@"teacher"] number:courseDict[@"number"] week:courseDict[@"week"]];
    _aView.frame = self.view.bounds;
    
    [UIView animateWithDuration:0.4 animations:^{
        _bView.frame = CGRectMake((self.view.frame.size.width-220)/2, (self.view.frame.size.height-340)/2, 220, 200);
    }];
}


// 返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    courseDict = _array[indexPath.row];
    if ([courseDict[@"name"] isEqualToString:@""]) {
        return NO;
    }
    return YES;
}

// 点击aView调用的方法,关闭课程详情界面
- (void)closeView {
    [UIView animateWithDuration:0.5 animations:^{
        _bView.frame = CGRectMake((self.view.frame.size.width-220)/2, (self.view.frame.size.height-340)/2, 0, 0);
        _cView.frame = CGRectMake((self.view.frame.size.width-160)/2, (self.view.frame.size.height-300)/2, 0, 0);
    } completion:^(BOOL finished) {
        _aView.frame = CGRectMake(-200, -400, 0, 0);
    }];
}

// 点击bView调用的方法
- (void)clickbView {
    if (_cView.frame.size.width != 0) {
        [UIView animateWithDuration:0.5 animations:^{
            [self.view addSubview:_cView];
            _cView.frame = CGRectMake((self.view.frame.size.width-220)/2, (self.view.frame.size.height-340)/2, 220, 200);
            _bView.frame = CGRectMake((self.view.frame.size.width-160)/2, (self.view.frame.size.height-300)/2, 220, 200);
        } completion:^(BOOL finished) {
        }];
    }
}

// 点击cView调用的方法
- (void)clickcView {
    [UIView animateWithDuration:0.5 animations:^{
        [self.view addSubview:_bView];
        _bView.frame = CGRectMake((self.view.frame.size.width-220)/2, (self.view.frame.size.height-340)/2, 220, 200);
        _cView.frame = CGRectMake((self.view.frame.size.width-160)/2, (self.view.frame.size.height-300)/2, 220, 200);
    } completion:^(BOOL finished) {
    }];
}

@end

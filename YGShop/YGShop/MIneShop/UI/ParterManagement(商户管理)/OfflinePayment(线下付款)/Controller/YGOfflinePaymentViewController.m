//
//  YGOfflinePaymentViewController.m
//  YGShop
//
//  Created by 卜立新 on 2018/11/9.
//  Copyright © 2018年 yige. All rights reserved.
//

#import "YGOfflinePaymentViewController.h"

#import "YGOffinePaymentViewCell.h"
#import "YGOffinePaymentModel.h"

#import "YGOfflinePaymentFiltrateHudView.h"
#import "YGOfflinePaymentCalendarView.h"

@interface YGOfflinePaymentViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation YGOfflinePaymentViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = HEXCOLOR(0xF5F5F5);
    // 1.设置导航栏
    [self setNavigationBar];
    
    [self.view addSubview:self.tableView];
    

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    NSInteger s = [self.tableView numberOfSections];  //有多少组
    if (s<1) return;  //无数据时不执行 要不会crash
    NSInteger r = [self.tableView numberOfRowsInSection:s-1]; //最后一组有多少行
    if (r<1) return;
    NSIndexPath *ip = [NSIndexPath indexPathForRow:r-1 inSection:s-1];  //取最后一行数据
    [self.tableView scrollToRowAtIndexPath:ip atScrollPosition:UITableViewScrollPositionBottom animated:true];
}

- (void)setNavigationBar
{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav_fh"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)] style:(UIBarButtonItemStyleDone) target:self action:@selector(clickNavigationItemLeftImage)];
    self.navigationItem.leftBarButtonItems = @[backItem];
    
    // 删选按钮
    UIButton *filtrateBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [filtrateBtn setBackgroundImage:[[UIImage imageNamed:@"nav_gdfl"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)] forState:(UIControlStateNormal)];
    [filtrateBtn addTarget:self action:@selector(clickFiltrateItem) forControlEvents:(UIControlEventTouchUpInside)];
    filtrateBtn.frame = CGRectMake(0, 0, 20, 20);
    
    UIButton *calendarBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [calendarBtn setBackgroundImage:[[UIImage imageNamed:@"nav_rl"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)] forState:(UIControlStateNormal)];
    [calendarBtn addTarget:self action:@selector(clickCalendarItem) forControlEvents:(UIControlEventTouchUpInside)];
    calendarBtn.frame = CGRectMake(0, 0, 20, 20);

    UIBarButtonItem *filtrateItem = [[UIBarButtonItem alloc] initWithCustomView:(UIView *)filtrateBtn];
    UIBarButtonItem *calendarItem = [[UIBarButtonItem alloc] initWithCustomView:(UIView *)calendarBtn];

    self.navigationItem.rightBarButtonItems = @[calendarItem ,filtrateItem];
}

#pragma mark - navigation bar method

/**
 返回
 */
- (void)clickNavigationItemLeftImage
{
    [self.navigationController popViewControllerAnimated:true];
}

/**
 筛选
 */
- (void)clickFiltrateItem
{
    [YGOfflinePaymentFiltrateHudView showInView:self.view];
}

/**
 日历
 */
- (void)clickCalendarItem
{
    [YGOfflinePaymentCalendarView showInView:self.view];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YGOffinePaymentModel *model = self.dataSource[indexPath.row];
    YGOffinePaymentViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kYGOffinePaymentViewCellIdentifier];
    if (!cell) {
        
        cell = [[YGOffinePaymentViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:kYGOffinePaymentViewCellIdentifier];
        
    }
    [cell setPayment:model.payment];
    
    
    return cell;
    
    
}


#pragma mark - tableView
- (UITableView *)tableView
{
    if (!_tableView) {
        
        CGFloat x = kRealValue(13);
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(x, 0, kScreenWidth - 2 * x, self.view.frame.size.height - NavigationBarHeight - kIPhoneX_BOTTOM_HEIGHT - x)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.rowHeight = kRealValue(305);
        [_tableView registerClass:[YGOffinePaymentViewCell class] forCellReuseIdentifier:kYGOffinePaymentViewCellIdentifier];
        
    }
    return _tableView;
}

- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        
        _dataSource = [NSMutableArray array];
        {
            YGOffinePaymentModel *model = [[YGOffinePaymentModel alloc] init];
            model.payment = @"+665.00";
            [_dataSource addObject:model];
        }
        
        {
            YGOffinePaymentModel *model = [[YGOffinePaymentModel alloc] init];
            model.payment = @"+665.00";
            [_dataSource addObject:model];
        }
        
        {
            YGOffinePaymentModel *model = [[YGOffinePaymentModel alloc] init];
            model.payment = @"+665.00";
            [_dataSource addObject:model];
        }
        
        {
            YGOffinePaymentModel *model = [[YGOffinePaymentModel alloc] init];
            model.payment = @"+665.00";
            [_dataSource addObject:model];
        }
        
        {
            YGOffinePaymentModel *model = [[YGOffinePaymentModel alloc] init];
            model.payment = @"+665.00";
            [_dataSource addObject:model];
        }
        
    }
    return _dataSource;
}



@end

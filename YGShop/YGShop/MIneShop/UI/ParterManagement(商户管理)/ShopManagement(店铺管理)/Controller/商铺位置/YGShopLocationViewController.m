//
//  YGShopLocationViewController.m
//  YGShop
//
//  Created by 卜立新 on 2018/11/8.
//  Copyright © 2018年 yige. All rights reserved.
//

#import "YGShopLocationViewController.h"

#import "YGShopManagementCell.h"

#import "YGShopLocationHudView.h"

@interface YGShopLocationViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, strong) UIButton *saveBtn;

@end

@implementation YGShopLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = HEXCOLOR(0xF5F5F5);
    // 1.设置导航栏
    [self setNavigationBar];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.saveBtn];
}

- (void)setNavigationBar
{
    [self setNavgationBarTitle:@"商铺位置" leftImage:@"nav_fh"];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    [self.saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(kRealValue(260));
        make.height.mas_equalTo(kRealValue(40));
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(- 14.0f);
        
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *rowArr = self.dataArray[indexPath.row];
    YGShopManagementCell *cell = [tableView dequeueReusableCellWithIdentifier:kYGShopManagementCellIdentifier];
    if (!cell) {
        cell = [[YGShopManagementCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:kYGShopManagementCellIdentifier];
    }
    [cell setLeftTitle:rowArr[0] rightTitle:rowArr[1] arrowImage:@"tab_rgt"];
    if (indexPath.row == 1) {
        [cell hiddenArrowAndSeparatorLine];
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 地址选择
    if (indexPath.row == 0) {
        
       YGShopLocationHudView *locationHudView = [[YGShopLocationHudView alloc] init];
        [locationHudView show];
        
    }
}

#pragma mark - 懒加载
- (UITableView *)tableView
{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, 11.0f, kScreenWidth, 86)];
        _tableView.scrollEnabled = false;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 43.0f;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[YGShopManagementCell class] forCellReuseIdentifier:kYGShopManagementCellIdentifier];
        
    }
    return _tableView;
}

- (NSArray *)dataArray
{
    if (!_dataArray) {
        
        _dataArray = @[@[@"所在区域", @"选择所在省份、城市、区县"], @[@"详细地址", @"街道、楼牌号等详细地址"]];
        
    }
    return _dataArray;
}

- (UIButton *)saveBtn
{
    if (!_saveBtn) {
        
        _saveBtn = [UIButton buttonWithFontsize:18.0 text:@"保存" textColor:[UIColor whiteColor]];
        _saveBtn.backgroundColor = HEXCOLOR(0xFF6632);
        _saveBtn.layer.cornerRadius = 15.0f;
        _saveBtn.layer.masksToBounds = true;
        
    }
    return _saveBtn;
}


@end

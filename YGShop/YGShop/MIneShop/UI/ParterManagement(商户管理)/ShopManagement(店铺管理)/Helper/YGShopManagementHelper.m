//
//  YGShopManagementHelper.m
//  YGShop
//
//  Created by 卜立新 on 2018/11/6.
//  Copyright © 2018年 yige. All rights reserved.
//

#import "YGShopManagementHelper.h"

#import "YGShopManagementCell.h"
#import "YGShopIntroView.h"

@interface YGShopManagementHelper ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataArray;

/**
 店铺介绍
 */
@property (nonatomic, strong) YGShopIntroView *shopIntroView;

@end

@implementation YGShopManagementHelper

+ (instancetype)helperWithTableView:(UITableView *)tableView
{
    return [[YGShopManagementHelper alloc] initWithTableView:tableView];
}

- (instancetype)initWithTableView:(UITableView *)tableView
{
    if (self = [super init]) {
        
        self.tableView = tableView;
        self.tableView.scrollEnabled = false;
        self.tableView.backgroundColor = [UIColor clearColor];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.rowHeight = 43.0f;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.tableView registerClass:[YGShopManagementCell class] forCellReuseIdentifier:kYGShopManagementCellIdentifier];
        self.tableView.tableFooterView = self.shopIntroView;
        
        // 获取商铺管理主界面数据
        NSString *shopListPath = [[NSBundle mainBundle] pathForResource:@"YGShopManagementList" ofType:@"plist"];
        self.dataArray = [NSArray arrayWithContentsOfFile:shopListPath];
        
    }
    return self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *sectionArray = self.dataArray[section];
    return sectionArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *sectionArray = self.dataArray[indexPath.section];
    NSDictionary *cellDict = sectionArray[indexPath.row];
    YGShopManagementCell *cell = [tableView dequeueReusableCellWithIdentifier:kYGShopManagementCellIdentifier];
    if (!cell) {
        cell = [[YGShopManagementCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:kYGShopManagementCellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setLeftTitle:[cellDict objectForKey:@"leftTitle"] rightTitle:[cellDict objectForKey:@"rightTitle"] arrowImage:@"tab_rgt"];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 9.0f)];
        view.backgroundColor = HEXCOLOR(0xF5F5F5);
        return view;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 9.0f;
    }
    return 0.0f;
}



#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(YGShopManagementHelper:didSelectItemAtIndexPath:)]) {
        [self.delegate YGShopManagementHelper:self didSelectItemAtIndexPath:indexPath];
    }
}

#pragma mark - 懒加载
- (YGShopIntroView *)shopIntroView
{
    if (!_shopIntroView) {
        _shopIntroView = [[YGShopIntroView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 177.0f)];
    }
    return _shopIntroView;
}

@end

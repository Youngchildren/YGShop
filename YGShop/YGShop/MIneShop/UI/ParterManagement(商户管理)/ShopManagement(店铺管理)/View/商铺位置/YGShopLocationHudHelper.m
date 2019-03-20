//
//  YGShopLocationHudHelper.m
//  YGShop
//
//  Created by 卜立新 on 2018/11/8.
//  Copyright © 2018年 yige. All rights reserved.
//

#import "YGShopLocationHudHelper.h"

#import "YGShopLocationHudViewCell.h"

@interface YGShopLocationHudHelper ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSDictionary *dataSource;

/**
 省tableview
 */
@property (nonatomic, weak) UITableView *provinceTableView;
@property (nonatomic, strong) NSArray *provinceArray;

/**
 市tableview
 */
@property (nonatomic, weak) UITableView *cityTableView;
@property (nonatomic, strong) NSArray *cityArray;

/**
 县tableview
 */
@property (nonatomic, weak) UITableView *countyTableView;
@property (nonatomic, strong) NSArray *countyArray;

@end

@implementation YGShopLocationHudHelper

+ (instancetype)helperWithProvinceTableView:(UITableView *)provincetableView
                              cityTableView:(UITableView *)cityTableView
                            countyTableView:(UITableView *)countyTableView
{
    return [[YGShopLocationHudHelper alloc] initWithProvinceTableView:provincetableView cityTableView:cityTableView countyTableView:countyTableView];
}

- (instancetype)initWithProvinceTableView:(UITableView *)provincetableView
                            cityTableView:(UITableView *)cityTableView
                          countyTableView:(UITableView *)countyTableView
{
    if (self = [super init]) {
        
        self.provinceTableView = provincetableView;
        self.provinceTableView.delegate = self;
        self.provinceTableView.dataSource = self;
        [self.provinceTableView registerClass:[YGShopLocationHudViewCell class] forCellReuseIdentifier:kYGShopLocationHudViewCellIdentifier];
        self.provinceTableView.rowHeight = kRealValue(41);
        self.provinceTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
//        self.cityTableView = cityTableView;
//        self.countyTableView = countyTableView;
//        self.cityTableView.delegate = self;
//        self.cityTableView.dataSource = self;
//        self.countyTableView.delegate = self;
//        self.countyTableView.dataSource = self;
//        [self.cityTableView registerClass:[YGShopLocationHudViewCell class] forCellReuseIdentifier:kYGShopLocationHudViewCellIdentifier];
//        [self.countyTableView registerClass:[YGShopLocationHudViewCell class] forCellReuseIdentifier:kYGShopLocationHudViewCellIdentifier];
//
//        self.cityTableView.rowHeight = kRealValue(41);
//        self.countyTableView.rowHeight = kRealValue(41);
//        self.cityTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        self.countyTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        
        self.provinceTableView.backgroundColor = [UIColor redColor];
        // 获取我的商铺主界面数据
        NSString *addressPath = [[NSBundle mainBundle] pathForResource:@"Address" ofType:@"plist"];
        self.dataSource = [NSDictionary dictionaryWithContentsOfFile:addressPath];
        self.provinceArray = [[self.dataSource allKeys] copy];
        
        self.cityArray = [[self.dataSource allKeys] copy];;
        self.countyArray = [[self.dataSource allKeys] copy];;
        
    }
    return self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    if (tableView == self.provinceTableView) { //省
//        for (NSString *text in self.provinceArray) {
//            NSLog(@"text: %@\n", text);
//        }
//
//        return self.provinceArray.count;
//
//    }else if (tableView == self.cityTableView) { //市
//
//        return self.cityArray.count;
//
//    }else{ //县
//
//        return self.countyArray.count;
//
//    }
    
    return self.provinceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YGShopLocationHudViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kYGShopLocationHudViewCellIdentifier];
    if (!cell) {
        cell = [[YGShopLocationHudViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:kYGShopLocationHudViewCellIdentifier];
    }
//    else{
//        for (UIView  *view in cell.contentView.subviews) {
//            [view removeFromSuperview];
//        }
//    }
    
//    if (tableView == self.provinceTableView) { //省
//
//        [cell setLblText:self.provinceArray[indexPath.row]];
//
//    }
//
//    if (tableView == self.cityTableView) { //市
//
//        [cell setLblText:self.provinceArray[indexPath.row]];
//
//    }
//
//    if (tableView == self.countyTableView) { //县
//
//        [cell setLblText:self.provinceArray[indexPath.row]];
//
//    }
    
    [cell setLblText:self.provinceArray[indexPath.row]];
    return cell;
}

#pragma mark - 懒加载
- (NSDictionary *)dataSource
{
    if (!_dataSource) {
        
        _dataSource = [NSDictionary dictionary];
        
    }
    return _dataSource;
}
- (NSArray *)provinceArray
{
    if (!_provinceArray) {
        
        _provinceArray = [NSArray array];
        
    }
    return _provinceArray;
}
- (NSArray *)cityArray
{
    if (!_cityArray) {
        
        _cityArray = [NSArray array];
        
    }
    return _cityArray;
}
- (NSArray *)countyArray
{
    if (!_countyArray) {
        
        _countyArray = [NSArray array];
        
    }
    return _countyArray;
}

@end

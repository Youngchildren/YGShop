//
//  YGOffinePaymentViewCell.m
//  YGShop
//
//  Created by 卜立新 on 2018/11/9.
//  Copyright © 2018年 yige. All rights reserved.
//

#import "YGOffinePaymentViewCell.h"

#import "YGOffinePaymentViewDetailCell.h"

NSString * const kYGOffinePaymentViewCellIdentifier = @"YGOffinePaymentViewCell";

@interface YGOffinePaymentViewCell ()<UITableViewDelegate, UITableViewDataSource>

/**
 灰色背景
 */
@property (nonatomic, strong) UIView *grayView;

/**
 白色背景
 */
@property (nonatomic, strong) UIView *whiteBgView;
/**
 收到付款
 */
@property (nonatomic, strong) UILabel *paymentHintLabel;
/**
 金钱
 */
@property (nonatomic, strong) UILabel *moneyLanel;
/**
 分割虚线
 */
@property (nonatomic, strong) UIView *imaginaryLine;
/**
 详细信息
 */
@property (nonatomic, strong) UITableView *infoTableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation YGOffinePaymentViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSeparatorStyleNone;
        [self.contentView addSubview:self.grayView];
        [self.contentView addSubview:self.whiteBgView];
        [self.whiteBgView addSubview:self.paymentHintLabel];
        [self.whiteBgView addSubview:self.moneyLanel];
        [self.whiteBgView addSubview:self.imaginaryLine];
        [self.whiteBgView addSubview:self.infoTableView];
        
    }
    return self;
}

#pragma mark - 赋值
- (void)setPayment:(NSString *)payment
{
    self.moneyLanel.text = payment;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *dataArr = self.dataSource[indexPath.row];
    YGOffinePaymentViewDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:kYGOffinePaymentViewDetailCellIdentifier];
    if (!cell) {
        
        cell = [[YGOffinePaymentViewDetailCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:kYGOffinePaymentViewDetailCellIdentifier];
        
    }
    [cell setInfoText:dataArr[0] detailText:dataArr[1]];
    return cell;
}

- (void)layoutSubviews
{
    [self.grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
        make.top.equalTo(self.contentView);
        make.height.mas_equalTo(kRealValue(10));
        
    }];
    
    [self.whiteBgView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
        make.top.equalTo(self.grayView.mas_bottom);
//        make.height.mas_equalTo(kRealValue(295));
        make.bottom.equalTo(self.contentView);
    }];
    
    [self.paymentHintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.whiteBgView);
        make.top.equalTo(self.whiteBgView).offset(kRealValue(23));
        make.width.mas_equalTo(kRealValue(56));
        make.height.mas_equalTo(kRealValue(20));
        
    }];
    
    [self.moneyLanel sizeToFit];
    [self.moneyLanel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.whiteBgView);
        make.top.equalTo(self.paymentHintLabel.mas_bottom);
        
    }];
    
    [self.imaginaryLine mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.moneyLanel.mas_bottom).offset(kRealValue(16));
        make.left.equalTo(self.whiteBgView).offset(kRealValue(20));
        make.right.equalTo(self.whiteBgView).offset(- kRealValue(20));
        make.height.mas_equalTo(1);
        
    }];
    
    [self.infoTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.whiteBgView);
        make.right.equalTo(self.whiteBgView);
        make.top.equalTo(self.imaginaryLine.mas_bottom).offset(kRealValue(20));
//        make.height.mas_equalTo(kRealValue(150));
        make.bottom.equalTo(self.whiteBgView).offset(- kRealValue(18));
    }];
}

#pragma mark - 懒加载
- (UIView *)grayView
{
    if (!_grayView) {
        
        _grayView = [[UIView alloc] init];
        _grayView.backgroundColor = HEXCOLOR(0xF5F5F5);
        
    }
    return _grayView;
}
- (UITableView *)infoTableView
{
    if (!_infoTableView) {
        
        _infoTableView = [[UITableView alloc] init];
        _infoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _infoTableView.delegate = self;
        _infoTableView.dataSource = self;
        _infoTableView.rowHeight = kRealValue(30);
        [_infoTableView registerClass:[YGOffinePaymentViewDetailCell class] forCellReuseIdentifier:kYGOffinePaymentViewDetailCellIdentifier];
        
    }
    return _infoTableView;
}

- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        
        _dataSource = [NSMutableArray array];
        
        {
            NSArray *arr = @[@"付款方", @"王菲"];
            [_dataSource addObject:arr];
        }
        
        {
            NSArray *arr = @[@"电话", @"15701543325"];
            [_dataSource addObject:arr];
        }
        
        {
            NSArray *arr = @[@"支付方式", @"微信支付"];
            [_dataSource addObject:arr];
        }
        
        {
            NSArray *arr = @[@"付款时间", @"2018-09-09  10:00"];
            [_dataSource addObject:arr];
        }
        
        {
            NSArray *arr = @[@"订单号", @"11583222225802569632"];
            [_dataSource addObject:arr];
        }
        
    }
    return _dataSource;
}

- (UIView *)imaginaryLine
{
    if (!_imaginaryLine) {
        
        _imaginaryLine = [[UIView alloc] init];
        _imaginaryLine.backgroundColor = HEXCOLOR(0xCCCCCC);
        
    }
    return _imaginaryLine;
}

- (UILabel *)moneyLanel
{
    if (!_moneyLanel) {
        
        _moneyLanel = [UILabel labelWithFontSize:36.0f textColor:HEXCOLOR(0x333333) textAligment:(NSTextAlignmentCenter)];
        
    }
    return _moneyLanel;
}

- (UILabel *)paymentHintLabel
{
    if (!_paymentHintLabel) {
        
        _paymentHintLabel = [UILabel labelWithFontSize:14.0f textColor:HEXCOLOR(0x999999) textAligment:(NSTextAlignmentCenter)];
        _paymentHintLabel.text = @"收到付款";
        
    }
    return _paymentHintLabel;
}

- (UIView *)whiteBgView
{
    if (!_whiteBgView) {
        
        _whiteBgView = [[UIView alloc] init];
        _whiteBgView.backgroundColor = [UIColor whiteColor];
        _whiteBgView.layer.cornerRadius = 4.0f;
        _whiteBgView.layer.masksToBounds = true;
        
    }
    return _whiteBgView;
}



@end

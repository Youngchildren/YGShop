//
//  YGShopLocationHudView.m
//  YGShop
//
//  Created by 卜立新 on 2018/11/8.
//  Copyright © 2018年 yige. All rights reserved.
//

#import "YGShopLocationHudView.h"

#import "YGShopLocationHudHelper.h"

#import "YGShopLocationHudViewCell.h"

@interface YGShopLocationHudView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *maskView;
/**
 白色背景图
 */
@property (nonatomic, strong) UIView *whiteBgView;

/**
 选择地区 所在view
 */
@property (nonatomic, strong) UIView *topView;
/**
 地区选择 所在view
 */
@property (nonatomic, strong) UIView *bottomView;

/**
 选择地区
 */
@property (nonatomic, strong) UILabel *selectRegionLabel;

/**
 省
 */
@property (nonatomic, strong) UILabel *provinceLabel;
/**
 市
 */
@property (nonatomic, strong) UILabel *cityLabel;
/**
 县
 */
@property (nonatomic, strong) UILabel *countyLabel;

/**
 浅色线
 */
@property (nonatomic, strong) UIView *undertintLine;
/**
 红色线
 */
@property (nonatomic, strong) UIView *redLine;

/**
 省 市 县tableview所在滚动视图
 */
@property (nonatomic, strong) UIScrollView *bgScrollView;

/**
 省tableview
 */
@property (nonatomic, strong) UITableView *provinceTableView;

/**
 市tableview
 */
@property (nonatomic, strong) UITableView *cityTableView;

/**
 县tableview
 */
@property (nonatomic, strong) UITableView *countyTableView;


@property (nonatomic, strong) NSDictionary *dataSource;

@property (nonatomic, strong) NSMutableArray *provinceArray;

@property (nonatomic, strong) NSMutableArray *cityArray;

@property (nonatomic, strong) NSMutableArray *countyArray;

@end

@implementation YGShopLocationHudView

- (instancetype)init
{
    if (self = [super init]) {
        
        self.backgroundColor = HEXCOLOR(0x0333333);
        self.alpha = 0.7;
        
        [self addSubview:self.maskView];
        [self addSubview:self.whiteBgView];
        [self.whiteBgView addSubview:self.topView];
        [self.whiteBgView addSubview:self.bottomView];
        [self.whiteBgView addSubview:self.undertintLine];
        
        [self.topView addSubview:self.selectRegionLabel];
        [self.topView addSubview:self.provinceLabel];
        [self.topView addSubview:self.cityLabel];
        [self.topView addSubview:self.countyLabel];
        
        [self.undertintLine addSubview:self.redLine];
        
        [self.bottomView addSubview:self.bgScrollView];
        [self.bgScrollView addSubview:self.provinceTableView];
        [self.bgScrollView addSubview:self.cityTableView];
        [self.bgScrollView addSubview:self.countyTableView];
        
        // 添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        [self.maskView addGestureRecognizer:tap];
        
        // 获取地址界面数据
        NSString *addressPath = [[NSBundle mainBundle] pathForResource:@"Address" ofType:@"plist"];
        self.dataSource = [NSDictionary dictionaryWithContentsOfFile:addressPath];
        self.provinceArray = [[self.dataSource allKeys] copy];
        
    }
    return self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.provinceTableView) { //省

        return self.provinceArray.count;

    }else if (tableView == self.cityTableView) { //市

        return self.cityArray.count;

    }else{ //县

        return self.countyArray.count;

    }
    
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

    if (tableView == self.provinceTableView) { //省

        [cell setLblText:self.provinceArray[indexPath.row]];

    }

    if (tableView == self.cityTableView) { //市

        [cell setLblText:self.cityArray[indexPath.row]];

    }

    if (tableView == self.countyTableView) { //县

        [cell setLblText:self.countyArray[indexPath.row]];

    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.provinceTableView) { // 省
        
        
        [self.cityArray removeAllObjects];
        // 2.更新市数据源
        NSString *province = self.provinceArray[indexPath.row];
        NSArray *cityArr = self.dataSource[province];
        
        // 1.更改topview
        self.provinceLabel.text = province;
        self.cityLabel.hidden = false;
        
        for (NSDictionary *citys in cityArr) {
            
            [self.cityArray addObjectsFromArray:[citys allKeys]];
            
        }
        [self.cityTableView reloadData];
        
        [UIView animateWithDuration:0.3 animations:^{
            
            self.bgScrollView.contentOffset = CGPointMake(kScreenWidth, 0);
            [self.redLine mas_remakeConstraints:^(MASConstraintMaker *make) {
                
                make.centerY.equalTo(self.undertintLine);
                make.centerX.equalTo(self.cityLabel);
                make.height.mas_equalTo(1);
                make.width.mas_equalTo(self.provinceLabel.mas_width);
                
            }];
            
        }];
        
    }
    
    if (tableView == self.cityTableView) { // 市
        
        // 1.滑动
        [UIView animateWithDuration:0.3 animations:^{
            
            self.bgScrollView.contentOffset = CGPointMake(2 * kScreenWidth, 0);
            [self.redLine mas_remakeConstraints:^(MASConstraintMaker *make) {
                
                make.centerY.equalTo(self.undertintLine);
                make.centerX.equalTo(self.countyLabel);
                make.height.mas_equalTo(1);
                make.width.mas_equalTo(self.provinceLabel.mas_width);
                
            }];
            
        }];
        
        
        // 2.更新县数据源
        NSString *city = self.cityArray[indexPath.row];
        NSArray *province = self.dataSource[self.provinceLabel.text];
        for (NSDictionary *citys in province) {
            
            NSArray *keyCitys = [citys allKeys];
            for (NSString *keyCity in keyCitys) {
                
                if ([keyCity isEqualToString:city]) {
                    
                    NSArray *countyArr = citys[keyCity];
                    [self.countyArray addObjectsFromArray:countyArr];
                    
                }
                
            }
            
            [self.countyTableView reloadData];
        }
        
        // 更改topview
        self.cityLabel.text = city;
        self.countyLabel.hidden = false;
        
        
    }
    
    if (tableView == self.countyTableView) { // 县
        
        [self dismiss];
        
    }
}

#pragma mark - private method
/**
 点击省label
 */
- (void)clickProvinceLabel
{
    [UIView animateWithDuration:0.3 animations:^{
        
        self.bgScrollView.contentOffset = CGPointMake(0, 0);
        [self.redLine mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self.undertintLine);
            make.centerX.equalTo(self.provinceLabel);
            make.height.mas_equalTo(1);
            make.width.mas_equalTo(self.provinceLabel.mas_width);
            
        }];
        
    }];
    
}
/**
 点击市label
 */
- (void)clickCityLabel
{
    [UIView animateWithDuration:0.3 animations:^{
       
        self.bgScrollView.contentOffset = CGPointMake(kScreenWidth, 0);
        [self.redLine mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self.undertintLine);
            make.centerX.equalTo(self.cityLabel);
            make.height.mas_equalTo(1);
            make.width.mas_equalTo(self.provinceLabel.mas_width);
            
        }];
        
    }];
    
}
/**
 点击县label
 */
- (void)clickCountyLabel
{
    [UIView animateWithDuration:0.3 animations:^{
       
        self.bgScrollView.contentOffset = CGPointMake(kScreenWidth * 2, 0);
        
    }];
    
}

#pragma mark - public method
- (void)show
{
    self.maskView.hidden = true;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    self.frame = window.bounds;
    self.maskView.opaque = 0;
    self.alpha = 0;
    [window addSubview:self];
    
    CGFloat x = self.whiteBgView.frame.origin.x;
    CGFloat y = self.whiteBgView.frame.origin.y;
    CGFloat w = self.whiteBgView.frame.size.width;
    CGFloat h = self.whiteBgView.frame.size.height;
    self.whiteBgView.frame = CGRectMake(0, kScreenHeight, w, h);
    [UIView animateWithDuration:0.3 animations:^{
        
        self.maskView.opaque = 0.3;
        self.alpha = 1;
        self.whiteBgView.frame = CGRectMake(x, y, w, h);
        
    }];
    
}

- (void)dismiss
{
    CGFloat w = self.whiteBgView.frame.size.width;
    CGFloat h = self.whiteBgView.frame.size.height;
    self.maskView.opaque = 0.3;
    self.alpha = 0.7;
    [UIView animateWithDuration:0.3 animations:^{
        
        self.maskView.opaque = 1;
        self.alpha = 0;
        self.whiteBgView.frame = CGRectMake(0, kScreenHeight, w, h);
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
    }];
    
}

- (void)layoutSubviews
{
    [self.maskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.equalTo(self);
        make.height.mas_equalTo(kRealValue(221));
    }];
    
    [self.whiteBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.mas_equalTo(kRealValue(445));
        
    }];
    
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.equalTo(self.whiteBgView);
        make.height.mas_equalTo(kRealValue(74));
        
    }];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self.whiteBgView);
        //        make.top.equalTo(self.undertintLine.mas_bottom);
        make.height.mas_equalTo(kRealValue(370));
        
    }];
    
    [self.undertintLine mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.equalTo(self.topView.mas_bottom);
        make.height.mas_equalTo(1);

    }];
    
    [self.selectRegionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.topView);
        make.top.equalTo(self.topView).offset(kRealValue(13));
        
    }];
    
    [self.provinceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.topView).offset(kRealValue(13));
        make.bottom.equalTo(self.topView).offset(- kRealValue(6));
        
    }];
    
    [self.cityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(self.provinceLabel);
        make.left.equalTo(self.provinceLabel.mas_right).offset(kRealValue(30));
        
    }];
    
    [self.countyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(self.cityLabel);
        make.left.equalTo(self.cityLabel.mas_right).offset(kRealValue(30));
        
    }];
    
    [self.redLine mas_makeConstraints:^(MASConstraintMaker *make) {

        make.centerY.equalTo(self.undertintLine);
        make.centerX.equalTo(self.provinceLabel);
        make.height.mas_equalTo(1);
        make.width.mas_equalTo(self.provinceLabel.mas_width);

    }];
    
}

#pragma mark - 懒加载
- (UIView *)maskView
{
    if (!_maskView) {
        
        _maskView = [[UIView alloc] init];
        _maskView.backgroundColor = HEXACOLOR(0x000000, 0.7);
        _maskView.opaque = 0.3;
        
    }
    return _maskView;
}
- (UIView *)whiteBgView
{
    if (!_whiteBgView) {
        
        _whiteBgView = [[UIView alloc] init];
        _whiteBgView.userInteractionEnabled = true;
        
    }
    return _whiteBgView;
}
- (UIView *)topView
{
    if (!_topView) {
        
        _topView = [[UIView alloc] init];
        _topView.userInteractionEnabled = true;
        _topView.backgroundColor = [UIColor whiteColor];
        
    }
    return _topView;
}

- (UIView *)bottomView
{
    if (!_bottomView) {
        
        _bottomView = [[UIView alloc] init];
        _bottomView.backgroundColor = [UIColor whiteColor];
        
    }
    return _bottomView;
}

- (UILabel *)selectRegionLabel
{
    if (!_selectRegionLabel) {
        
        _selectRegionLabel = [UILabel labelWithFontSize:16 textColor:HEXCOLOR(0x333333) textAligment:(NSTextAlignmentCenter)];
        _selectRegionLabel.text = @"选择地区";
        [_selectRegionLabel sizeToFit];
        
    }
    return _selectRegionLabel;
}

- (UILabel *)provinceLabel
{
    if (!_provinceLabel) {
        
        _provinceLabel = [UILabel labelWithFontSize:14 textColor:HEXCOLOR(0xFF6632 ) textAligment:(NSTextAlignmentLeft)];
        _provinceLabel.text = @"请选择";
        _provinceLabel.userInteractionEnabled = true;
        [_provinceLabel sizeToFit];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickProvinceLabel)];
        [_provinceLabel addGestureRecognizer:tap];
        
    }
    return _provinceLabel;
}

- (UILabel *)cityLabel
{
    if (!_cityLabel) {
        
        _cityLabel = [UILabel labelWithFontSize:14 textColor:HEXCOLOR(0xFF6632 ) textAligment:(NSTextAlignmentLeft)];
        _cityLabel.userInteractionEnabled = true;
        _cityLabel.hidden = true;
        _cityLabel.text = @"请选择";
        [_cityLabel sizeToFit];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCityLabel)];
        [_cityLabel addGestureRecognizer:tap];
        
    }
    return _cityLabel;
}

- (UILabel *)countyLabel
{
    if (!_countyLabel) {
        
        _countyLabel = [UILabel labelWithFontSize:14 textColor:HEXCOLOR(0xFF6632 ) textAligment:(NSTextAlignmentLeft)];
        _countyLabel.userInteractionEnabled = true;
        _countyLabel.hidden = true;
        _countyLabel.text = @"请选择";
        [_countyLabel sizeToFit];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCountyLabel)];
        [_countyLabel addGestureRecognizer:tap];
        
    }
    return _countyLabel;
}

- (UIView *)undertintLine
{
    if (!_undertintLine) {
        
        _undertintLine = [[UIView alloc] init];
        _undertintLine.backgroundColor = HEXCOLOR(0xE2E2E2);
        
    }
    return _undertintLine;
}

- (UIView *)redLine
{
    if (!_redLine) {
        
        _redLine = [[UIView alloc] init];
        _redLine.backgroundColor = HEXCOLOR(0xFF6632);
        
    }
    return _redLine;
}

- (UIScrollView *)bgScrollView
{
    if (!_bgScrollView) {
        
        _bgScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kRealValue(370))];
        _bgScrollView.contentSize = CGSizeMake(3 * kScreenWidth, 0);
        
    }
    return _bgScrollView;
}

-  (UITableView *)provinceTableView
{
    if (!_provinceTableView) {
        
        _provinceTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kRealValue(370))];
        _provinceTableView.delegate = self;
        _provinceTableView.dataSource = self;
        [_provinceTableView registerClass:[YGShopLocationHudViewCell class] forCellReuseIdentifier:kYGShopLocationHudViewCellIdentifier];
        _provinceTableView.rowHeight = kRealValue(41);
        _provinceTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _provinceTableView;
}

- (UITableView *)cityTableView
{
    if (!_cityTableView) {
        
        _cityTableView = [[UITableView alloc] initWithFrame:CGRectMake(kScreenWidth, 0, kScreenWidth, kRealValue(370))];
        _cityTableView.delegate = self;
        _cityTableView.dataSource = self;
        [_cityTableView registerClass:[YGShopLocationHudViewCell class] forCellReuseIdentifier:kYGShopLocationHudViewCellIdentifier];
        _cityTableView.rowHeight = kRealValue(41);
        _cityTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
//        _cityTableView.backgroundColor = [UIColor redColor];
        
    }
    return _cityTableView;
}

- (UITableView *)countyTableView
{
    if (!_countyTableView) {
        
        _countyTableView = [[UITableView alloc] initWithFrame:CGRectMake(kScreenWidth * 2, 0, kScreenWidth, kRealValue(370))];
        _countyTableView.delegate = self;
        _countyTableView.dataSource = self;
        [_countyTableView registerClass:[YGShopLocationHudViewCell class] forCellReuseIdentifier:kYGShopLocationHudViewCellIdentifier];
        _countyTableView.rowHeight = kRealValue(41);
        _countyTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
//        _countyTableView.backgroundColor = [UIColor orangeColor];
        
    }
    return _countyTableView;
}

- (NSMutableArray *)provinceArray
{
    if (!_provinceArray) {
        
        _provinceArray = [NSMutableArray array];
        
    }
    return _provinceArray;
}
- (NSMutableArray *)cityArray
{
    if (!_cityArray) {
        
        _cityArray = [NSMutableArray array];
        
    }
    return _cityArray;
}
- (NSMutableArray *)countyArray
{
    if (!_countyArray) {
        
        _countyArray = [NSMutableArray array];
        
    }
    return _countyArray;
}

@end

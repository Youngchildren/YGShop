//
//  YGShopDiscountView.m
//  YGShop
//
//  Created by 卜立新 on 2018/11/7.
//  Copyright © 2018年 yige. All rights reserved.
//

#import "YGShopDiscountView.h"

#import "YGDisCountTableViewCell.h"

@interface YGShopDiscountView ()<UITableViewDelegate, UITableViewDataSource>

/**
 白色背景图
 */
@property (nonatomic, strong) UIView *whiteBgView;

@property (nonatomic, strong) UIButton *cancelBtn;

@property (nonatomic, strong) UIButton *sureBtn;

/**
 选择折扣
 */
@property (nonatomic, strong) UILabel *selectDiscount;

/**
 分割线
 */
@property (nonatomic, strong) UIView *separatorLine;

@property (nonatomic, strong) UITableView *disCountTableView;
@property (nonatomic, strong) NSArray *dataArray;

/**
 当前选中的cell
 */
@property (nonatomic, weak) YGDisCountTableViewCell *selectedCell;

@end

@implementation YGShopDiscountView

- (instancetype)init
{
    if (self = [super init]) {
        
        self.backgroundColor = HEXACOLOR(0x000000, 0.7);
        // 添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        [self addGestureRecognizer:tap];
        
        [self addSubview:self.whiteBgView];
        [self.whiteBgView addSubview:self.cancelBtn];
        [self.whiteBgView addSubview:self.sureBtn];
        [self.whiteBgView addSubview:self.selectDiscount];
        [self.whiteBgView addSubview:self.separatorLine];
        [self.whiteBgView addSubview:self.disCountTableView];
        
        // 布局
        [self.whiteBgView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.bottom.equalTo(self);
            make.height.mas_equalTo(kRealValue(235));
            
        }];
        
        [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.whiteBgView).offset(kRealValue(13));
            make.top.equalTo(self.whiteBgView).offset(kRealValue(13));
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(25);
            
        }];
        
        [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.right.equalTo(self.whiteBgView).offset(- kRealValue(13));
            make.top.equalTo(self.whiteBgView).offset(kRealValue(13));
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(25);
            
        }];
        
        [self.selectDiscount mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self.whiteBgView);
            make.top.equalTo(self.whiteBgView).offset(kRealValue(13));
            make.width.mas_equalTo(kRealValue(64));
            make.height.mas_equalTo(kRealValue(22));
            
        }];
        
        [self.separatorLine mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.height.mas_equalTo(1);
            make.top.equalTo(self.whiteBgView).offset(kRealValue(50));
            
        }];
        
        [self.disCountTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.bottom.equalTo(self);
            make.height.mas_equalTo(kRealValue(184));
            
        }];
        
    }
    return self;
}

#pragma mark - public method
- (void)show
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    self.frame = window.bounds;
    self.alpha = 0;
    [window addSubview:self];
    
    CGFloat x = self.whiteBgView.frame.origin.x;
    CGFloat y = self.whiteBgView.frame.origin.y;
    CGFloat w = self.whiteBgView.frame.size.width;
    CGFloat h = self.whiteBgView.frame.size.height;
    self.whiteBgView.frame = CGRectMake(0, kScreenHeight, w, h);
    [UIView animateWithDuration:0.3 animations:^{
       
        self.alpha = 1;
        self.whiteBgView.frame = CGRectMake(x, y, w, h);
        
    }];
}

- (void)dismiss
{
    CGFloat w = self.whiteBgView.frame.size.width;
    CGFloat h = self.whiteBgView.frame.size.height;
    self.alpha = 1;
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.alpha = 0;
        self.whiteBgView.frame = CGRectMake(0, kScreenHeight, w, h);
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
    }];
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YGDisCountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kYGDisCountTableViewCellIdentifier];
    if (!cell) {
        cell = [[YGDisCountTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:kYGDisCountTableViewCellIdentifier];
    }else{
        
//        for (UIView *subView in cell.contentView.subviews)
//        {
//            [subView removeFromSuperview];
//        }
        
    }
    
//    [cell addAllSubViews];
    [cell setCenterLabelText:self.dataArray[indexPath.row]];
    // 默认选中第二行
    if (indexPath.row == 1) {
        
        [cell hightLightCenterLabel];
        self.selectedCell = cell;
        
    }
    else{

        [cell normalCenterLabel];

    }
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"contentOffset : %@\n", NSStringFromCGPoint(self.disCountTableView.contentOffset));
    CGFloat y = self.disCountTableView.contentOffset.y;
    if (y > 0) { // 下滑

        CGFloat row = y / kRealValue(46) + 1;
        if (row != 1) {

            [self.selectedCell normalCenterLabel];
            YGDisCountTableViewCell *cell = [self.disCountTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0]];
            [cell hightLightCenterLabel];
            self.selectedCell = cell;
        }

    }
}


#pragma mark - 懒加载
- (UIView *)whiteBgView
{
    if (!_whiteBgView) {
        
        _whiteBgView = [[UIView alloc] init];
        _whiteBgView.backgroundColor = [UIColor whiteColor];
        
    }
    return _whiteBgView;
}

- (UIButton *)cancelBtn
{
    if (!_cancelBtn) {
        
        _cancelBtn = [UIButton buttonWithFontsize:16 text:@"取消" textColor:[UIColor blackColor]];
        [_cancelBtn addTarget:self action:@selector(dismiss) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return _cancelBtn;
}

- (UIButton *)sureBtn
{
    if (!_sureBtn) {
        
        _sureBtn = [UIButton buttonWithFontsize:16 text:@"确定" textColor:[UIColor blackColor]];
        [_sureBtn addTarget:self action:@selector(dismiss) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return _sureBtn;
}

- (UILabel *)selectDiscount
{
    if (!_selectDiscount) {
        
        _selectDiscount = [UILabel labelWithFontSize:16.0f textColor:HEXCOLOR(0x333333) textAligment:(NSTextAlignmentCenter)];
        _selectDiscount.text = @"选择折扣";
        
    }
    return _selectDiscount;
}

- (UIView *)separatorLine
{
    if (!_separatorLine) {
        
        _separatorLine = [[UIView alloc] init];
        _separatorLine.backgroundColor = HEXCOLOR(0xE2E2E2);
        
    }
    return _separatorLine;
}

- (UITableView *)disCountTableView
{
    if (!_disCountTableView) {
        
        _disCountTableView = [[UITableView alloc] init];
        _disCountTableView.delegate = self;
        _disCountTableView.dataSource = self;
        _disCountTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _disCountTableView.showsVerticalScrollIndicator = false;
        _disCountTableView.rowHeight = kRealValue(46);
        [_disCountTableView registerClass:[YGDisCountTableViewCell class] forCellReuseIdentifier:kYGDisCountTableViewCellIdentifier];
        
    }
    return _disCountTableView;
}

- (NSArray *)dataArray
{
    if (!_dataArray) {
        
        _dataArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",];
        
    }
    return _dataArray;
}

@end

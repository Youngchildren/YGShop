//
//  YGOfflinePaymentFiltrateHudView.m
//  YGShop
//
//  Created by 卜立新 on 2018/11/12.
//  Copyright © 2018年 yige. All rights reserved.
//

#import "YGOfflinePaymentFiltrateHudView.h"

@interface YGOfflinePaymentFiltrateHudView ()<UIGestureRecognizerDelegate>

/**
 mask背景
 */
@property (nonatomic, strong) UIView *maskView;

/**
 白色背景
 */
@property (nonatomic, strong) UIView *whiteBgView;

/**
 按付款方式显示订单
 */
@property (nonatomic, strong) UILabel *hintLabel;

/**
 全部
 */
@property (nonatomic, strong) UIButton *allButton;
/**
 微信
 */
@property (nonatomic, strong) UIButton *weChatButton;
/**
 支付宝
 */
@property (nonatomic, strong) UIButton *aliPayButton;

/**
 横线
 */
@property (nonatomic, strong) UIView *hLine;
/**
 竖线
 */
@property (nonatomic, strong) UIView *vLine;

/**
 重置
 */
@property (nonatomic, strong) UIButton *resetButton;
/**
 确定
 */
@property (nonatomic, strong) UIButton *confirmButton;

@property (nonatomic, weak) UIButton *selBtn;

@end

@implementation YGOfflinePaymentFiltrateHudView

- (instancetype)init
{
    if (self = [super init]) {
        
        [self addSubview:self.maskView];
        [self.maskView addSubview:self.whiteBgView];
        [self.whiteBgView addSubview:self.hintLabel];
        [self.whiteBgView addSubview:self.allButton];
        [self.whiteBgView addSubview:self.weChatButton];
        [self.whiteBgView addSubview:self.aliPayButton];
        [self.whiteBgView addSubview:self.hLine];
        [self.whiteBgView addSubview:self.vLine];
        [self.whiteBgView addSubview:self.resetButton];
        [self.whiteBgView addSubview:self.confirmButton];
        
        self.selBtn = self.allButton;
        
        // 布局
        [self.hintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(self.whiteBgView).offset(kRealValue(13));
            make.top.equalTo(self.whiteBgView).offset(kRealValue(20));
            
        }];
        [self.allButton mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(self.whiteBgView).offset(kRealValue(13));
            make.top.equalTo(self.hintLabel.mas_bottom).offset(kRealValue(20));
            make.width.mas_equalTo(kRealValue(82));
            make.height.mas_equalTo(kRealValue(30));
            
        }];
        [self.weChatButton mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.allButton.mas_right).offset(kRealValue(16));
            make.top.equalTo(self.allButton);
            make.width.mas_equalTo(kRealValue(82));
            make.height.mas_equalTo(kRealValue(30));
            
        }];
        [self.aliPayButton mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.weChatButton.mas_right).offset(kRealValue(16));
            make.top.equalTo(self.weChatButton);
            make.width.mas_equalTo(kRealValue(82));
            make.height.mas_equalTo(kRealValue(30));
            
        }];
        [self.hLine mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.height.mas_equalTo(1);
            make.top.equalTo(self.allButton.mas_bottom).offset(kRealValue(36));
            
        }];
        [self.vLine mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.hLine.mas_bottom);
            make.bottom.equalTo(self.whiteBgView);
            make.width.mas_equalTo(1);
            make.centerX.equalTo(self.whiteBgView);
            
        }];
        [self.resetButton mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.width.mas_equalTo(kRealValue(32));
            make.height.mas_equalTo(kRealValue(22));
            make.left.equalTo(self.whiteBgView).offset(kRealValue(79));
            make.top.equalTo(self.hLine.mas_bottom).offset(kRealValue(15));
            
        }];
        [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.width.mas_equalTo(kRealValue(32));
            make.height.mas_equalTo(kRealValue(22));
            make.right.equalTo(self.whiteBgView).offset(- kRealValue(77));
            make.top.equalTo(self.resetButton);
            
        }];
    }
    return self;
}

#pragma mark - 显示与隐藏
+ (void)showInView:(UIView *)view
{
    
    YGOfflinePaymentFiltrateHudView *hudView = [[YGOfflinePaymentFiltrateHudView alloc] init];
    hudView.maskView.backgroundColor = HEXACOLOR(0x000000, 0);
    hudView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - NavigationBarHeight);
    hudView.maskView.frame = hudView.bounds;
    hudView.whiteBgView.frame = CGRectMake(0, - kRealValue(180), kScreenWidth, kRealValue(180));
    [view addSubview:hudView];
    [UIView animateWithDuration:0.3 animations:^{
       
        hudView.maskView.backgroundColor = HEXACOLOR(0x000000, 0.7);
        hudView.whiteBgView.frame = CGRectMake(0, 0, kScreenWidth, kRealValue(180));
        
    }];
}

- (void)dismiss
{
    [UIView animateWithDuration:0.3 animations:^{
       
        self.maskView.backgroundColor = HEXACOLOR(0x000000, 0);
        self.whiteBgView.frame = CGRectMake(0, - kRealValue(180), kScreenWidth, kRealValue(180));
        
    } completion:^(BOOL finished) {
        
        [self.whiteBgView removeFromSuperview];
        self.whiteBgView = nil;
        [self.maskView removeFromSuperview];
        self.maskView = nil;
        [self removeFromSuperview];
        
    }];
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([touch.view isDescendantOfView:self.whiteBgView]) {
        return NO;
    }
    
    return YES;
}

#pragma mark - private method
- (void)reset
{
    [self selectAction:self.allButton];
    
}

- (void)selectAction:(UIButton *)section
{
    if (self.selBtn.tag == section.tag) {
        return;
    }
    [self.selBtn setTitleColor:HEXCOLOR(0x333333) forState:(UIControlStateNormal)];
    self.selBtn.layer.cornerRadius = 17;
    self.selBtn.layer.masksToBounds = YES;
    self.selBtn.backgroundColor = HEXCOLOR(0xF5F5F5);
    self.selBtn.layer.borderColor = [UIColor clearColor].CGColor;
    self.selBtn.layer.borderWidth = 0.0f;
    
    [section setTitleColor:HEXCOLOR(0xFF6524) forState:(UIControlStateNormal)];
    section.layer.cornerRadius = 17;
    section.layer.masksToBounds = YES;
    section.layer.borderColor = HEXCOLOR(0xFF6524).CGColor;
    section.layer.borderWidth = 1.0f;
    
    self.selBtn = section;
}


#pragma mark - 懒加载
- (UIButton *)confirmButton
{
    if (!_confirmButton) {
        
        _confirmButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_confirmButton setTitle:@"确定" forState:(UIControlStateNormal)];
        [_confirmButton setTitleColor:HEXCOLOR(0x333333) forState:(UIControlStateNormal)];
        _confirmButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
        [_confirmButton addTarget:self action:@selector(dismiss) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return _confirmButton;
}
- (UIButton *)resetButton
{
    if (!_resetButton) {
        
        _resetButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_resetButton setTitle:@"重置" forState:(UIControlStateNormal)];
        [_resetButton setTitleColor:HEXCOLOR(0x333333) forState:(UIControlStateNormal)];
        _resetButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
        [_resetButton addTarget:self action:@selector(reset) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return _resetButton;
}
- (UIView *)vLine
{
    if (!_vLine) {
        
        _vLine = [[UIView alloc] init];
        _vLine.backgroundColor = HEXCOLOR(0xE2E2E2);
        
    }
    return _vLine;
}
- (UIView *)hLine
{
    if (!_hLine) {
        
        _hLine = [[UIView alloc] init];
        _hLine.backgroundColor = HEXCOLOR(0xE2E2E2);
        
    }
    return _hLine;
}
- (UIButton *)aliPayButton
{
    if (!_aliPayButton) {
        
        _aliPayButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_aliPayButton setTitle:@"支付宝" forState:(UIControlStateNormal)];
        _aliPayButton.tag = 102;
        _aliPayButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
        [_aliPayButton setTitleColor:HEXCOLOR(0x333333) forState:(UIControlStateNormal)];
        _aliPayButton.layer.cornerRadius = 17;
        _aliPayButton.layer.masksToBounds = YES;
        _aliPayButton.backgroundColor = HEXCOLOR(0xF5F5F5);
        [_aliPayButton addTarget:self action:@selector(selectAction:) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return _aliPayButton;
}

- (UIButton *)weChatButton
{
    if (!_weChatButton) {
        
        _weChatButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _weChatButton.backgroundColor = HEXCOLOR(0xF5F5F5);
        _weChatButton.tag = 101;
        [_weChatButton setTitle:@"微信" forState:(UIControlStateNormal)];
        [_weChatButton setTitleColor:HEXCOLOR(0x333333) forState:(UIControlStateNormal)];
        _weChatButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
        _weChatButton.layer.cornerRadius = 17;
        _weChatButton.layer.masksToBounds = YES;
        [_weChatButton addTarget:self action:@selector(selectAction:) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return _weChatButton;
}
- (UIButton *)allButton
{
    if (!_allButton) {
        
        _allButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_allButton setTitle:@"全部" forState:(UIControlStateNormal)];
        _allButton.tag = 100;
        _allButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
        [_allButton setTitleColor:HEXCOLOR(0xFF6524) forState:(UIControlStateNormal)];
        _allButton.layer.cornerRadius = 17;
        _allButton.layer.masksToBounds = YES;
        _allButton.layer.borderColor = HEXCOLOR(0xFF6524).CGColor;
        _allButton.layer.borderWidth = 1.0f;
        [_allButton addTarget:self action:@selector(selectAction:) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return _allButton;
}

- (UILabel *)hintLabel
{
    if (!_hintLabel) {
        
        _hintLabel = [UILabel labelWithFontSize:13.0 textColor:HEXCOLOR(0x333333) textAligment:(NSTextAlignmentCenter)];
        _hintLabel.text = @"按付款方式显示订单";
        [_hintLabel sizeToFit];
        
    }
    return _hintLabel;
}

- (UIView *)maskView
{
    if (!_maskView) {
        
        _maskView = [[UIView alloc] init];
        _maskView.backgroundColor = HEXACOLOR(0x000000, 0.7);
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        tap.delegate = self;
        [_maskView addGestureRecognizer:tap];
        
    }
    return _maskView;
}
- (UIView *)whiteBgView
{
    if (!_whiteBgView) {
        
        _whiteBgView = [[UIView alloc] init];
        _whiteBgView.backgroundColor = [UIColor whiteColor];
        
    }
    return _whiteBgView;
}



@end

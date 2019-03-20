//
//  YGMineShopHeaderReusableView.m
//  YGShop
//
//  Created by 卜立新 on 2018/11/6.
//  Copyright © 2018年 yige. All rights reserved.
//

#import "YGMineShopHeaderReusableView.h"

NSString * const kYGMineShopHeaderReusableViewIdentifier = @"YGMineShopHeaderReusableView";

@interface YGMineShopHeaderReusableView ()

@property (nonatomic, strong) UILabel *lbl;

@end

@implementation YGMineShopHeaderReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.lbl];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [self.lbl mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.width.mas_equalTo(kRealValue(72));
        make.height.mas_equalTo(kRealValue(25));
        make.bottom.equalTo(self);
        make.left.equalTo(self).offset(kRealValue(13));
        
    }];
}

#pragma mark - 赋值
- (void)setLabelTitle:(NSString *)title
{
    self.lbl.text = title;
}

#pragma mark - 懒加载
- (UILabel *)lbl
{
    if (!_lbl) {
        
        _lbl = [UILabel labelWithFontSize:kRealValue(18) fontName:@"PingFangSC-Medium" textColor:HEXCOLOR(0x333333) textAligment:(NSTextAlignmentCenter)];
        
    }
    return _lbl;
}

@end

//
//  YGShopPictureHeaderHintVIew.m
//  YGShop
//
//  Created by 卜立新 on 2018/11/7.
//  Copyright © 2018年 yige. All rights reserved.
//

#import "YGShopPictureHeaderHintVIew.h"

@interface YGShopPictureHeaderHintVIew ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation YGShopPictureHeaderHintVIew

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = HEXCOLOR(0xF9F5D3);
        [self addSubview:self.label];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [self.label sizeToFit];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(kRealValue(13));
        
    }];
}

#pragma mark - 懒加载
- (UILabel *)label
{
    if (!_label) {
        
        _label = [UILabel labelWithFontSize:13.0f textColor:HEXCOLOR(0x999999) textAligment:(NSTextAlignmentCenter)];
        _label.text = @"请上传清晰的商铺图片，最多上传10张";
        
    }
    return _label;
}

@end

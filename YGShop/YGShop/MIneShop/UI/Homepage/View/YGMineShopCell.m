//
//  YGMineShopCell.m
//  YGShop
//
//  Created by 卜立新 on 2018/11/5.
//  Copyright © 2018年 yige. All rights reserved.
//

#import "YGMineShopCell.h"

NSString *KYGMineShopCellIdentifier = @"KYGMineShopCellIdentifier";

@interface YGMineShopCell ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *label;

@end

@implementation YGMineShopCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.imageView];
        [self addSubview:self.label];
        
    }
    return self;
}

#pragma mark - 赋值
- (void)setImageWithImageName:(NSString *)imageName title:(NSString *)title
{
    self.imageView.image = [UIImage imageNamed:imageName];
    self.label.text = title;
}

- (void)layoutSubviews
{
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.height.mas_equalTo(kRealValue(24));
        make.centerX.equalTo(self);
        make.top.equalTo(self);
        
    }];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.mas_equalTo(kRealValue(20));
        make.bottom.equalTo(self);
        make.top.equalTo(self.imageView.mas_bottom).offset(kRealValue(4));
        
    }];
}

#pragma mark - 懒加载
- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}
- (UILabel *)label
{
    if (!_label) {
        _label = [UILabel labelWithFontSize:(14) textColor:HEXCOLOR(0x666666) textAligment:(NSTextAlignmentCenter)];
    }
    return _label;
}

@end

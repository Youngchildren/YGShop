//
//  YHShopManagementCell.m
//  YGShop
//
//  Created by 卜立新 on 2018/11/6.
//  Copyright © 2018年 yige. All rights reserved.
//

#import "YGShopManagementCell.h"

NSString * const kYGShopManagementCellIdentifier = @"YGShopManagementCell";

@interface YGShopManagementCell ()

@property (nonatomic, strong) UILabel *leftLabel;

@property (nonatomic, strong) UILabel *rightLabel;

@property (nonatomic, strong) UIImageView *arrowImage;

@property (nonatomic, strong) UIView *line;

@end

@implementation YGShopManagementCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.leftLabel];
        [self.contentView addSubview:self.rightLabel];
        [self.contentView addSubview:self.arrowImage];
        [self.contentView addSubview:self.line];
        
    }
    return self;
}

#pragma mark - 赋值
- (void)setLeftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle arrowImage:(NSString *)imageName
{
    self.leftLabel.text = leftTitle;
    self.rightLabel.text = rightTitle;
    self.arrowImage.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
}

- (void)layoutSubviews
{
    [self.leftLabel sizeToFit];
    [self.rightLabel sizeToFit];
    
    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(kRealValue(13.0f));
        
    }];
    
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView).offset(- kRealValue(43));
        
    }];
    
    [self.arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo((15.0f)); // 10
        make.right.equalTo(self.contentView).offset(- kRealValue(24));
        
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(1.0f);
        make.right.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(kRealValue(13.0f));
        
    }];
}

#pragma mark - public method
- (void)hiddenArrowAndSeparatorLine
{
    self.arrowImage.hidden = true;
    self.line.hidden = true;
}

#pragma mark - 懒加载
- (UILabel *)leftLabel
{
    if (!_leftLabel) {
        _leftLabel = [UILabel labelWithFontSize:13.0f textColor:HEXCOLOR(0x333333) textAligment:(NSTextAlignmentCenter)];
    }
    return _leftLabel;
}
- (UILabel *)rightLabel
{
    if (!_rightLabel) {
        _rightLabel = [UILabel labelWithFontSize:13.0f textColor:HEXCOLOR(0x999999) textAligment:(NSTextAlignmentCenter)];
    }
    return _rightLabel;
}
- (UIImageView *)arrowImage
{
    if (!_arrowImage) {
        _arrowImage = [[UIImageView alloc] init];
    }
    return _arrowImage;
}
- (UIView *)line
{
    if (!_line) {
        _line = [[UIView alloc] init];
        _line.backgroundColor = HEXCOLOR(0xE2E2E2);
    }
    return _line;
}

@end

//
//  YGOffinePaymentViewDetailCell.m
//  YGShop
//
//  Created by 卜立新 on 2018/11/12.
//  Copyright © 2018年 yige. All rights reserved.
//

#import "YGOffinePaymentViewDetailCell.h"

NSString * const kYGOffinePaymentViewDetailCellIdentifier = @"kYGOffinePaymentViewDetailCellIdentifier";

@interface YGOffinePaymentViewDetailCell ()

@property (nonatomic, strong) UILabel *infoLabel;

@property (nonatomic, strong) UILabel *detailLabel;

@end

@implementation YGOffinePaymentViewDetailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSeparatorStyleNone;
        [self.contentView addSubview:self.infoLabel];
        [self.contentView addSubview:self.detailLabel];
        
        // 适配
        [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(self.contentView).offset(kRealValue(19));
            make.centerY.equalTo(self.contentView);
            
        }];
        
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(self.contentView).offset(kRealValue(111));
            make.centerY.equalTo(self.contentView);
            
        }];
        
    }
    return self;
}

#pragma mark - 赋值
- (void)setInfoText:(NSString *)text1 detailText:(NSString *)text2
{
    self.infoLabel.text = text1;
    self.detailLabel.text = text2;
}

#pragma mark - 懒加载
- (UILabel *)infoLabel
{
    if (!_infoLabel) {
        
        _infoLabel = [UILabel labelWithFontSize:14.0f textColor:HEXCOLOR(0x999999) textAligment:(NSTextAlignmentLeft)];
        [_infoLabel sizeToFit];
        
    }
    return _infoLabel;
}

- (UILabel *)detailLabel
{
    if (!_detailLabel) {
        
        _detailLabel = [UILabel labelWithFontSize:14.0f textColor:HEXCOLOR(0x333333) textAligment:(NSTextAlignmentLeft)];
        [_detailLabel sizeToFit];
        
    }
    return _detailLabel;
}

@end

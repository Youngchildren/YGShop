//
//  YGDisCountTableViewCell.m
//  YGShop
//
//  Created by 卜立新 on 2018/11/7.
//  Copyright © 2018年 yige. All rights reserved.
//

#import "YGDisCountTableViewCell.h"

NSString * const kYGDisCountTableViewCellIdentifier = @"YGDisCountTableViewCell";

@interface YGDisCountTableViewCell ()

@property (nonatomic, strong) UILabel *centerLabel;

@end

@implementation YGDisCountTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.centerLabel];
        
    }
    return self;
}

- (void)addAllSubViews
{
    [self.contentView addSubview:self.centerLabel];
}

- (void)layoutSubviews
{
    [self.centerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.center.equalTo(self.contentView);
        
    }];
}

#pragma mark - 高亮label
- (void)hightLightCenterLabel
{
    self.centerLabel.textColor = HEXCOLOR(0xFF6632);
    self.centerLabel.font = [UIFont systemFontOfSize:18];
}

- (void)normalCenterLabel
{
    self.centerLabel.textColor = HEXCOLOR(0x999999);
    self.centerLabel.font = [UIFont systemFontOfSize:14];
}

- (void)setCenterLabelText:(NSString *)text
{
    self.centerLabel.text = text;
}

- (UILabel *)centerLabel
{
    if (!_centerLabel) {
        
        _centerLabel = [UILabel labelWithFontSize:14.0f textColor:HEXCOLOR(0x999999) textAligment:(NSTextAlignmentCenter)];
        
    }
    return _centerLabel;
}


@end

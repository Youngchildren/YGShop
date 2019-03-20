//
//  YGShopLocationHudViewCell.m
//  YGShop
//
//  Created by 卜立新 on 2018/11/8.
//  Copyright © 2018年 yige. All rights reserved.
//

#import "YGShopLocationHudViewCell.h"

NSString * const kYGShopLocationHudViewCellIdentifier = @"YGShopLocationHudViewCell";

@interface YGShopLocationHudViewCell ()

@property (nonatomic, strong) UILabel *lbl;

@end

@implementation YGShopLocationHudViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSeparatorStyleNone;
        [self.contentView addSubview:self.lbl];
        [_lbl sizeToFit];
        [self.lbl mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(self.contentView).offset(kRealValue(20));
            make.centerY.equalTo(self.contentView);
            
        }];
        
    }
    return self;
}

- (void)setLblText:(NSString *)text
{
    self.lbl.text = text;
}

- (UILabel *)lbl
{
    if (!_lbl) {
        
        _lbl = [UILabel labelWithFontSize:14 textColor:HEXCOLOR(0x333333) textAligment:(NSTextAlignmentLeft)];
        
        
    }
    return _lbl;
}

@end

//
//  YGOfflinePaymentCalendarTextCell.m
//  YGShop
//
//  Created by 卜立新 on 2018/11/13.
//  Copyright © 2018年 yige. All rights reserved.
//

#import "YGOfflinePaymentCalendarTextCell.h"

NSString * const kYGOfflinePaymentCalendarTextCellIdentifier = @"YGOfflinePaymentCalendarTextCell";

@interface YGOfflinePaymentCalendarTextCell ()

@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation YGOfflinePaymentCalendarTextCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self.contentView addSubview:self.textLabel];
        [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.center.equalTo(self.contentView);
            
        }];
        
    }
    return self;
}

- (void)setText:(NSString *)text dayType:(YGOfflinePaymentCalendarDayType)type
{
    self.textLabel.text = text;
    switch (type) {
        case YGOfflinePaymentCalendarDayTypeWeek:
        {
            self.textLabel.textColor = HEXACOLOR(0x34485E, 0.54);
            break;
        }
        case YGOfflinePaymentCalendarDayTypePastAndNow:
        {
            self.textLabel.textColor = HEXCOLOR(0x7C86A2);
            break;
        }
        case YGOfflinePaymentCalendarDayTypeFuture:
        {
            self.textLabel.textColor = HEXCOLOR(0xE1E4E7);
            break;
        }
            
        default:
            break;
    }
}

#pragma mark - 懒加载
- (UILabel *)textLabel
{
    if (!_textLabel) {
        
        _textLabel = [UILabel labelWithFontSize:15.65 fontName:@"HelveticaNeue-Medium" textColor:HEXACOLOR(0x34485E, 0.54) textAligment:(NSTextAlignmentCenter)];
        [_textLabel sizeToFit];
    }
    return _textLabel;
}

@end

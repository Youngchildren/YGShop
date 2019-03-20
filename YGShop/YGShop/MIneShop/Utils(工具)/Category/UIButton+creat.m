//
//  UIButton+creat.m
//  ZKXFProject
//
//  Created by 卜立新 on 2018/8/3.
//  Copyright © 2018年 zhongkefurong. All rights reserved.
//

#import "UIButton+creat.h"

@implementation UIButton (creat)

/**
 创建button

 @param fontSize 字体大小
 @param text 文字
 @param textColor 文字颜色
 @return button
 */
+ (UIButton *)buttonWithFontsize:(CGFloat)fontSize
                            text:(NSString *)text
                       textColor:(UIColor *)textColor
{
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn setTitle:text forState:(UIControlStateNormal)];
    [btn setTitleColor:textColor forState:(UIControlStateNormal)];
    btn.titleLabel.font = [UIFont systemFontOfSize:kRealValue(fontSize)];
    return btn;
}

@end

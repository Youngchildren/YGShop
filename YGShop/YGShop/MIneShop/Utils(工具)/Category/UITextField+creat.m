//
//  UITextField+creat.m
//  ZKXFProject
//
//  Created by 卜立新 on 2018/8/3.
//  Copyright © 2018年 zhongkefurong. All rights reserved.
//

#import "UITextField+creat.h"

@implementation UITextField (creat)

/**
 创建textField

 @param fontSize 字体大小
 @param textColor 文字颜色
 @param placeHolder placeHolder
 @return UITextField
 */
+ (UITextField *)textFieldWithFontsize:(CGFloat)fontSize
                             textColor:(UIColor *)textColor
                           placeHolder:(NSString *)placeHolder
{
    UITextField *textField = [[UITextField alloc] init];
    textField.font = [UIFont systemFontOfSize:kRealValue(fontSize)];
    textField.textColor = textColor;
    textField.placeholder = placeHolder;
    return textField;
}

@end

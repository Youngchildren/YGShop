//
//  UITextView+creat.m
//  ZKXFProject
//
//  Created by 卜立新 on 2018/8/7.
//  Copyright © 2018年 zhongkefurong. All rights reserved.
//

#import "UITextView+creat.h"

@implementation UITextView (creat)

/**
 textView创建
 
 @param fontSize 字体大小
 @param textColor 文字颜色
 
 @return UITextView
 */
+ (UITextView *)textViewCreatWithFontsize:(CGFloat)fontSize
                                textColor:(UIColor *)textColor
{
    UITextView *textView = [[UITextView alloc] init];
    textView.font = [UIFont systemFontOfSize:kRealValue(fontSize)];
    textView.textColor = textColor;
    return textView;
}

@end

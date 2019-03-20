//
//  UITextView+creat.h
//  ZKXFProject
//
//  Created by 卜立新 on 2018/8/7.
//  Copyright © 2018年 zhongkefurong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (creat)

/**
 textView创建
 
 @param fontSize 字体大小
 @param textColor 文字颜色
 
 @return UITextView
 */
+ (UITextView *)textViewCreatWithFontsize:(CGFloat)fontSize
                                textColor:(UIColor *)textColor;

@end

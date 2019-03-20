//
//  UIButton+creat.h
//  ZKXFProject
//
//  Created by 卜立新 on 2018/8/3.
//  Copyright © 2018年 zhongkefurong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (creat)

/**
 创建button
 
 @param fontSize 字体大小
 @param text 文字
 @param textColor 文字颜色
 @return button
 */
+ (UIButton *)buttonWithFontsize:(CGFloat)fontSize
                            text:(NSString *)text
                       textColor:(UIColor *)textColor;

@end

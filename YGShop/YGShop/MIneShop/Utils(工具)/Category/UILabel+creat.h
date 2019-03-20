//
//  UILabel+creat.h
//  ZKXFProject
//
//  Created by 卜立新 on 2018/8/2.
//  Copyright © 2018年 zhongkefurong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (creat)

/**
 创建UILabel
 
 @param fontSize 字体大小
 @param textColor 文字颜色
 @param textAlignment 文字对齐方式
 @return UILabel
 */
+ (UILabel *)labelWithFontSize:(CGFloat)fontSize
                     textColor:(UIColor *)textColor
                  textAligment:(NSTextAlignment)textAlignment;

/**
 创建UILabel
 
 @param fontSize 字体大小
 @param fontName 字体
 @param textColor 文字颜色
 @param textAlignment 文字对齐方式
 @return UILabel
 */
+ (UILabel *)labelWithFontSize:(CGFloat)fontSize
                      fontName:(NSString *)fontName
                     textColor:(UIColor *)textColor
                  textAligment:(NSTextAlignment)textAlignment;

@end

//
//  UILabel+creat.m
//  ZKXFProject
//
//  Created by 卜立新 on 2018/8/2.
//  Copyright © 2018年 zhongkefurong. All rights reserved.
//

#import "UILabel+creat.h"

@implementation UILabel (creat)

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
{
   
    return [UILabel labelWithFontSize:fontSize fontName:@"PingFangSC-Regular" textColor:textColor textAligment:textAlignment];
    
}


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
                  textAligment:(NSTextAlignment)textAlignment
{
    UILabel *lbl = [[UILabel alloc] init];
    lbl.font = [UIFont fontWithName:fontName size:fontSize];
    lbl.textColor = textColor;
    lbl.textAlignment = textAlignment;
    return lbl;
}

@end

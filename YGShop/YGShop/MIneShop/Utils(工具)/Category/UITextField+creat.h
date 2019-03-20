//
//  UITextField+creat.h
//  ZKXFProject
//
//  Created by 卜立新 on 2018/8/3.
//  Copyright © 2018年 zhongkefurong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (creat)

/**
 创建textField
 
 @param fontSize 字体大小
 @param textColor 文字颜色
 @param placeHolder placeHolder
 @return UITextField
 */
+ (UITextField *)textFieldWithFontsize:(CGFloat)fontSize
                             textColor:(UIColor *)textColor
                           placeHolder:(NSString *)placeHolder;

@end

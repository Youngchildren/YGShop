//
//  UITextView+Placeholder.h
//  ZKXFProject
//
//  Created by 卜立新 on 2018/8/7.
//  Copyright © 2018年 zhongkefurong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (Placeholder)

/**
 提示语label
 */
@property (nonatomic, readonly) UILabel *placeholdLabel;
/**
 提示语
 */
@property (nonatomic, strong) NSString *placeholder;
/**
 提示语label 文字颜色
 */
@property (nonatomic, strong) UIColor *placeholderColor;
@property (nonatomic, strong) NSAttributedString *attributePlaceholder;
/**
 提示语label 位置
 */
@property (nonatomic, assign) CGPoint location;


@end

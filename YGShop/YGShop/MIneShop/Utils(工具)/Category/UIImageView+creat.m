//
//  UIImageView+creat.m
//  ZKXFProject
//
//  Created by 卜立新 on 2018/8/3.
//  Copyright © 2018年 zhongkefurong. All rights reserved.
//

#import "UIImageView+creat.h"

@implementation UIImageView (creat)

/**
 创建UIImageView
 
 @param imageStr 图片
 @return UIImageView
 */
+ (UIImageView *)imageViewWithImageStr:(NSString *)imageStr
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:imageStr] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)]];
    return imageView;
}

@end

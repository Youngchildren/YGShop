//
//  UIImage+YGCreat.h
//  YGShop
//
//  Created by 卜立新 on 2018/11/5.
//  Copyright © 2018年 yige. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (YGCreat)

/**
 UIColor 转 UIImage

 @param color 颜色
 @return UIImage
 */
+ (UIImage *)creatImageWithColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END

//
//  YGBaseViewController.h
//  YGShop
//
//  Created by 卜立新 on 2018/11/5.
//  Copyright © 2018年 yige. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YGBaseViewController : UIViewController

/**
 设置导航栏标题

 @param title 标题
 */
- (void)setNavgationBarTitle:(NSString *)title;

/**
 设置导航栏标题和左侧图片

 @param title 标题
 @param imageName 左侧图片
 */
- (void)setNavgationBarTitle:(NSString *)title leftImage:(NSString *)imageName;

/**
 设置右侧导航按钮

 @param imageName 图片名字
 */
- (void)setRightNavigationBarWithImageName:(NSString *)imageName selector:(void(^)(void))block;

@end

NS_ASSUME_NONNULL_END

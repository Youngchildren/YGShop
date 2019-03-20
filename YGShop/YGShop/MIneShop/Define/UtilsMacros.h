//
//  UtilsMacros.h
//  YGShop
//
//  Created by 卜立新 on 2018/11/5.
//  Copyright © 2018年 yige. All rights reserved.
//

#ifndef UtilsMacros_h
#define UtilsMacros_h

// 获取系统对象
#define kApplication            [UIApplication sharedApplication]
#define kAppWindow              [UIApplication sharedApplication].delegate.window
#define kUserDefaults           [NSUserDefaults standardUserDefaults]
#define kNotificationCenter     [NSNotificationCenter defaultCenter]

// 系统尺寸
#define kStatusBarHeight        [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight           44.0
#define kTabBarHeight           (([[UIApplication sharedApplication] statusBarFrame].size.height > 20) ? 83 : 49)
#define kTopHeight              (kStatusBarHeight + kNavBarHeight)

#define kIPhoneX_BOTTOM_HEIGHT  ([UIScreen mainScreen].bounds.size.height==812?34:0)
#define TabBarHeight ((UIDevice.deviceType == __IPHONE_X) ? 83 : 49)
#define NavigationBarHeight ((UIDevice.deviceType == __IPHONE_X) ? 88 : 64)
#define StatusBarHeight ((UIDevice.deviceType == __IPHONE_X) ? 44 : 20)

// 获取屏幕宽高
#define kScreenWidth            ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight           ([UIScreen mainScreen].bounds.size.height)

#define Iphone6ScaleWidth       kScreenWidth / 375.0
#define Iphone6ScaleHeight      kScreenHeight / 667.0
// 根据iphone6屏幕来适配拉伸
#define kRealValue(width)       ((width)*(Iphone6ScaleWidth))

// 强弱引用
#define kWeakSelf(type)         __weak typeof(type) weak##type = type;
#define kStrongSelf(type)       __strong typeof(type) type = weak##type;

// 当前系统版本
#define CurrentSystemVersion    [[UIDevice currentDevice].systemVersion doubleValue]

// 打印日志
#ifdef DEBUG
#define ZKLog(fmt, ...) NSLog((@"%s [Line %d]" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define ZKLog(...)
#endif

//数据验证
#define StrValid(f) (f!=nil && [f isKindOfClass:[NSString class]] && ![f isEqualToString:@""])
#define SafeStr(f) (StrValid(f) ? f:@"")
#define HasString(str,key) ([str rangeOfString:key].location!=NSNotFound)

#define ValidStr(f) StrValid(f)
#define ValidDict(f) (f!=nil && [f isKindOfClass:[NSDictionary class]])
#define ValidArray(f) (f!=nil && [f isKindOfClass:[NSArray class]] && [f count]>0)
#define ValidNum(f) (f!=nil && [f isKindOfClass:[NSNumber class]])
#define ValidClass(f,cls) (f!=nil && [f isKindOfClass:[cls class]])
#define ValidData(f) (f!=nil && [f isKindOfClass:[NSData class]])

//发送通知
#define KPostNotification(name,obj) [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj];

// 手机屏幕尺寸相关
#define StatusBarApplicationHeight ([[UIApplication sharedApplication] statusBarFrame].size.height)
#define StatusBarWithNavigationBarTotalHeight (StatusBarApplicationHeight + 44.0)
#define IPhoneXApplicationBottomUnsafeAreaHeight (kScreenHeight == 812.0 ? 34.0 : 0)
#define TabbarToolsApplicationBottomHeight (49.0 + IPhoneXApplicationBottomUnsafeAreaHeight)
#define ThisApplicationToolbarSubviewsControlHeight (49.0)
#define ThisApplicationToolbarBotomHeight (ThisApplicationToolbarSubviewsControlHeight + IPhoneXApplicationBottomUnsafeAreaHeight)

#endif /* UtilsMacros_h */

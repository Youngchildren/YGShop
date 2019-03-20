//
//  UIDevice+Type.h
//  HLTalentServicePlatform
//
//  Created by ios-卜立新 on 2017/10/11.
//  Copyright © 2017年 www.hlyd.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DeviceType) {
    
    __IPHONE_4 = 0,// iphone 4/4s
    __IPHONE_5,// iphone 5/5c/5s/SE
    __IPHONE_NS,// iphone 6/6s/7/8
    __IPHONE_NP,// iphone 6p/6sp/7p/8p
    __IPHONE_X,// iphone X
    __UNKNOWN,
};

@interface UIDevice (Type)

@property (nonatomic, assign, readonly, class) DeviceType deviceType;

@property (nonatomic, assign, readonly, class) CGFloat widthScale;

@property (nonatomic, assign, readonly, class) CGFloat heightScale;

@property (nonatomic, assign, readonly, class) CGFloat fontSize;

+ (BOOL)systemVersionCompare:(CGFloat)version;

@end

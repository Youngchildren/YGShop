//
//  UIDevice+Type.m
//  HLTalentServicePlatform
//
//  Created by ios-卜立新 on 2017/10/11.
//  Copyright © 2017年 www.hlyd.cn. All rights reserved.
//

#import "UIDevice+Type.h"

@implementation UIDevice (Type)

+ (DeviceType)deviceType
{
    NSString *stringSize = NSStringFromCGSize([UIScreen mainScreen].bounds.size);
    
    if ([stringSize isEqualToString:@"{320, 480}"]) {
        return __IPHONE_4;
    } else if ([stringSize isEqualToString:@"{320, 568}"]) {
        return __IPHONE_5;
    } else if ([stringSize isEqualToString:@"{375, 667}"]) {
        return __IPHONE_NS;
    } else if ([stringSize isEqualToString:@"{414, 736}"]) {
        return __IPHONE_NP;
    } else if ([stringSize isEqualToString:@"{375, 812}"]) {
        return __IPHONE_X;
    } else {
        return __UNKNOWN;
    }
}

+ (CGFloat)widthScale
{
    NSString *stringSize = NSStringFromCGSize([UIScreen mainScreen].bounds.size);
    if ([stringSize isEqualToString:@"{375,667}"]) { // iphone 6/6s/7/8
        return 1.0f;
    } else if ([stringSize isEqualToString:@"{414, 736}"]) { // iphone 6p/6sp/7p/8p
        return 414/375.f;
    } else if ([stringSize isEqualToString:@"{375, 812}"]) { // iPhone X
        return 1.f;
    } else {
        return 1.f;
    }
}
+ (CGFloat)heightScale
{
    NSString *stringSize = NSStringFromCGSize([UIScreen mainScreen].bounds.size);
    if ([stringSize isEqualToString:@"{375,667}"]) { // iphone 6/6s/7/8
        return 1.0f;
    } else if ([stringSize isEqualToString:@"{414, 736}"]) { // iphone 6p/6sp/7p/8p
        return 736/667.f;
    } else if ([stringSize isEqualToString:@"{375, 812}"]) { // iPhone X
        return 812/667.f;
    } else {
        return 1.f;
    }
}

+ (BOOL)systemVersionCompare:(CGFloat)version
{
    BOOL compare = YES;
    NSString *phoneVersionStr = [[UIDevice currentDevice] systemVersion];
    CGFloat phoneVersion = [phoneVersionStr floatValue];
    if (phoneVersion > version) {
        compare = NO;
    }
    return compare;
}
@end

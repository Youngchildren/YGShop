//
//  YGOfflinePaymentCalendarMonthModel.h
//  YGShop
//
//  Created by 卜立新 on 2018/11/14.
//  Copyright © 2018年 yige. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YGOfflinePaymentCalendarMonthModel : NSObject

/**
 < 传入的 NSDate 对象，该 NSDate 对象代表当前月的某一日，根据它来获得其他数据
 */
@property (nonatomic, strong) NSDate *monthDate;

/**
 当前月的天数
 */
@property (nonatomic, assign) NSUInteger totalDays;

/**
 标示第一天是星期几（0代表周日，1代表周一，以此类推）
 */
@property (nonatomic, assign) NSInteger firstWeekDay;

/**
 所属年份
 */
@property (nonatomic, assign) NSInteger year;

/**
 当前月份
 */
@property (nonatomic, assign) NSInteger month;

+ (instancetype)modelWithDate:(NSDate *)date;

- (instancetype)initWithDate:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END

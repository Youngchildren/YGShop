//
//  YGOfflinePaymentCalendarDayMondel.h
//  YGShop
//
//  Created by 卜立新 on 2018/11/14.
//  Copyright © 2018年 yige. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YGOfflinePaymentCalendarDayMondel : NSObject

/**
 当前月的天数
 */
@property (nonatomic, assign) NSUInteger totalDays;

/**
  标示第一天是星期几（0代表周日，1代表周一，以此类推）
 */
@property (nonatomic, assign) NSInteger firstWeekday;

/**
 所属年份
 */
@property (nonatomic, assign) NSInteger year;

/**
 当前月份
 */
@property (nonatomic, assign) NSInteger month;

/**
 每天所在的位置
 */
@property (nonatomic, assign) NSInteger day;

/**
 区分过去，现在 和未来的日期
 */
@property (nonatomic, assign) BOOL isFuture;

@end

NS_ASSUME_NONNULL_END

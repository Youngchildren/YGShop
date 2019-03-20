//
//  YGOfflinePaymentCalendarHelper.h
//  YGShop
//
//  Created by 卜立新 on 2018/11/13.
//  Copyright © 2018年 yige. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YGOfflinePaymentCalendarHelper : NSObject

+ (NSInteger)convertDateToMonth:(NSDate *)date;

/**
 根据date获取当月总天数
 
 @param date <#date description#>
 @return <#return value description#>
 */
+ (NSInteger)convertDateToTotalDays:(NSDate *)date;

/**
 获取某个月的1号是星期几
 
 @param date <#date description#>
 @return <#return value description#>
 */
+ (NSInteger)getFirstDayWeekForMonth:(NSDate*)date;

@end

NS_ASSUME_NONNULL_END

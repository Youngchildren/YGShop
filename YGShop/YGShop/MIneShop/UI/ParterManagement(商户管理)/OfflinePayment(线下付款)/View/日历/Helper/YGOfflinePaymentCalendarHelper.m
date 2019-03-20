//
//  YGOfflinePaymentCalendarHelper.m
//  YGShop
//
//  Created by 卜立新 on 2018/11/13.
//  Copyright © 2018年 yige. All rights reserved.
//

#import "YGOfflinePaymentCalendarHelper.h"



@implementation YGOfflinePaymentCalendarHelper


//根据date获取月
+ (NSInteger)convertDateToMonth:(NSDate *)date {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitMonth) fromDate:date];
    return [components month];
}

/**
 根据date获取当月总天数

 @param date <#date description#>
 @return <#return value description#>
 */
+ (NSInteger)convertDateToTotalDays:(NSDate *)date {
    NSRange daysInOfMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return daysInOfMonth.length;
}

/**
 获取某个月的1号是星期几

 @param date <#date description#>
 @return <#return value description#>
 */
+ (NSInteger)getFirstDayWeekForMonth:(NSDate*)date
{
    // NSCalendarIdentifierGregorian : 指定日历的算法
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    // NSDateComponents封装了日期的组件,年月日时分秒等(个人感觉像是平时用的model模型)
    // 调用NSCalendar的components:fromDate:方法返回一个NSDateComponents对象
    // 需要的参数分别components:所需要的日期单位 date:目标月份的date对象
    NSDateComponents *comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond|NSCalendarUnitWeekday fromDate:date];
    NSLog(@"NSDateComponents是这个样子的:%@",comps);
    // 直接调用自己weekDay属性
    NSInteger weekday = [comps weekday];
    weekday--;
    NSLog(@"[comps weekday] = %ld",(long)weekday);
    if (weekday == 7) {
        return 0;
    }else return weekday;
}


@end

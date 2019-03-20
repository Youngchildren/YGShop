//
//  NSDate+LXCalendar.m
//  YGShop
//
//  Created by 卜立新 on 2018/11/13.
//  Copyright © 2018年 yige. All rights reserved.
//

#import "NSDate+LXCalendar.h"

@implementation NSDate (LXCalendar)

/**
 *  获得当前 NSDate 对象对应的日子
 */
- (NSInteger)dateDay
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitDay) fromDate:self];
    return components.day;
}

/**
 *  获得当前 NSDate 对象对应的月份
 */
- (NSInteger)dateMonth
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitMonth) fromDate:self];
    return components.month;
}

/**
 *  获得当前 NSDate 对象对应的年份
 */
- (NSInteger)dateYear
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear) fromDate:self];
    return components.year;
}

/**
 *  获得当前 NSDate 对象的上个月的某一天（此处定为15号）的 NSDate 对象
// */
- (NSDate *)previousMonthDate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];
    components.day = 15;
    if (components.month == 1) {
        
        components.month = 12;
        components.year -= 1;
        
    }else{
        components.month -= 1;
    }
    return [calendar dateFromComponents:components];
}

/**
 *  获得当前 NSDate 对象的下个月的某一天（此处定为15号）的 NSDate 对象
 */
- (NSDate *)nextMonthDate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];
    components.day = 15;
    if (components.month == 12) {
        
        components.month = 1;
        components.year += 1;
        
    }else{
        components.month += 1;
    }
    return [calendar dateFromComponents:components];
}

/**
 *  获得当前 NSDate 对象对应的月份的总天数
 */
- (NSInteger)totalDaysInMonth
{
    return [[NSCalendar currentCalendar] rangeOfUnit:(NSCalendarUnitDay) inUnit:(NSCalendarUnitMonth) forDate:self].length;
}

/**
 *  获得当前 NSDate 对象对应月份当月第一天的所属星期
 */
- (NSInteger)firstWeekDayInMonth
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];
    components.day = 1;
    NSDate *firstDay = [calendar dateFromComponents:components];
    NSInteger firstWeekDay = [calendar ordinalityOfUnit:(NSCalendarUnitWeekday) inUnit:(NSCalendarUnitWeekOfMonth) forDate:firstDay] - 1;
    return firstWeekDay;
}


@end

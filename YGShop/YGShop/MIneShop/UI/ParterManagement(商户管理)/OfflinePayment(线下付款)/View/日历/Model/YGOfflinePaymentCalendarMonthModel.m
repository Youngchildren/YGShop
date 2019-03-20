//
//  YGOfflinePaymentCalendarMonthModel.m
//  YGShop
//
//  Created by 卜立新 on 2018/11/14.
//  Copyright © 2018年 yige. All rights reserved.
//

#import "YGOfflinePaymentCalendarMonthModel.h"

#import "NSDate+LXCalendar.h"

@implementation YGOfflinePaymentCalendarMonthModel

+ (instancetype)modelWithDate:(NSDate *)date
{
    return [[YGOfflinePaymentCalendarMonthModel alloc] initWithDate:date];
}

- (instancetype)initWithDate:(NSDate *)date
{
    if (self = [super init]) {
        
        _monthDate = date;
        _totalDays = [self setupTotalDays];
        _firstWeekDay = [self setupFirstWeekday];
        _year = [self setupYear];
        _month = [self setupMonth];
        
    }
    return self;
}

#pragma mark - private method
- (NSInteger)setupTotalDays {
    return [_monthDate totalDaysInMonth];
}

- (NSInteger)setupFirstWeekday {
    return [_monthDate firstWeekDayInMonth];
}

- (NSInteger)setupYear {
    return [_monthDate dateYear];
}

- (NSInteger)setupMonth {
    return [_monthDate dateMonth];
}



@end

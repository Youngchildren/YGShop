//
//  YGOfflinePaymentCalendarTextCell.h
//  YGShop
//
//  Created by 卜立新 on 2018/11/13.
//  Copyright © 2018年 yige. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString * const kYGOfflinePaymentCalendarTextCellIdentifier;

typedef NS_ENUM(NSUInteger, YGOfflinePaymentCalendarDayType) {
    
    YGOfflinePaymentCalendarDayTypeWeek,
    YGOfflinePaymentCalendarDayTypePastAndNow,
    YGOfflinePaymentCalendarDayTypeFuture
    
};

@interface YGOfflinePaymentCalendarTextCell : UICollectionViewCell

- (void)setText:(NSString *)text dayType:(YGOfflinePaymentCalendarDayType)type;

@end

NS_ASSUME_NONNULL_END

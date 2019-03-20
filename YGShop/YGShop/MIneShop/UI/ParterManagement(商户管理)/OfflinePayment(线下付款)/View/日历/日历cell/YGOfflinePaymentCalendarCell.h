//
//  YGOfflinePaymentCalendarCell.h
//  YGShop
//
//  Created by 卜立新 on 2018/11/13.
//  Copyright © 2018年 yige. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString * const kYGOfflinePaymentCalendarCellIdentifier;

@interface YGOfflinePaymentCalendarCell : UICollectionViewCell

/**
 当前月是周几
 */
@property (nonatomic, assign) NSInteger weekDay;
/**
 当前月有多少天
 */
@property (nonatomic, assign) NSInteger days;

@end

NS_ASSUME_NONNULL_END

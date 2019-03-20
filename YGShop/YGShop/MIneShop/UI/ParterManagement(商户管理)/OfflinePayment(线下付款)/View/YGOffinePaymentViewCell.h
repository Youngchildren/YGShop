//
//  YGOffinePaymentViewCell.h
//  YGShop
//
//  Created by 卜立新 on 2018/11/9.
//  Copyright © 2018年 yige. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString * const kYGOffinePaymentViewCellIdentifier;

@interface YGOffinePaymentViewCell : UITableViewCell

- (void)setPayment:(NSString *)payment;

@end

NS_ASSUME_NONNULL_END

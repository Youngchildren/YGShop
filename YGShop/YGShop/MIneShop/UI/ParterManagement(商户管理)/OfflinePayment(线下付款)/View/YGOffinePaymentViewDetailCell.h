//
//  YGOffinePaymentViewDetailCell.h
//  YGShop
//
//  Created by 卜立新 on 2018/11/12.
//  Copyright © 2018年 yige. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString * const kYGOffinePaymentViewDetailCellIdentifier;

@interface YGOffinePaymentViewDetailCell : UITableViewCell

- (void)setInfoText:(NSString *)text1 detailText:(NSString *)text2;

@end

NS_ASSUME_NONNULL_END

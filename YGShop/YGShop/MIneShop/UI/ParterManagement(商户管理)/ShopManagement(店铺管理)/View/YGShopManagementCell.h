//
//  YHShopManagementCell.h
//  YGShop
//
//  Created by 卜立新 on 2018/11/6.
//  Copyright © 2018年 yige. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString * const kYGShopManagementCellIdentifier;

@interface YGShopManagementCell : UITableViewCell

- (void)setLeftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle arrowImage:(NSString *)imageName;

/**
 隐藏箭头
 */
- (void)hiddenArrowAndSeparatorLine;

@end

NS_ASSUME_NONNULL_END

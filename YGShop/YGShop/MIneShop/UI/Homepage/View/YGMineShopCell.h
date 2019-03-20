//
//  YGMineShopCell.h
//  YGShop
//
//  Created by 卜立新 on 2018/11/5.
//  Copyright © 2018年 yige. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString *KYGMineShopCellIdentifier;

@interface YGMineShopCell : UICollectionViewCell

- (void)setImageWithImageName:(NSString *)imageName title:(NSString *)title;

@end

NS_ASSUME_NONNULL_END

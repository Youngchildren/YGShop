//
//  YGMineShopHeaderReusableView.h
//  YGShop
//
//  Created by 卜立新 on 2018/11/6.
//  Copyright © 2018年 yige. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString * const kYGMineShopHeaderReusableViewIdentifier;

@interface YGMineShopHeaderReusableView : UICollectionReusableView

- (void)setLabelTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END

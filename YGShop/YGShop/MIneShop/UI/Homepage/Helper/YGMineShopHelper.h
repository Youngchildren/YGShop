//
//  YGMineShopHelper.h
//  YGShop
//
//  Created by 卜立新 on 2018/11/5.
//  Copyright © 2018年 yige. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class YGMineShopHelper;
@protocol YGMineShopHelperDelegate <NSObject>

@optional
- (void)YGMineShopHelper:(YGMineShopHelper *)helper didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface YGMineShopHelper : NSObject

@property (nonatomic, weak) id<YGMineShopHelperDelegate> delegate;

+ (instancetype)helperWithCollectionView:(UICollectionView *)collectionView;

@end

NS_ASSUME_NONNULL_END

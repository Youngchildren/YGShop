//
//  YGShopPicturePhotoCell.h
//  YGShop
//
//  Created by 卜立新 on 2018/11/7.
//  Copyright © 2018年 yige. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString * const kYGShopPicturePhotoCellIdentifier;

typedef void(^deleteBlock)();

@interface YGShopPicturePhotoCell : UICollectionViewCell

@property (nonatomic, copy) deleteBlock block;

- (void)setPictureWithImage:(NSString *)imageName;

- (void)deleteBtnHidden;

- (void)deleteBtnDisHidden;

@end

NS_ASSUME_NONNULL_END

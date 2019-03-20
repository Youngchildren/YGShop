//
//  YGShopManagementHelper.h
//  YGShop
//
//  Created by 卜立新 on 2018/11/6.
//  Copyright © 2018年 yige. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class YGShopManagementHelper;

@protocol YGShopManagementHelperDelegate <NSObject>

@optional
- (void)YGShopManagementHelper:(YGShopManagementHelper *)helper didSelectItemAtIndexPath:(NSIndexPath *)indexPath;


@end

@interface YGShopManagementHelper : NSObject

@property (nonatomic, weak) id<YGShopManagementHelperDelegate> delegate;

+ (instancetype)helperWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END

//
//  YGShopLocationHudHelper.h
//  YGShop
//
//  Created by 卜立新 on 2018/11/8.
//  Copyright © 2018年 yige. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YGShopLocationHudHelper : NSObject

+ (instancetype)helperWithProvinceTableView:(UITableView *)provincetableView
                              cityTableView:(UITableView *)cityTableView
                            countyTableView:(UITableView *)countyTableView;

@end

NS_ASSUME_NONNULL_END

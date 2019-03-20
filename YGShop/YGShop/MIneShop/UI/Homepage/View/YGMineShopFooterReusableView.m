//
//  YGMineShopFooterReusableView.m
//  YGShop
//
//  Created by 卜立新 on 2018/11/6.
//  Copyright © 2018年 yige. All rights reserved.
//

#import "YGMineShopFooterReusableView.h"

NSString * const kYGMineShopFooterReusableViewIdentifier = @"YGMineShopFooterReusableView";

@implementation YGMineShopFooterReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        UIView *bgView = [[UIView alloc] initWithFrame:self.bounds];
        bgView.backgroundColor = HEXCOLOR(0xF5F5F5);
        [self addSubview:bgView];
        
    }
    return self;
}



@end

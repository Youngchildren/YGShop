//
//  YGBaseViewController.m
//  YGShop
//
//  Created by 卜立新 on 2018/11/5.
//  Copyright © 2018年 yige. All rights reserved.
//

#import "YGBaseViewController.h"

#import <objc/runtime.h>

static char *rightNavigationBarImageKey = "rightNavigationBarImageKey";

@interface YGBaseViewController ()

@end

@implementation YGBaseViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // 设置坐标点
    self.edgesForExtendedLayout = UIRectEdgeNone;
    // 设置导航栏背景颜色
    [self.navigationController.navigationBar setBackgroundImage:[UIImage creatImageWithColor:[UIColor whiteColor]] forBarMetrics:(UIBarMetricsDefault)];
}

#pragma mark - private method
- (void)clickNavigationItemRightImage
{
    void (^block)(void) = objc_getAssociatedObject(self, rightNavigationBarImageKey);
    if (block) {
        block();
    }
}

- (void)clickNavigationItemLeftImage
{
    [self.navigationController popViewControllerAnimated:true];
}


#pragma mark - public method
- (void)setNavgationBarTitle:(NSString *)title
{
    UILabel *lbl = [UILabel labelWithFontSize:18 textColor:HEXCOLOR(0x333333) textAligment:(NSTextAlignmentCenter)];
    lbl.frame = CGRectMake(0, 0, 72, 25);
    lbl.text = title;
    self.navigationItem.titleView = lbl;
}

- (void)setNavgationBarTitle:(NSString *)title leftImage:(NSString *)imageName
{
    [self setNavgationBarTitle:title];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)] style:(UIBarButtonItemStyleDone) target:self action:@selector(clickNavigationItemLeftImage)];
}

- (void)setRightNavigationBarWithImageName:(NSString *)imageName selector:(nonnull void (^)(void))block
{
    objc_setAssociatedObject(self, rightNavigationBarImageKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)] style:(UIBarButtonItemStyleDone) target:self action:@selector(clickNavigationItemRightImage)];
}

@end

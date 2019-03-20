//
//  YGMineShopViewController.m
//  YGShop
//
//  Created by 卜立新 on 2018/11/5.
//  Copyright © 2018年 yige. All rights reserved.
//

#import "YGMineShopViewController.h"

#import "YGMineShopHelper.h"

#import "YGShopManagementViewController.h"
#import "YGOfflinePaymentViewController.h"

@interface YGMineShopViewController ()<YGMineShopHelperDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) YGMineShopHelper *shopHelper;

@end

@implementation YGMineShopViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.设置导航栏
    [self setNavigationBar];
    
    
 
}

- (void)setNavigationBar
{
    [self setNavgationBarTitle:@"我的商铺"];
    [self setRightNavigationBarWithImageName:@"icon_ewm2" selector:^{
        
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.view addSubview:self.collectionView];
    self.shopHelper = [YGMineShopHelper helperWithCollectionView:self.collectionView];
    self.shopHelper.delegate = self;
}

#pragma mark - YGMineShopHelperDelegate
- (void)YGMineShopHelper:(YGMineShopHelper *)helper didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.hidesBottomBarWhenPushed = true;
    if (indexPath.section == 0 && indexPath.row == 0) { // 商铺管理页面
        
        [self.navigationController pushViewController:[YGShopManagementViewController new] animated:true];
    }
    
    if (indexPath.section == 0 && indexPath.row == 1) {
        
        [self.navigationController pushViewController:[YGOfflinePaymentViewController new] animated:true];
        
    }
    
    self.hidesBottomBarWhenPushed = false;
}

#pragma mark - 懒加载
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView = collectionView;
    }
    return _collectionView;
}


@end

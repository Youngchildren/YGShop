//
//  YGShopPictureViewController.m
//  YGShop
//
//  Created by 卜立新 on 2018/11/7.
//  Copyright © 2018年 yige. All rights reserved.
//

#import "YGShopPictureViewController.h"

#import "YGShopPictureHeaderHintVIew.h"

#import "YGShopPictureHelper.h"

@interface YGShopPictureViewController ()

/**
 保存按钮
 */
@property (nonatomic, strong) UIButton *saveBtn;

/**
 头部提示文字
 */
@property (nonatomic, strong) YGShopPictureHeaderHintVIew *headerHintView;

/**
 上传的商铺图片
 */
@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) YGShopPictureHelper *pictureHelper;

@end

@implementation YGShopPictureViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // 1.设置导航栏
    [self setNavigationBar];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.view addSubview:self.saveBtn];
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.headerHintView];
    
    self.pictureHelper = [YGShopPictureHelper helperWithCollectionView:self.collectionView];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    [self.saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(kRealValue(260));
        make.height.mas_equalTo(kRealValue(40));
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(- 14.0f);
        
    }];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.headerHintView.mas_bottom);
        make.bottom.equalTo(self.saveBtn.mas_top);
        
    }];
}

- (void)setNavigationBar
{
    [self setNavgationBarTitle:@"商铺图片" leftImage:@"nav_fh"];
}

#pragma mark - 懒加载
- (UIButton *)saveBtn
{
    if (!_saveBtn) {
        
        _saveBtn = [UIButton buttonWithFontsize:18.0 text:@"保存" textColor:[UIColor whiteColor]];
        _saveBtn.backgroundColor = HEXCOLOR(0xFF6632);
        _saveBtn.layer.cornerRadius = 20.0f;
        _saveBtn.layer.masksToBounds = true;
        
    }
    return _saveBtn;
}

- (YGShopPictureHeaderHintVIew *)headerHintView
{
    if (!_headerHintView) {
        
        _headerHintView = [[YGShopPictureHeaderHintVIew alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kRealValue(40))];
        
    }
    return _headerHintView;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView = collectionView;
    }
    return _collectionView;
}


@end

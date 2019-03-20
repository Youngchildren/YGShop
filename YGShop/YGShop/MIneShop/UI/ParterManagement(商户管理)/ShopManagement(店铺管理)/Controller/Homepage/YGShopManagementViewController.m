//
//  YGShopManagementViewController.m
//  YGShop
//
//  Created by 卜立新 on 2018/11/6.
//  Copyright © 2018年 yige. All rights reserved.
//

#import "YGShopManagementViewController.h"

#import "YGShopManagementHelper.h"

#import "YGShopPictureViewController.h"
#import "YGShopLocationViewController.h"

#import "YGAlertView.h"

#import "YGShopDiscountView.h"

@interface YGShopManagementViewController ()<YGShopManagementHelperDelegate, YGAlertViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) YGShopManagementHelper *shopManagementHelper;

@property (nonatomic, strong) UIButton *saveBtn;

@end

@implementation YGShopManagementViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = HEXCOLOR(0xF5F5F5);
    // 1.设置导航栏
    [self setNavigationBar];
    
    // 2.
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.saveBtn];
    self.shopManagementHelper = [YGShopManagementHelper helperWithTableView:self.tableView];
    self.shopManagementHelper.delegate = self;
}

- (void)setNavigationBar
{
    [self setNavgationBarTitle:@"商铺管理" leftImage:@"nav_fh"];
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
}

#pragma mark - YGShopManagementHelperDelegate
- (void)YGShopManagementHelper:(YGShopManagementHelper *)helper didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    self.hidesBottomBarWhenPushed = true;
    // 商铺封面图
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        [self alertController];
        
    }
    
    // 商铺图片
    if (indexPath.section == 0 && indexPath.row == 1) {
        
        [self.navigationController pushViewController:[YGShopPictureViewController new] animated:true];
        
    }
    
    // 商铺折扣
    if (indexPath.section == 0 && indexPath.row == 3) {
        
        YGShopDiscountView *discountView = [[YGShopDiscountView alloc] init];
        [discountView show];
        
    }
    
    // 人均消费
    if (indexPath.section == 0 && indexPath.row == 4) {
        
        YGAlertView *alterView  = [[YGAlertView alloc] initWithTextLabel:@"请填写店铺的人均消费（¥）" delegate:self leftButtonTitle:@"取消" rightBttonTitle:@"确定"];
        [alterView show];
        
    }
    
    // 商铺位置
    if (indexPath.section == 1 && indexPath.row == 0) {
        
        [self.navigationController pushViewController:[YGShopLocationViewController new] animated:true];
        
    }
    
}

#pragma mark - 弹框
- (void)alertController
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:(UIAlertControllerStyleActionSheet)];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *photo = [UIAlertAction actionWithTitle:@"拍照" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *photoLibrary = [UIAlertAction actionWithTitle:@"从相册选择" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    alert.view.tintColor = HEXCOLOR(0x333333);
    @try {
        [cancel setValue:HEXCOLOR(0x0470F0) forKey:@"_titleTextColor"];
    } @catch (NSException *exception) {
        
    } @finally {
        
    };

    [alert addAction:cancel];
    [alert addAction:photo];
    [alert addAction:photoLibrary];
    [self presentViewController:alert animated:true completion:nil];
}

#pragma mark - YGAlertViewDelegate
- (void)YG_AlertViewWithRightBtnWithTextLabel:(NSString *)textLabel
{
    
}

#pragma mark - 懒加载
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, 11.0f, kScreenWidth, self.view.bounds.size.height-11.0)];
    }
    return _tableView;
}

- (UIButton *)saveBtn
{
    if (!_saveBtn) {
        
        _saveBtn = [UIButton buttonWithFontsize:18.0 text:@"保存" textColor:[UIColor whiteColor]];
        _saveBtn.backgroundColor = HEXCOLOR(0xFF6632);
        _saveBtn.layer.cornerRadius = 15.0f;
        _saveBtn.layer.masksToBounds = true;
        
    }
    return _saveBtn;
}



@end

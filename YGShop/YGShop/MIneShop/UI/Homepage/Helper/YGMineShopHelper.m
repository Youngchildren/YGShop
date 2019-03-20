//
//  YGMineShopHelper.m
//  YGShop
//
//  Created by 卜立新 on 2018/11/5.
//  Copyright © 2018年 yige. All rights reserved.
//

#import "YGMineShopHelper.h"

#import "YGMineShopCell.h"
#import "YGMineShopHeaderReusableView.h"
#import "YGMineShopFooterReusableView.h"

@interface YGMineShopHelper ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak) UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation YGMineShopHelper

+ (instancetype)helperWithCollectionView:(UICollectionView *)collectionView
{
    return [[YGMineShopHelper alloc] initWithCollectionView:collectionView];
}

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView
{
    if (self = [super init]) {
        
        self.collectionView = collectionView;
        collectionView.backgroundColor = [UIColor whiteColor];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        [collectionView registerClass:[YGMineShopCell class] forCellWithReuseIdentifier:KYGMineShopCellIdentifier];
        [collectionView registerClass:[YGMineShopHeaderReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kYGMineShopHeaderReusableViewIdentifier];
        [collectionView registerClass:[YGMineShopFooterReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:kYGMineShopFooterReusableViewIdentifier];
        
        // 获取我的商铺主界面数据
        NSString *shopListPath = [[NSBundle mainBundle] pathForResource:@"YGMineShopHomepageList" ofType:@"plist"];
        self.dataArray = [NSArray arrayWithContentsOfFile:shopListPath];
        
    }
    return self;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(YGMineShopHelper:didSelectItemAtIndexPath:)]) {
        [self.delegate YGMineShopHelper:self didSelectItemAtIndexPath:indexPath];
    }
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.dataArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSArray *sectionArray = self.dataArray[section];
    return sectionArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSArray *sectionArray = self.dataArray[indexPath.section];
    NSDictionary *cellDict = sectionArray[indexPath.row];
    YGMineShopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KYGMineShopCellIdentifier forIndexPath:indexPath];
    [cell setImageWithImageName:[cellDict objectForKey:@"image"] title:[cellDict objectForKey:@"name"]];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2) {
        return nil;
    }
    
    if (kind == UICollectionElementKindSectionHeader) {
        
        YGMineShopHeaderReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kYGMineShopHeaderReusableViewIdentifier forIndexPath:indexPath];
        if (indexPath.section == 0) {
            [headerView setLabelTitle:@"商户管理"];
        }else if (indexPath.section == 1){
            [headerView setLabelTitle:@"商城管理"];
        }
        return headerView;
        
    }else if (kind == UICollectionElementKindSectionFooter) {
        
        YGMineShopFooterReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:kYGMineShopFooterReusableViewIdentifier forIndexPath:indexPath];
        return footerView;
        
    }else{
        return nil;
    }
    
}

#pragma mark - UICollectionViewDelegateFlowLayout
// 定义每个Cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize itemSize = CGSizeMake(kRealValue(56), kRealValue(48)); // 56 48
    if (indexPath.section == 2 && indexPath.row == 0) {
        itemSize = CGSizeMake(kRealValue(70), kRealValue(48));
    }
    if (indexPath.section == 2 && indexPath.row == 1) {
        itemSize = CGSizeMake(kRealValue(28), kRealValue(48));
    }
    return itemSize;
}
// 定义每个Section的四边间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section == 2) {
        return UIEdgeInsetsMake(kRealValue(19.0f), kRealValue(15.0f), kRealValue(20.0f), kRealValue(23.0f));
    }
    return UIEdgeInsetsMake(kRealValue(19.0f), kRealValue(23.0f), kRealValue(20.0f), kRealValue(23.0f)); // 0 23 0 23
}
// 这个是两行cell之间的间距（上下行cell的间距）
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return kRealValue(18.0f);
}
// 两个cell之间的间距（同一行的cell的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    if (section == 2) {
        return kRealValue(42);
    }
    return kRealValue(35.0f);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 2) {
        return CGSizeZero;
    }
    CGSize headerSize = CGSizeMake(kScreenWidth, kRealValue(40));
    return headerSize;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    if (section == 2) {
        return CGSizeZero;
    }
    CGSize footerSize = CGSizeMake(kScreenWidth, kRealValue(10));
    return footerSize;
}





@end

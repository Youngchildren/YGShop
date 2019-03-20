//
//  YGShopPictureHelper.m
//  YGShop
//
//  Created by 卜立新 on 2018/11/7.
//  Copyright © 2018年 yige. All rights reserved.
//

#import "YGShopPictureHelper.h"

#import "YGShopPicturePhotoCell.h"

@interface YGShopPictureHelper ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation YGShopPictureHelper

+ (instancetype)helperWithCollectionView:(UICollectionView *)collectionView
{
    return [[YGShopPictureHelper alloc] initWithCollectionView:collectionView];
}

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView
{
    if (self = [super init]) {
        
        self.collectionView = collectionView;
        collectionView.backgroundColor = [UIColor whiteColor];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        [collectionView registerClass:[YGShopPicturePhotoCell class] forCellWithReuseIdentifier:kYGShopPicturePhotoCellIdentifier];
        
    }
    return self;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *imageName = self.dataArray[indexPath.row];
    YGShopPicturePhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kYGShopPicturePhotoCellIdentifier forIndexPath:indexPath];
    
//    for (UIView *view in cell.contentView.subviews) {
//        [view removeFromSuperview];
//    }
    
    [cell setPictureWithImage:imageName];
    
    // 删除操作
    cell.block = ^{
      
//        id obj = self.dataArray[indexPath.row];
//        [self.dataArray removeObject:obj];
        [self.dataArray removeObjectAtIndex:indexPath.row];
        [self.collectionView reloadData];
        
    };
    
    // 最后一个item不带删除按钮
    if (indexPath.row == self.dataArray.count - 1) {
        
        [cell deleteBtnHidden];
        
    }
    else{
        
        [cell deleteBtnDisHidden];
        
    }
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
// 定义每个Cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize itemSize = CGSizeMake(kRealValue(110), kRealValue(110)); // 113 113
    return itemSize;
}
// 定义每个Section的四边间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(kRealValue(10.0f), kRealValue(13.0f), kRealValue(31.0f), kRealValue(13.0f));
}
// 这个是两行cell之间的间距（上下行cell的间距）
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return kRealValue(5.0f);
}
// 两个cell之间的间距（同一行的cell的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return kRealValue(5.0f);
}

#pragma mark - 懒加载
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        
        // 测试代码
        NSArray *arr = @[@"icon_xj",@"icon_xj",@"icon_xj",@"icon_xj",@"icon_xj",@"icon_xj",@"icon_xj",@"icon_xj",@"icon_xj",@"icon_xj",@"icon_xj"];
        _dataArray = [NSMutableArray arrayWithArray:arr];
        
//        _dataArray = [NSMutableArray arrayWithObject:@"icon_xj"];
        
        
    }
    return _dataArray;
}


@end

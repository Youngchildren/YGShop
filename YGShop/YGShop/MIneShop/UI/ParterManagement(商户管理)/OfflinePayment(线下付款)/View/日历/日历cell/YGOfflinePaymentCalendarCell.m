//
//  YGOfflinePaymentCalendarCell.m
//  YGShop
//
//  Created by 卜立新 on 2018/11/13.
//  Copyright © 2018年 yige. All rights reserved.
//

#import "YGOfflinePaymentCalendarCell.h"

#import "YGOfflinePaymentCalendarTextCell.h"

NSString * const kYGOfflinePaymentCalendarCellIdentifier = @"YGOfflinePaymentCalendarCell";

@interface YGOfflinePaymentCalendarCell ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation YGOfflinePaymentCalendarCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self.contentView addSubview:self.collectionView];
        // 适配
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.edges.mas_equalTo(UIEdgeInsetsZero);
            
        }];
    }
    return self;
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
//    NSString *text = self.dataSource[indexPath.row];
    YGOfflinePaymentCalendarTextCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kYGOfflinePaymentCalendarTextCellIdentifier forIndexPath:indexPath];
//    [cell setText:text];
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
// 定义每个Cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize itemSize = CGSizeMake(kRealValue(17.4), kRealValue(17.4));
    return itemSize;
}
// 定义每个Section的四边间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(kRealValue(0.0f), kRealValue(23.0f), kRealValue(0.0f), kRealValue(23.0f));
}
// 这个是两行cell之间的间距（上下行cell的间距）
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return kRealValue(16.8f);
}
// 两个cell之间的间距（同一行的cell的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return kRealValue(32.6f);
}

#pragma mark - 懒加载
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:self.contentView.bounds collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[YGOfflinePaymentCalendarTextCell class] forCellWithReuseIdentifier:kYGOfflinePaymentCalendarTextCellIdentifier];
        
    }
    return _collectionView;
}

- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        
        _dataSource = [NSMutableArray arrayWithArray:@[@"S", @"M", @"T", @"W", @"T", @"F", @"S"]];
        
    }
    return _dataSource;
}

@end

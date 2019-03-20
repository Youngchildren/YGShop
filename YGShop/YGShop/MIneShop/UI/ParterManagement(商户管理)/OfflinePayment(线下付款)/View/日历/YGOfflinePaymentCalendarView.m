//
//  YGOfflinePaymentCalendarView.m
//  YGShop
//
//  Created by 卜立新 on 2018/11/12.
//  Copyright © 2018年 yige. All rights reserved.
//

#import "YGOfflinePaymentCalendarView.h"

#import "YGOfflinePaymentCalendarHelper.h"
#import "YGOfflinePaymentCalendarCell.h"
#import "YGOfflinePaymentCalendarTextCell.h"

#import "YGOfflinePaymentCalendarMonthModel.h"
#import "YGOfflinePaymentCalendarDayMondel.h"

#import "NSDate+LXCalendar.h"

@interface YGOfflinePaymentCalendarView ()<UIGestureRecognizerDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

/**
 mask背景
 */
@property (nonatomic, strong) UIView *maskView;

/**
 白色背景
 */
@property (nonatomic, strong) UIView *whiteBgView;

/**
 月份
 */
@property (nonatomic, strong) UILabel *monthLabel;

/**
 左滑箭头
 */
@property (nonatomic, strong) UIButton *leftArrow;
/**
 右滑箭头
 */
@property (nonatomic, strong) UIButton *rightArrow;

/**
 日历总控件
 */
@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *weekdays;

@property (nonatomic, strong) NSMutableArray *dataSource;

/**
 横线
 */
@property (nonatomic, strong) UIView *hLine;
/**
 竖线
 */
@property (nonatomic, strong) UIView *vLine;

/**
 重置
 */
@property (nonatomic, strong) UIButton *resetButton;
/**
 确定
 */
@property (nonatomic, strong) UIButton *confirmButton;

/**
 当前显示的月 日期
 */
@property(nonatomic,strong)NSDate *currentMonthDate;

@end

@implementation YGOfflinePaymentCalendarView

- (instancetype)init
{
    if (self = [super init]) {
        
        [self addSubview:self.maskView];
        [self.maskView addSubview:self.whiteBgView];
        [self.whiteBgView addSubview:self.monthLabel];
        [self.whiteBgView addSubview:self.leftArrow];
        [self.whiteBgView addSubview:self.rightArrow];
        [self.whiteBgView addSubview:self.collectionView];
        [self.whiteBgView addSubview:self.hLine];
        [self.whiteBgView addSubview:self.vLine];
        [self.whiteBgView addSubview:self.resetButton];
        [self.whiteBgView addSubview:self.confirmButton];
        
        // 适配
        [self.monthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.whiteBgView).offset(kRealValue(31.8));
            make.top.equalTo(self.whiteBgView).offset(kRealValue(25.1));
            
        }];
        [self.rightArrow mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.width.height.mas_equalTo(kRealValue(22));// 32.8 26.8
            make.right.equalTo(self.whiteBgView).offset(- kRealValue(32.8));
            make.top.equalTo(self.whiteBgView).offset(kRealValue(26.8));
            
        }];
        [self.leftArrow mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.width.height.mas_equalTo(kRealValue(22));
            make.centerY.equalTo(self.rightArrow);
            make.right.equalTo(self.rightArrow.mas_left).offset(- kRealValue(12));
            
        }];
        
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(self.whiteBgView);
            make.right.equalTo(self.whiteBgView);
            make.bottom.equalTo(self.hLine.mas_top).offset(- kRealValue(21.2));
            make.top.equalTo(self.leftArrow.mas_bottom).offset(kRealValue(24.5));
            
        }];
        
        [self.hLine mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.height.mas_equalTo(1);
            make.bottom.equalTo(self.whiteBgView.mas_bottom).offset(- kRealValue(56));
            
        }];
        [self.vLine mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.hLine.mas_bottom);
            make.bottom.equalTo(self.whiteBgView);
            make.width.mas_equalTo(1);
            make.centerX.equalTo(self.whiteBgView);
            
        }];
        [self.resetButton mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.width.mas_equalTo(kRealValue(32));
            make.height.mas_equalTo(kRealValue(22));
            make.left.equalTo(self.whiteBgView).offset(kRealValue(79));
            make.top.equalTo(self.hLine.mas_bottom).offset(kRealValue(15));
            
        }];
        [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.width.mas_equalTo(kRealValue(32));
            make.height.mas_equalTo(kRealValue(22));
            make.right.equalTo(self.whiteBgView).offset(- kRealValue(77));
            make.top.equalTo(self.resetButton);
            
        }];
        
    }
    return self;
}

#pragma mark - 显示与隐藏
+ (void)showInView:(UIView *)view
{
    
    YGOfflinePaymentCalendarView *hudView = [[YGOfflinePaymentCalendarView alloc] init];
    hudView.maskView.backgroundColor = HEXACOLOR(0x000000, 0);
    hudView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - NavigationBarHeight);
    hudView.maskView.frame = hudView.bounds;
    hudView.whiteBgView.frame = CGRectMake(0, - kRealValue(348.1), kScreenWidth, kRealValue(348.1));
    [view addSubview:hudView];
    [UIView animateWithDuration:0.3 animations:^{
        
        hudView.maskView.backgroundColor = HEXACOLOR(0x000000, 0.7);
        hudView.whiteBgView.frame = CGRectMake(0, 0, kScreenWidth, kRealValue(348.1));
        
    } completion:^(BOOL finished) {
        
//        YGOfflinePaymentCalendarHelper *helper = [YGOfflinePaymentCalendarHelper helperWithCollectionView:hudView.collectionView];
        
//        NSInteger month = [YGOfflinePaymentCalendarHelper convertDateToMonth:[NSDate date]];
//        hudView.monthLabel.text = [NSString stringWithFormat:@"%ld", month];
//        hudView.collectionView.contentOffset = CGPointMake(kScreenWidth * (month - 1), 0);
        [hudView responData];
        
    }];
    
    //
    
}

- (void)dismiss
{
    [UIView animateWithDuration:0.3 animations:^{
        
        self.maskView.backgroundColor = HEXACOLOR(0x000000, 0);
        self.whiteBgView.frame = CGRectMake(0, - kRealValue(348.1), kScreenWidth, kRealValue(348.1));
        
    } completion:^(BOOL finished) {
        
        [self.whiteBgView removeFromSuperview];
        self.whiteBgView = nil;
        [self.maskView removeFromSuperview];
        self.maskView = nil;
        [self removeFromSuperview];
        
    }];
}

#pragma mark - 上一月 下一月
- (void)lastMonth:(UIButton *)sender
{
    [self rightSwipe];
}
- (void)nextMonth:(UIButton *)sender
{
    [self leftSwipe];
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([touch.view isDescendantOfView:self.whiteBgView]) {
        return NO;
    }
    
    return YES;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return (self.dataSource.count + self.weekdays.count);
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    YGOfflinePaymentCalendarTextCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kYGOfflinePaymentCalendarTextCellIdentifier forIndexPath:indexPath];
    
    if (!cell) {
        
        cell = [[YGOfflinePaymentCalendarTextCell alloc] init];
        
    }
    
    if (indexPath.row < self.weekdays.count) {
        
        [cell setText:self.weekdays[indexPath.row] dayType:(YGOfflinePaymentCalendarDayTypeWeek)];
        
    }else{
        
        YGOfflinePaymentCalendarDayMondel *dayModel = self.dataSource[indexPath.row - 7];
        [cell setText:[NSString stringWithFormat:@"%ld", dayModel.day] dayType:(YGOfflinePaymentCalendarDayTypePastAndNow)];
        
        if (dayModel.isFuture) {
            
            [cell setText:[NSString stringWithFormat:@"%ld", dayModel.day] dayType:(YGOfflinePaymentCalendarDayTypeFuture)];
            
        }
    
    }
    return cell;
    
}

#pragma mark - UICollectionViewDelegateFlowLayout
// 定义每个Cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    return self.collectionView.bounds.size;
    CGSize itemSize = CGSizeMake(kRealValue(17.4), kRealValue(17.4));
    return itemSize;
}
// 定义每个Section的四边间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
//    return UIEdgeInsetsMake(kRealValue(0.0f), kRealValue(0.0f), kRealValue(0.0f), kRealValue(0.0f));
    return UIEdgeInsetsMake(kRealValue(0.0f), kRealValue(23.0f), kRealValue(0.0f), kRealValue(23.0f));
}
// 这个是两行cell之间的间距（上下行cell的间距）
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
//    return kRealValue(0.0f);
    return kRealValue(16.8f);
}
// 两个cell之间的间距（同一行的cell的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
//    return kRealValue(0.0f);
    return kRealValue(32.6f);
}

#pragma mark - 滑动手势
-(void)leftSwipe{
    
    self.currentMonthDate = [self.currentMonthDate nextMonthDate];
    [self performAnimations:kCATransitionFromRight];
    [self responData];
    
}
-(void)rightSwipe{
    
    self.currentMonthDate = [self.currentMonthDate previousMonthDate];
    [self performAnimations:kCATransitionFromLeft];
    [self responData];
    
}

/**
 动画处理

 @param transition <#transition description#>
 */
- (void)performAnimations:(NSString *)transition{
    
    CATransition *catransition = [CATransition animation];
    catransition.duration = 0.5;
    [catransition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    catransition.type = kCATransitionPush;
    catransition.subtype = transition;
    [self.collectionView.layer addAnimation:catransition forKey:nil];
    
}

/**
 更新数据
 */
- (void)responData
{
    // 1.删除所有原数据
    [self.dataSource removeAllObjects];
    // 2.1
    NSDate *previousDate = [self.currentMonthDate previousMonthDate];
    YGOfflinePaymentCalendarMonthModel *currentMonthModel = [YGOfflinePaymentCalendarMonthModel modelWithDate:self.currentMonthDate];
    YGOfflinePaymentCalendarMonthModel *previousMonthModel = [YGOfflinePaymentCalendarMonthModel modelWithDate:previousDate];
    // 2.2更新monthLabel
    self.monthLabel.text = [NSString stringWithFormat:@"%ld年%ld月", currentMonthModel.year, currentMonthModel.month];
    
    //
    NSInteger firstWeekday = currentMonthModel.firstWeekDay;
    NSInteger totalDays = currentMonthModel.totalDays;
    for (NSInteger i = 0; i < 35; i++) { // 35表示当前显示天数
        
        YGOfflinePaymentCalendarDayMondel *dayModel = [[YGOfflinePaymentCalendarDayMondel alloc] init];
        dayModel.firstWeekday = firstWeekday;
        dayModel.totalDays = totalDays;
        dayModel.month = currentMonthModel.month;
        dayModel.year = currentMonthModel.year;
        
        if (i < firstWeekday) { // 上一个月的内容
            
            dayModel.day = previousMonthModel.totalDays - (firstWeekday - i) + 1;
            
            if (dayModel.month == 1) {
                dayModel.month = 12;
                dayModel.year -= 1;
            }else{
                dayModel.month -= 1;
            }
            
        }
        
        
        if (i >= firstWeekday && i < (firstWeekday + totalDays)) { //当月的日期
            
            dayModel.day = i - firstWeekday + 1;
            
        }
        
        if (i >= (firstWeekday + totalDays)) { // 下月的日期
            
            dayModel.day = i - firstWeekday - totalDays + 1;
            
            if (dayModel.month == 12) {
                
                dayModel.year += 1;
                dayModel.month = 1;
                
            }else{
                dayModel.month += 1;
            }
            
        }
        
        // 区分未来 现在 过去 日期
        dayModel.isFuture = false;
        NSDate *currentDate = [NSDate date];
        if ([currentDate dateYear] == dayModel.year && (([currentDate dateMonth] < dayModel.month) || ([currentDate dateMonth] == dayModel.month && [currentDate dateDay] < dayModel.day))) {
            
            dayModel.isFuture = true;
            
        }
        if ([currentDate dateYear] < dayModel.year) {
            
            dayModel.isFuture = true;
            
        }
        
        [self.dataSource addObject:dayModel];
    }
    
    [self.collectionView reloadData];
    
}


#pragma mark - 懒加载
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
//        _collectionView.pagingEnabled = true;
        [_collectionView registerClass:[YGOfflinePaymentCalendarTextCell class] forCellWithReuseIdentifier:kYGOfflinePaymentCalendarTextCellIdentifier];
        
        //添加左滑右滑手势
        UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(leftSwipe)];
        leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
        UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(rightSwipe)];
        rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
        [_collectionView addGestureRecognizer:leftSwipe];
        [_collectionView addGestureRecognizer:rightSwipe];
        
    }
    return _collectionView;
}

- (NSArray *)weekdays
{
    if (!_weekdays) {
        
        _weekdays = @[@"S", @"M", @"T", @"W", @"T", @"F", @"S"];
        
    }
    return _weekdays;
}

- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        
        _dataSource = [NSMutableArray array];
        
    }
    return _dataSource;
}

- (NSDate *)currentMonthDate
{
    if (!_currentMonthDate) {
        
        _currentMonthDate = [NSDate date];
        
    }
    return _currentMonthDate;
}

- (UIView *)maskView
{
    if (!_maskView) {
        
        _maskView = [[UIView alloc] init];
        _maskView.backgroundColor = HEXACOLOR(0x000000, 0.7);
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        tap.delegate = self;
        [_maskView addGestureRecognizer:tap];
        
    }
    return _maskView;
}
- (UIView *)whiteBgView
{
    if (!_whiteBgView) {
        
        _whiteBgView = [[UIView alloc] init];
        _whiteBgView.backgroundColor = [UIColor whiteColor];
        
    }
    return _whiteBgView;
}

- (UIButton *)confirmButton
{
    if (!_confirmButton) {
        
        _confirmButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_confirmButton setTitle:@"确定" forState:(UIControlStateNormal)];
        [_confirmButton setTitleColor:HEXCOLOR(0x333333) forState:(UIControlStateNormal)];
        _confirmButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
        [_confirmButton addTarget:self action:@selector(dismiss) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return _confirmButton;
}
- (UIButton *)resetButton
{
    if (!_resetButton) {
        
        _resetButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_resetButton setTitle:@"重置" forState:(UIControlStateNormal)];
        [_resetButton setTitleColor:HEXCOLOR(0x333333) forState:(UIControlStateNormal)];
        _resetButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
        [_resetButton addTarget:self action:@selector(reset) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return _resetButton;
}
- (UIView *)vLine
{
    if (!_vLine) {
        
        _vLine = [[UIView alloc] init];
        _vLine.backgroundColor = HEXCOLOR(0xE2E2E2);
        
    }
    return _vLine;
}
- (UIView *)hLine
{
    if (!_hLine) {
        
        _hLine = [[UIView alloc] init];
        _hLine.backgroundColor = HEXCOLOR(0xE2E2E2);
        
    }
    return _hLine;
}

- (UILabel *)monthLabel
{
    if (!_monthLabel) {
        
        _monthLabel = [UILabel labelWithFontSize:16.0f textColor:HEXCOLOR(0x333333) textAligment:(NSTextAlignmentCenter)];
        [_monthLabel sizeToFit];
        
    }
    return _monthLabel;
}
- (UIButton *)leftArrow
{
    if (!_leftArrow) {
        
        _leftArrow = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_leftArrow setBackgroundImage:[UIImage imageNamed:@"icon_rlz"] forState:(UIControlStateNormal)];
        [_leftArrow addTarget:self action:@selector(lastMonth:) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return _leftArrow;
}
- (UIButton *)rightArrow
{
    if (!_rightArrow) {
        
        _rightArrow = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_rightArrow setBackgroundImage:[UIImage imageNamed:@"icon_rly"] forState:(UIControlStateNormal)];
        [_rightArrow addTarget:self action:@selector(nextMonth:) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return _rightArrow;
}

@end

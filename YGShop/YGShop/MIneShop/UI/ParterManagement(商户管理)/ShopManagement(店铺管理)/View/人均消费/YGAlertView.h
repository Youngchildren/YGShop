//
//  YGAlertView.h
//  YiGe_iOS
//
//  Created by God on 2018/10/9.
//  Copyright © 2018年 com.yige.www. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YGAlertViewDelegate <NSObject>

-(void)YG_AlertViewWithRightBtnWithTextLabel:(NSString *)textLabel;

@end

@interface YGAlertView : UIView

@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, strong) UIButton *leftBtn;

@property (nonatomic, strong) UIButton *rightBtn;

@property (nonatomic, strong) UIImageView *backgroudImageView;

@property (nonatomic, weak) id<YGAlertViewDelegate> delegate;


-(instancetype)initWithFrame:(CGRect)frame;

-(instancetype)initWithTextLabel:(NSString *)textLabel delegate:(id)delegate leftButtonTitle:(NSString *)leftButtonTitle rightBttonTitle:(NSString *)rightBttonTitle;

-(void)show;

@end

NS_ASSUME_NONNULL_END

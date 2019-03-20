//
//  YGAlertView.m
//  YiGe_iOS
//
//  Created by God on 2018/10/9.
//  Copyright © 2018年 com.yige.www. All rights reserved.
//

#import "YGAlertView.h"
#import "Masonry.h"

@implementation YGAlertView

-(void)leftBtnClick {
    
    [self removeFromSuperview];

}

-(void)rightBtnClick {
    [self removeFromSuperview];
    if ([self.delegate respondsToSelector:@selector(YG_AlertViewWithRightBtnWithTextLabel:)]) {
        [self.delegate YG_AlertViewWithRightBtnWithTextLabel:self.textField.text];
    }

}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if ([super initWithFrame:[UIApplication sharedApplication].keyWindow.frame]) {
        
        [self setUp];
        
    }
    
    return self;
}

-(instancetype)initWithTextLabel:(NSString *)textLabel delegate:(id)delegate leftButtonTitle:(NSString *)leftButtonTitle rightBttonTitle:(NSString *)rightBttonTitle {
    
    if ([super initWithFrame:[UIApplication sharedApplication].keyWindow.frame]) {
        
        [self setUp];
        self.textField.placeholder = textLabel;
        [self.leftBtn setTitle:leftButtonTitle forState:UIControlStateNormal];
        [self.rightBtn setTitle:rightBttonTitle forState:UIControlStateNormal];
        self.delegate = delegate;
    }
    
    return self;
    
}

-(void) setUp {
    
    self.backgroundColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:0.5];
    
    [self addSubview:self.backgroudImageView];
    [self addSubview:self.textField];
    [self addSubview:self.leftBtn];
    [self addSubview:self.rightBtn];
    
    [self.backgroudImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.centerY.equalTo(self);
        make.height.equalTo(@164);
        make.width.equalTo(@328);
    }];

    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.left.equalTo(@73);
        make.right.equalTo(@-73);
        make.top.equalTo(self.backgroudImageView.mas_top).mas_offset(@42);
        make.height.equalTo(@44);
    }];
    
    [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.backgroudImageView.mas_left);
        make.right.equalTo(self.rightBtn.mas_left);
        make.bottom.equalTo(self.backgroudImageView.mas_bottom);
        make.height.equalTo(@49);
        make.width.equalTo(self.rightBtn.mas_width);
        
    }];
    
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.leftBtn.mas_right);
        make.right.equalTo(self.backgroudImageView.mas_right);
        make.bottom.equalTo(self.backgroudImageView.mas_bottom);
        make.height.equalTo(@49);
        make.width.equalTo(self.leftBtn.mas_width);
        
    
    }];
    
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.backgroudImageView addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textField.mas_bottom);
        make.left.equalTo(self.textField.mas_left).mas_offset(20);
        make.right.equalTo(self.textField.mas_right).mas_offset(-20);
        make.height.equalTo(@1);
    }];
    
    
}

-(void) show {
    
    UIWindow *keywidow = [UIApplication sharedApplication].keyWindow;
    [keywidow addSubview:self];
    
}



-(UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc]init];
        _textField.textAlignment = NSTextAlignmentCenter;
    }
    
    return _textField;
}

-(UIButton *)leftBtn {
    if (!_leftBtn) {
        
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_leftBtn setBackgroundImage:[UIImage imageNamed:@"btn_bj"] forState:UIControlStateNormal];
    }
    
    return _leftBtn;
}

-(UIButton *)rightBtn {
    if (!_rightBtn) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightBtn  addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_rightBtn setBackgroundImage:[UIImage imageNamed:@"btn_qd"] forState:UIControlStateNormal];
    }
    
    return _rightBtn;
}

-(UIImageView *)backgroudImageView {
    
    if (!_backgroudImageView) {
        _backgroudImageView = [[UIImageView alloc]init];
        _backgroudImageView.backgroundColor  = [UIColor whiteColor];
        _backgroudImageView.layer.masksToBounds = YES;
        _backgroudImageView.layer.cornerRadius = 9.0f;
        
    }
    return _backgroudImageView;
}


@end

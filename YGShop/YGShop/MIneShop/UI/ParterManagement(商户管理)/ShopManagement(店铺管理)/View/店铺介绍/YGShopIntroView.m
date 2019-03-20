//
//  YGShopIntroView.m
//  YGShop
//
//  Created by 卜立新 on 2018/11/6.
//  Copyright © 2018年 yige. All rights reserved.
//

#import "YGShopIntroView.h"

@interface YGShopIntroView ()

/**
 店铺介绍
 */
@property (nonatomic, strong) UILabel *shopIntroLabel;

@property (nonatomic, strong) UITextView *textView;

/**
 字数
 */
@property (nonatomic, strong) UILabel *wordCountLabel;

@end

@implementation YGShopIntroView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.shopIntroLabel];
        [self addSubview:self.textView];
        [self addSubview:self.wordCountLabel];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateWordCount:) name:UITextViewTextDidChangeNotification object:nil];
        
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)layoutSubviews
{
    [self.shopIntroLabel sizeToFit];
    [self.wordCountLabel sizeToFit];
    [self.shopIntroLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).offset(kRealValue(13));
        make.top.equalTo(self).offset(kRealValue(14));
        
    }];
    
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self).offset(kRealValue(13));
        make.right.equalTo(self).offset(- kRealValue(13));
        make.top.equalTo(self.shopIntroLabel.mas_bottom).offset(kRealValue(14));
        make.height.mas_equalTo((88));
        
    }];
    
    [self.wordCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self).offset(- kRealValue(13));
        make.top.equalTo(self.textView.mas_bottom).offset(kRealValue(5));
        
    }];
}

#pragma mark - 更新当前输入字数
- (void)updateWordCount:(NSNotification *)tification
{
    UITextView *textView = tification.object;
    self.wordCountLabel.text = [NSString stringWithFormat:@"%ld/100", textView.text.length];
}

#pragma mark - 懒加载
- (UILabel *)shopIntroLabel
{
    if (!_shopIntroLabel) {
        _shopIntroLabel = [UILabel labelWithFontSize:13.0f textColor:HEXCOLOR(0x333333) textAligment:(NSTextAlignmentCenter)];
        _shopIntroLabel.text = @"店铺介绍";
    }
    return _shopIntroLabel;
}

- (UITextView *)textView
{
    if (!_textView) {
        _textView = [[UITextView alloc] init];
        _textView.backgroundColor = HEXCOLOR(0xF5F5F5);
        _textView.layer.cornerRadius = 8.0f;
        _textView.layer.masksToBounds = true;
        _textView.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
        
        UILabel *label = [UILabel new];
        label.font = _textView.font;
        label.text = @"请填写商铺简介";
        label.numberOfLines = 0;
        label.textColor = HEXCOLOR(0x999999);
        [label sizeToFit];
        [_textView addSubview:label];
        // kvc
        [_textView setValue:label forKey:@"_placeholderLabel"];
    }
    return _textView;
}

- (UILabel *)wordCountLabel
{
    if (!_wordCountLabel) {
        _wordCountLabel = [UILabel labelWithFontSize:13.0f textColor:HEXCOLOR(0x999999) textAligment:(NSTextAlignmentCenter)];
        _wordCountLabel.text = @"0/100";
    }
    return _wordCountLabel;
}

@end

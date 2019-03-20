//
//  YGShopPicturePhotoCell.m
//  YGShop
//
//  Created by 卜立新 on 2018/11/7.
//  Copyright © 2018年 yige. All rights reserved.
//

#import "YGShopPicturePhotoCell.h"

NSString * const kYGShopPicturePhotoCellIdentifier = @"YGShopPicturePhotoCell";

@interface YGShopPicturePhotoCell ()

@property (nonatomic, strong) UIImageView *picture;

@property (nonatomic, strong) UIButton *deleteBtn;

@end

@implementation YGShopPicturePhotoCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self.contentView addSubview:self.picture];
        [self.contentView addSubview:self.deleteBtn];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [self.picture mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        
    }];
    
    [self.deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.width.height.mas_equalTo(22.0f);// 3 4
        make.top.equalTo(self.contentView).offset(3);
        make.right.equalTo(self.contentView).offset(- 4.0f);
        
    }];
}

#pragma mark - 图片
- (void)setPictureWithImage:(NSString *)imageName
{
    self.picture.image = [UIImage imageNamed:imageName];
}

- (void)deleteBtnHidden
{
    self.deleteBtn.hidden = true;
}

- (void)deleteBtnDisHidden
{
    self.deleteBtn.hidden = false;
}

- (void)clickDeleteBtn
{
    if (self.block) {
        self.block();
    }
}

#pragma mark - 懒加载
- (UIImageView *)picture
{
    if (!_picture) {
        
        _picture = [[UIImageView alloc] init];
        _picture.layer.cornerRadius = 5.0;
        _picture.layer.masksToBounds = true;
        
    }
    return _picture;
}

- (UIButton *)deleteBtn
{
    if (!_deleteBtn) {
        
        _deleteBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_deleteBtn setBackgroundImage:[UIImage imageNamed:@"icon_gb"] forState:(UIControlStateNormal)];
        [_deleteBtn addTarget:self action:@selector(clickDeleteBtn) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return _deleteBtn;
}


@end

//
//  UITableView+creat.h
//  ZKXFProject
//
//  Created by 卜立新 on 2018/8/2.
//  Copyright © 2018年 zhongkefurong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (creat)

/**
 创建UITableView
 
 @param frame 尺寸
 @param style 样式
 @param cell 注册的cell
 @param identifier 标示
 @return UITableView
 */
+ (UITableView *)tableViewWithFrame:(CGRect)frame
                              style:(UITableViewCellStyle)style
                      registerClass:(UITableViewCell *)cell
                         identifier:(NSString *)identifier;

@end

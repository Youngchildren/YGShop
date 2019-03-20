//
//  UITableView+creat.m
//  ZKXFProject
//
//  Created by 卜立新 on 2018/8/2.
//  Copyright © 2018年 zhongkefurong. All rights reserved.
//

#import "UITableView+creat.h"

@implementation UITableView (creat)

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
{
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:(UITableViewStylePlain)];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableView registerClass:[cell class] forCellReuseIdentifier:identifier];
    return tableView;
}

@end

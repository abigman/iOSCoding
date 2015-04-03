//
//  practiceTableViewCell.h
//  iOS_面试宝典
//
//  Created by mac on 15-3-11.
//  Copyright (c) 2015年 qb-group. All rights reserved.
//

#import <UIKit/UIKit.h>
//1.声明代理 设计代理方法
@class practiceTableViewCell;

@protocol practiceTableViewDelegate <NSObject>

-(void)changeCellTextColor:(NSInteger)number;

@end


@interface practiceTableViewCell : UITableViewCell

@property (weak, nonatomic)  UIButton* leftButton;
@property (weak, nonatomic) UILabel* questionLabel;
@property (strong, nonatomic) NSIndexPath* indexPath;

+(instancetype)demoTableViewCellWithTableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
//2.属性中声明代理实例
@property(strong,nonatomic)id<practiceTableViewDelegate> delegate;
@end

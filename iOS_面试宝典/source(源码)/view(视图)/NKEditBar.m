//
//  NKEditBar.m
//  NKKugouIOS-1
//
//  Created by hegf on 15-1-6.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "NKEditBar.h"
#import "UIView+NKMoreAttribute.h"

@implementation NKEditBar

+(instancetype)editBarWithItems:(NSArray*)items{
    NKEditBar* editBar = [[NKEditBar alloc]init];
    editBar.bounds = CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width, 44);
    [editBar setupItems:items];
    editBar.alpha = 0.8;
    return editBar;
}

#pragma mark 设置Bar Items 具体有几个由editBarWithItems使用者指定
-(void)setupItems:(NSArray*)items{
    CGFloat y = 0;
    CGFloat h = self.height;
    CGFloat w = self.width/items.count;
    CGFloat x = 0;
    
    for (int i=0; i<items.count; i++) {
        x = i*w;
        UIButton* btn = items[i];
        btn.backgroundColor = [UIColor lightGrayColor];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.frame = CGRectMake(x, y, w, h);
        [self addSubview:btn];
    }
}

@end

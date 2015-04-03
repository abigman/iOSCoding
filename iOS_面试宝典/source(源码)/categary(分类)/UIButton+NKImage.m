//
//  UIButton+NKImage.m
//  NKKugouIOS-1
//
//  Created by hegf on 14-12-29.
//  Copyright (c) 2014年 hegf. All rights reserved.
//

#import "UIButton+NKImage.h"

@implementation UIButton (NKImage)

#pragma mark 按照image名字返回设置普通和hilighted状态的button
+(instancetype)buttonWithNormalImage:(NSString *)imageNormal hilightedImage:(NSString *)imageHighted target:(id)target action:(SEL)action{
    
    UIButton *button = [[UIButton alloc]init];
    [button setImage:[UIImage imageNamed:imageNormal] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageHighted] forState:UIControlStateHighlighted];
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

#pragma mark 按照image名字返回设置普通和selected状态的button
+(instancetype)buttonWithNormalImage:(NSString *)imageNormal selectedImage:(NSString *)imageSelected target:(id)target action:(SEL)action{
    UIButton *button = [[UIButton alloc]init];
    [button setImage:[UIImage imageNamed:imageNormal] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageSelected] forState:UIControlStateSelected];
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

@end

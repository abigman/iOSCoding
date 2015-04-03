//
//  DEMO_OS.m
//  iOS_面试宝典
//
//  Created by mac on 15-3-10.
//  Copyright (c) 2015年 qb-group. All rights reserved.
//

#import "DEMO_OS.h"


@implementation DEMO_OS

//模型的取得
+(instancetype)DEMO_OSWithDict:(NSDictionary *)dict
{
    DEMO_OS * os = [[DEMO_OS alloc]init];
    [os setValuesForKeysWithDictionary:dict];
    return os;
}

@dynamic answerA;
@dynamic answerB;
@dynamic answerC;
@dynamic answerD;
@dynamic rigthAnswer;
@dynamic question;
@dynamic number;
@dynamic willBeChecked;
@end

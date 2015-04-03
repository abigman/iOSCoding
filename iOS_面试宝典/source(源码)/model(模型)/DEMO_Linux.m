//
//  DEMO_Linux.m
//  iOS_面试宝典
//
//  Created by mac on 15-3-10.
//  Copyright (c) 2015年 qb-group. All rights reserved.
//

#import "DEMO_Linux.h"
#import "AppDelegate.h"


@implementation DEMO_Linux

//模型的取得
+(instancetype)DEMO_LinuxWithDict:(NSDictionary *)dict
{
    AppDelegate* delegate =  [UIApplication sharedApplication].delegate;
    NSFetchRequest* request = [[NSFetchRequest alloc]init];
    NSEntityDescription* entity = [NSEntityDescription entityForName:@"DEMO_Linux" inManagedObjectContext:delegate.managedObjectContext];
    [request setEntity:entity];
    
    DEMO_Linux * linux = nil;
    linux = [NSEntityDescription insertNewObjectForEntityForName:@"DEMO_Linux" inManagedObjectContext:delegate.managedObjectContext];
    linux.willBeChecked = YES;
    NSMutableDictionary* newdict = [dict mutableCopy];
    [linux setValuesForKeysWithDictionary:newdict];
    
    return linux;
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

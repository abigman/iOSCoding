//
//  DEMO_OC.m
//  iOS_面试宝典
//
//  Created by mac on 15-3-10.
//  Copyright (c) 2015年 qb-group. All rights reserved.
//

#import "DEMO_OC.h"
#import "AppDelegate.h"

@implementation DEMO_OC


//模型的取得
+(instancetype)DEMO_OCWithDict:(NSDictionary *)dict
{
    AppDelegate* delegate =  [UIApplication sharedApplication].delegate;
    NSFetchRequest* request = [[NSFetchRequest alloc]init];
    NSEntityDescription* entity = [NSEntityDescription entityForName:@"DEMO_OC" inManagedObjectContext:delegate.managedObjectContext];
    [request setEntity:entity];
    
    DEMO_OC * OC = nil;
    OC = [NSEntityDescription insertNewObjectForEntityForName:@"DEMO_OC" inManagedObjectContext:delegate.managedObjectContext];
    OC.willBeChecked = YES;
    NSMutableDictionary* newdict = [dict mutableCopy];
    [OC setValuesForKeysWithDictionary:newdict];
    
    return OC;
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

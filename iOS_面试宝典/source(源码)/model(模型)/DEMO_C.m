//
//  DEMO_C.m
//  iOS_面试宝典
//
//  Created by mac on 15-3-10.
//  Copyright (c) 2015年 qb-group. All rights reserved.
//

#import "DEMO_C.h"
#import "AppDelegate.h"

@implementation DEMO_C

@dynamic answerA;
@dynamic answerB;
@dynamic answerC;
@dynamic answerD;
@dynamic rigthAnswer;
@dynamic question;
@dynamic number;
@dynamic willBeChecked;
//模型的取得
+(instancetype)DEMO_CWithDict:(NSDictionary *)dict
{
    
    AppDelegate* delegate =  [UIApplication sharedApplication].delegate;
    NSFetchRequest* request = [[NSFetchRequest alloc]init];
    NSEntityDescription* entity = [NSEntityDescription entityForName:@"DEMO_C" inManagedObjectContext:delegate.managedObjectContext];
    [request setEntity:entity];
    
    DEMO_C * c = nil;
    c = [NSEntityDescription insertNewObjectForEntityForName:@"DEMO_C" inManagedObjectContext:delegate.managedObjectContext];
    c.willBeChecked = YES;
    NSMutableDictionary* newdict = [dict mutableCopy];
    [c setValuesForKeysWithDictionary:newdict];
   
    return c;
    
    
}
@end

//
//  DEMO_Cpp.m
//  iOS_面试宝典
//
//  Created by mac on 15-3-10.
//  Copyright (c) 2015年 qb-group. All rights reserved.
//

#import "DEMO_Cpp.h"
#import "AppDelegate.h"

@implementation DEMO_Cpp

//模型的取得
+(instancetype)DEMO_CppWithDict:(NSDictionary *)dict
{
    AppDelegate* delegate =  [UIApplication sharedApplication].delegate;
    NSFetchRequest* request = [[NSFetchRequest alloc]init];
    NSEntityDescription* entity = [NSEntityDescription entityForName:@"DEMO_Cpp" inManagedObjectContext:delegate.managedObjectContext];
    [request setEntity:entity];
    
    DEMO_Cpp * Cpp = nil;
    Cpp = [NSEntityDescription insertNewObjectForEntityForName:@"DEMO_Cpp" inManagedObjectContext:delegate.managedObjectContext];
    Cpp.willBeChecked = YES;
    NSMutableDictionary* newdict = [dict mutableCopy];
    [Cpp setValuesForKeysWithDictionary:newdict];
    
    return Cpp;

}

@dynamic question;
@dynamic answerA;
@dynamic answerB;
@dynamic answerC;
@dynamic answerD;
@dynamic rigthAnswer;
@dynamic number;
@dynamic willBeChecked;

@end

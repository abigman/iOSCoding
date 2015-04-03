//
//  NSArray+NKPList.m
//  NKKugouIOS-1
//
//  Created by hegf on 14-12-30.
//  Copyright (c) 2014年 hegf. All rights reserved.
//

#import "NSArray+NKPList.h"

@implementation NSArray (NKPList)
+(instancetype)arrayWithPlist:(NSString*)plistName{
    NSURL* url = [[NSBundle mainBundle]URLForResource:plistName withExtension:nil];
    NSArray* array = [NSArray arrayWithContentsOfURL:url];
    return array;
}
@end

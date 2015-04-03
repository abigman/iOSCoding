//
//  DEMO_OS.h
//  iOS_面试宝典
//
//  Created by mac on 15-3-10.
//  Copyright (c) 2015年 qb-group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DEMO_OS : NSManagedObject

+(instancetype)DEMO_OSWithDict:(NSDictionary *)dict;

@property (nonatomic, retain) NSString * answerA;
@property (nonatomic, retain) NSString * answerB;
@property (nonatomic, retain) NSString * answerC;
@property (nonatomic, retain) NSString * answerD;
@property (nonatomic, retain) NSString * rigthAnswer;
@property (nonatomic, retain) NSString * question;
@property (nonatomic, assign) NSNumber * number;
@property (assign, nonatomic) BOOL willBeChecked;

@end

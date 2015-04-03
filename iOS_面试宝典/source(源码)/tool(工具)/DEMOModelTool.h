//
//  NKTestTool.h
//  iOS_面试宝典
//
//  Created by mac on 15-3-9.
//  Copyright (c) 2015年 qb-group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DEMO_C.h"
#import "DEMO_Cpp.h"
#import "DEMO_OC.h"
#import "DEMO_Linux.h"

#import <UIKit/UIKit.h>

@interface DEMOModelTool : NSObject
+(instancetype)sharedDEMOModelTool;
-(void)receiveModelNumber:(NSInteger)number;
-(void)receiveMenuNumber:(NSInteger)number;
-(void)nextQuestionNumber;

-(void)earlyQuestionNumber;
-(void)jumpFirstQuestion;
-(void)examScore;
- (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize;
@property(nonatomic,assign)NSInteger modelNumber;
@property(nonatomic,assign)NSInteger menuNumber;
@property(nonatomic,assign)NSInteger questionNumber;
@property (strong, nonatomic) NSMutableArray* allQuestionList;
@property(nonatomic,assign)NSInteger examNumeber;

@property(nonatomic,assign)NSInteger indexpath;
@property(nonatomic,strong)NSDictionary *answerDict;


-(void)searchCQuestionList;
-(void)searchCppQuestionList;
-(void)searchOCQuestionList;
-(void)searchLinuxQuestionList;

- (void) animationWithView : (UIView *)view WithAnimationTransition : (UIViewAnimationTransition) transition;
- (void) transitionWithType:(NSString *) type WithSubtype:(NSString *) subtype ForView : (UIView *) view;
-(UIView*)mengban;
-(void)deleteMengBan;
-(void)getRandomArray;
-(NSInteger)receiveQuestionNumber;
@end

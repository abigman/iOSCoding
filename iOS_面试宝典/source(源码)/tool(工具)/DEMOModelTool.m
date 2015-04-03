//
//  NKTestTool.m
//  iOS_面试宝典
//
//  Created by mac on 15-3-9.
//  Copyright (c) 2015年 qb-group. All rights reserved.
//
#define DURATION 0.7f
#define kScreenHeight  [UIScreen mainScreen].applicationFrame.size.height
#define kScreenWidth  [UIScreen mainScreen].applicationFrame.size.width

#import "DEMOModelTool.h"
#import "NSArray+NKPList.h"
#import "DEMO_C.h"
#import "DEMO_Cpp.h"
#import "DEMO_Linux.h"
#import "DEMO_OC.h"
#import "DEMO_OS.h"

static DEMOModelTool *tool;
@interface DEMOModelTool()
{
    NSInteger _i;
    NSInteger _lastQuestion;
}
@property (nonatomic,strong)UIView *maskView;
@property (nonatomic,strong)NSArray *randomArray;
@end
@implementation DEMOModelTool
+(instancetype)sharedDEMOModelTool
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        tool = [[DEMOModelTool alloc]init];
    });
    return tool;
}
+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        tool= [super allocWithZone:zone];
    
        
    });
    return tool;
}
-(instancetype)init
{
    self= [super init];
    _allQuestionList = [NSMutableArray array];
    
    _maskView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth,kScreenHeight+44)];
    _maskView.alpha = 0.1;
    _maskView.hidden=YES;
    _maskView.backgroundColor = [UIColor clearColor];
    _answerDict=@{@"A":@1,@"B":@2,@"C":@3,@"D":@4};
    _randomArray=[NSArray array];
    //_examNumeber =0;
    return self;
}
-(void)receiveModelNumber:(NSInteger)number
{
    _modelNumber=number;
//    NSLog(@"modelNumber is %li",(long)_modelNumber);
}

-(void)receiveMenuNumber:(NSInteger)number
{
    _menuNumber=number;
//    NSLog(@"menuNumer is %li",(long)_menuNumber);
}

-(void)nextQuestionNumber

{
    
    if (_modelNumber == 0) {
        _questionNumber ++;
    }
    else if (_modelNumber ==1)
    {
        _questionNumber=[self receiveQuestionNumber];
//        NSLog(@"questionNumber,%li",(long)_questionNumber);
    }
    else if (_modelNumber==2) {
        _questionNumber++;
    }
    
}

-(void)examScore
{
    _examNumeber++;

}

-(NSInteger)receiveQuestionNumber
{

    NSInteger randomNumber;
    NSNumber *temp=_randomArray[_i];
    _lastQuestion=_i-1;
    randomNumber=[temp integerValue];
    if (_i<14) {
        _i++;
    }
  
    
    return randomNumber;
}

-(void)getRandomArray
{

    NSMutableArray *randomArray=[NSMutableArray array];
    NSInteger count= self.allQuestionList.count;
    int i;
    int a[count];
    int num;
    int m;
    for(i=0;i<count;i++){
        a[i]=i;
    }
    srand(time(NULL));
    for(i=0;i<self.allQuestionList.count;i++){
        num=rand()%(count--);
        m=a[num];
        a[num]=a[count];
        a[count]=m;
    }
    
    for(i=self.allQuestionList.count-1;i>0;i--)
    {
        NSNumber *number=[NSNumber numberWithInt:a[i]];
        [randomArray addObject:number];
    }
    
    _randomArray=randomArray;
    _i=0;



}


-(void)earlyQuestionNumber
{
    if (_modelNumber == 0||_modelNumber ==2)
    {
        if (_questionNumber>0) {
            _questionNumber --;
        }
    }
    else if (_modelNumber ==1)
    {
        if (_lastQuestion>=0) {
            _questionNumber=[_randomArray[_lastQuestion] intValue];
//            NSLog(@"%ld,%li",(long)_questionNumber,(long)_lastQuestion);
            _lastQuestion --;
        }
     

    }

}

-(void)jumpFirstQuestion
{
    _questionNumber = 0;
}

#pragma mark 搜索C语言题库列表
-(void)searchCQuestionList
{
    NSArray *array = [NSArray arrayWithPlist:@"CPlist.plist"];
    for (NSDictionary* dict in array)
    {
        DEMO_C * mode = [DEMO_C DEMO_CWithDict:dict];
        
        [_allQuestionList addObject:mode];
    }
}
#pragma mark 搜索C++语言题库列表
-(void)searchCppQuestionList
{
    NSArray *array = [NSArray arrayWithPlist:@"CppPlist.plist"];
    for (NSDictionary* dict in array)
    {
        DEMO_Cpp *mode = [DEMO_Cpp DEMO_CppWithDict:dict];
        
        [_allQuestionList addObject:mode];
    }
}
#pragma mark 搜索OS语言题库列表
-(void)searchOCQuestionList
{
    NSArray *array = [NSArray arrayWithPlist:@"OCPlist.plist"];
    for (NSDictionary* dict in array)
    {
        DEMO_OC *mode = [DEMO_OC DEMO_OCWithDict:dict];
        [_allQuestionList addObject:mode];
    }
}
#pragma mark 搜索Linux语言题库列表
-(void)searchLinuxQuestionList
{
    NSArray *array = [NSArray arrayWithPlist:@"LinuxPlist.plist"];
    for (NSDictionary* dict in array)
    {
        DEMO_Linux *mode = [DEMO_Linux DEMO_LinuxWithDict:dict];
        [_allQuestionList addObject:mode];
    }
}


#pragma UIView实现动画
- (void) animationWithView : (UIView *)view WithAnimationTransition : (UIViewAnimationTransition) transition
{
    [UIView animateWithDuration:DURATION animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:transition forView:view cache:YES];
    }];
}
#pragma CATransition动画实现
- (void) transitionWithType:(NSString *) type WithSubtype:(NSString *) subtype ForView : (UIView *) view
{
    //创建CATransition对象
    CATransition *animation = [CATransition animation];
    
    //设置运动时间
    animation.duration = DURATION;
    
    //设置运动type
    animation.type = type;
    if (subtype != nil) {
        
        //设置子类
        animation.subtype = subtype;
    }
    
    //设置运动速度
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    
    [view.layer addAnimation:animation forKey:@"animation"];
}
#pragma mark 蒙版增加
-(UIView*)mengban
{
    _maskView.hidden=NO;
    return _maskView;
}

#pragma mark 删除蒙版
-(void)deleteMengBan
{
    _maskView.hidden=YES;
    
}
#pragma mark 自定义尺寸根据文字
- (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *dict = @{NSFontAttributeName : font};
    // 如果将来计算的文字的范围超出了指定的范围,返回的就是指定的范围
    // 如果将来计算的文字的范围小于指定的范围, 返回的就是真实的范围
    CGSize size =  [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size;
}

@end

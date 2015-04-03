//
//  ExamViewController.m
//  iOS_面试宝典
//
//  Created by 琪琪 on 15-3-9.
//  Copyright (c) 2015年 qb-group. All rights reserved.
//

#import "ExamViewController.h"
#import "practiceTableViewCell.h"
#import "DEMO_C.h"
#import "DEMO_Cpp.h"
#import "DEMO_OC.h"
#import "DEMO_Linux.h"
#import "DEMOModelTool.h"
#import <UIKit/UIKit.h>
#import "UIView+NKMoreAttribute.h"
#import "HHAlertView.h"
#define YYNameFont [UIFont systemFontOfSize:15]
#define YYTextFont [UIFont systemFontOfSize:16]

@interface ExamViewController ()<UITableViewDataSource,UITableViewDelegate,practiceTableViewDelegate,UIAlertViewDelegate>
{
    NSInteger _row;
    CGSize _textSize;
    NSInteger indexNumber;
}

@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@property (weak, nonatomic) IBOutlet UIButton *collectBtn;

- (IBAction)nextQuestion:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ExamViewController



-(void)changeCellTextColor:(NSInteger)number

{
  
    
    NSLog(@"代理,%li",(long)number);
    
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:number inSection:0];
    
    practiceTableViewCell *cell=(practiceTableViewCell *)[_tableView cellForRowAtIndexPath:indexPath];
    
    cell.textLabel.textColor=[UIColor greenColor];
    
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    switch ([DEMOModelTool sharedDEMOModelTool].menuNumber)
    {
        case 1:
            [[DEMOModelTool sharedDEMOModelTool] searchCQuestionList];
            break;
        case 2:
            [[DEMOModelTool sharedDEMOModelTool] searchCppQuestionList];
            break;
        case 3:
            [[DEMOModelTool sharedDEMOModelTool] searchOCQuestionList];
            break;
        case 4:
            [[DEMOModelTool sharedDEMOModelTool] searchLinuxQuestionList];
            break;
        default:
            break;
    }
    
    [[DEMOModelTool sharedDEMOModelTool]getRandomArray];
    indexNumber=0;
    
}


-(void)viewWillDisappear:(BOOL)animated
{
    [[DEMOModelTool sharedDEMOModelTool].allQuestionList removeAllObjects];
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationController.navigationBar.tintColor = [UIColor brownColor];
    self.navigationController.navigationBar.tintColor = [UIColor brownColor];
    _row = 0;
    [self setUpTableViewFrame];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    // Do any additional setup after loading the view.
}

#pragma mark setupTableViewFrame
-(void)setUpTableViewFrame
{
    _tableView.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

#pragma mark tableView数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    practiceTableViewCell * cell = [practiceTableViewCell demoTableViewCellWithTableView:tableView cellForRowAtIndexPath:indexPath];
    _row = [DEMOModelTool sharedDEMOModelTool].questionNumber;
    cell.delegate=self;
    
    if ([DEMOModelTool sharedDEMOModelTool].menuNumber == 1)
    {
        DEMO_C *mode = [DEMOModelTool sharedDEMOModelTool].allQuestionList[_row];
        NSString *str = [NSString stringWithString:mode.question];
        NSString *str1 = [NSString stringWithFormat:@"%@",mode.number];
        NSString * str2 = [NSString stringWithFormat:@"题目%@. %@",str1,str];
        cell.indexPath = indexPath;
        
        
        switch (indexPath.row) {
            case 0:
                [cell.leftButton removeFromSuperview];
                cell.textLabel.numberOfLines = 0;
                cell.textLabel.text = str2;
                break;
            case 1:
                
                cell.textLabel.text = [NSString stringWithFormat:@"    A. %@",mode.answerA];
                cell.textLabel.numberOfLines = 0;
                break;
            case 2:
                cell.textLabel.text = [NSString stringWithFormat:@"    B. %@",mode.answerB];
                cell.textLabel.numberOfLines = 0;
                break;
            case 3:
                cell.textLabel.text = [NSString stringWithFormat:@"    C. %@",mode.answerC];
                cell.textLabel.numberOfLines = 0;
                break;
            case 4:
                cell.textLabel.text = [NSString stringWithFormat:@"    D. %@",mode.answerD];
                cell.textLabel.numberOfLines = 0;
                break;
                
            default:
                break;
        }
        
    }
    else if ([DEMOModelTool sharedDEMOModelTool].menuNumber ==2)
    {
        DEMO_Cpp *mode = [DEMOModelTool sharedDEMOModelTool].allQuestionList [_row];
        NSString *str = [NSString stringWithString:mode.question];
        NSString *str1 = [NSString stringWithFormat:@"%@",mode.number];
        NSString * str2 = [NSString stringWithFormat:@"题目%@. %@",str1,str];
        cell.indexPath = indexPath;
        
        
        
        switch (indexPath.row) {
            case 0:
                [cell.leftButton removeFromSuperview];
                cell.textLabel.numberOfLines = 0;
                cell.textLabel.text = str2;
                break;
            case 1:
                
                cell.textLabel.text = [NSString stringWithFormat:@"    A. %@",mode.answerA];
                cell.textLabel.numberOfLines = 0;
                break;
            case 2:
                cell.textLabel.text = [NSString stringWithFormat:@"    B. %@",mode.answerB];
                cell.textLabel.numberOfLines = 0;
                break;
            case 3:
                cell.textLabel.text = [NSString stringWithFormat:@"    C. %@",mode.answerC];
                cell.textLabel.numberOfLines = 0;
                break;
            case 4:
                cell.textLabel.text = [NSString stringWithFormat:@"    D. %@",mode.answerD];
                cell.textLabel.numberOfLines = 0;
                break;
                
            default:
                break;
        }
        
        
    }
    else if ([DEMOModelTool sharedDEMOModelTool].menuNumber ==3)
    {
        DEMO_OC *mode = [DEMOModelTool sharedDEMOModelTool].allQuestionList [_row];
        NSString *str = [NSString stringWithString:mode.question];
        NSString *str1 = [NSString stringWithFormat:@"%@",mode.number];
        NSString * str2 = [NSString stringWithFormat:@"题目%@. %@",str1,str];
        cell.indexPath = indexPath;
        
        
        switch (indexPath.row) {
            case 0:
                [cell.leftButton removeFromSuperview];
                cell.textLabel.numberOfLines = 0;
                cell.textLabel.text = str2;
                break;
            case 1:
                
                cell.textLabel.text = [NSString stringWithFormat:@"    A. %@",mode.answerA];
                cell.textLabel.numberOfLines = 0;
                break;
            case 2:
                cell.textLabel.text = [NSString stringWithFormat:@"    B. %@",mode.answerB];
                cell.textLabel.numberOfLines = 0;
                break;
            case 3:
                cell.textLabel.text = [NSString stringWithFormat:@"    C. %@",mode.answerC];
                cell.textLabel.numberOfLines = 0;
                break;
            case 4:
                cell.textLabel.text = [NSString stringWithFormat:@"    D. %@",mode.answerD];
                cell.textLabel.numberOfLines = 0;
                break;
                
            default:
                break;
        }
        
        
    }
    else if ([DEMOModelTool sharedDEMOModelTool].menuNumber ==4)
    {
        DEMO_Linux *mode = [DEMOModelTool sharedDEMOModelTool].allQuestionList [_row];
        NSString *str = [NSString stringWithString:mode.question];
        NSString *str1 = [NSString stringWithFormat:@"%@",mode.number];
        NSString * str2 = [NSString stringWithFormat:@"题目%@. %@",str1,str];
        cell.indexPath = indexPath;
        
        
        switch (indexPath.row) {
            case 0:
                [cell.leftButton removeFromSuperview];
                cell.textLabel.numberOfLines = 0;
                cell.textLabel.text = str2;
                break;
            case 1:
                
                cell.textLabel.text = [NSString stringWithFormat:@"    A. %@",mode.answerA];
                cell.textLabel.numberOfLines = 0;
                break;
            case 2:
                cell.textLabel.text = [NSString stringWithFormat:@"    B. %@",mode.answerB];
                cell.textLabel.numberOfLines = 0;
                break;
            case 3:
                cell.textLabel.text = [NSString stringWithFormat:@"    C. %@",mode.answerC];
                cell.textLabel.numberOfLines = 0;
                break;
            case 4:
                cell.textLabel.text = [NSString stringWithFormat:@"    D. %@",mode.answerD];
                cell.textLabel.numberOfLines = 0;
                break;
                
            default:
                break;
        }
        
        
    }
    cell.leftButton.selected=NO;
    cell.textLabel.textColor= [UIColor blackColor];
    cell.questionLabel.textColor =[UIColor blackColor];
    cell.questionLabel.numberOfLines = 0;
    return cell;
}
#pragma mark tableView代理方法



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)nextQuestion:(UIButton *)sender
{
    if (indexNumber< ([DEMOModelTool sharedDEMOModelTool].allQuestionList.count-1) ) {
        [[DEMOModelTool sharedDEMOModelTool]nextQuestionNumber];
        //实现翻页功能
        [[DEMOModelTool sharedDEMOModelTool]animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionCurlUp];
        //下一题后删除蒙版
        [[DEMOModelTool sharedDEMOModelTool]deleteMengBan];
        [_tableView reloadData];
        
        indexNumber++;
    }
    _nextBtn.selected = NO;
    
    
}


- (IBAction)collectQuestion:(UIButton *)sender {
    
    NSInteger socre= [[DEMOModelTool sharedDEMOModelTool]examNumeber];
//    NSLog(@"考试成绩%li",(long)socre);
    NSString * str = [NSString stringWithFormat:@"%ld",(long)socre];
    UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"成绩(每题一分)" message:str delegate:self cancelButtonTitle:nil otherButtonTitles:@"好", nil];
    [alertview show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [DEMOModelTool sharedDEMOModelTool].examNumeber =0;
    [self.navigationController popViewControllerAnimated:YES];
}

@end


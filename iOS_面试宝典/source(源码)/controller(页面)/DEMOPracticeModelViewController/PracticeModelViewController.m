//
//  PracticeModelViewController.m
//  iOS_面试宝典
//
//  Created by 秦彬 on 15/3/9.
//  Copyright (c) 2015年 qb-group. All rights reserved.
//

#import "PracticeModelViewController.h"
#import "practiceTableViewCell.h"
#import "DEMO_C.h"
#import "DEMO_Cpp.h"
#import "DEMO_OC.h"
#import "DEMO_Linux.h"
#import "DEMOModelTool.h"
#import <UIKit/UIKit.h>
#import "UIView+NKMoreAttribute.h"
#define YYNameFont [UIFont systemFontOfSize:15]
#define YYTextFont [UIFont systemFontOfSize:16]
@interface PracticeModelViewController ()<UITableViewDataSource,UITableViewDelegate,practiceTableViewDelegate>
{
    NSInteger _row;
    DEMO_C * _Cmode;
    CGSize _textSize;
    NSInteger indexNumber;
}
@property (weak, nonatomic) IBOutlet UIButton *earlyBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (weak, nonatomic) IBOutlet UIButton *jumpBtn;
@property (weak, nonatomic) IBOutlet UIButton *collectBtn;

- (IBAction)nextQuestion:(UIButton *)sender;
- (IBAction)earlyQuestion:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end


@implementation PracticeModelViewController
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
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.tableView.contentSize=CGSizeMake(0, 700);
}

-(void)viewWillDisappear:(BOOL)animated
{
    [[DEMOModelTool sharedDEMOModelTool].allQuestionList removeAllObjects];
    NSInteger x= [DEMOModelTool sharedDEMOModelTool].questionNumber;
    x=0;
    [DEMOModelTool sharedDEMOModelTool].questionNumber = x;
    
    
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
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

- (IBAction)earlyQuestion:(UIButton *)sender
{
    if ([DEMOModelTool sharedDEMOModelTool].questionNumber >0) {
        [[DEMOModelTool sharedDEMOModelTool] earlyQuestionNumber];
        [[DEMOModelTool sharedDEMOModelTool]animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionCurlDown];
        [[DEMOModelTool sharedDEMOModelTool]deleteMengBan];
        [_tableView reloadData];
    }
    _earlyBtn.selected = NO;
    if (indexNumber>1) {
        indexNumber--;
    }
    
    
}
- (IBAction)jumpToFirstQuestion:(UIButton *)sender{
NSString *subtypeString;
     indexNumber=0;

switch (random()%4) {
    case 0:
        subtypeString = kCATransitionFromLeft;
        break;
    case 1:
        subtypeString = kCATransitionFromBottom;
        break;
    case 2:
        subtypeString = kCATransitionFromRight;
        break;
    case 3:
        subtypeString = kCATransitionFromTop;
        break;
    default:
        break;
}
    if ([DEMOModelTool sharedDEMOModelTool].questionNumber != 0)
    {
        [[DEMOModelTool sharedDEMOModelTool] jumpFirstQuestion];
        [[DEMOModelTool sharedDEMOModelTool ]transitionWithType:@"cube" WithSubtype:subtypeString ForView:self.view];
       
        [_tableView reloadData];
    }

}
- (IBAction)collectQuestion:(UIButton *)sender {
}

@end

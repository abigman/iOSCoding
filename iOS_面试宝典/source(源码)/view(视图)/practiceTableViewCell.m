//
//  practiceTableViewCell.m
//  iOS_面试宝典
//
//  Created by mac on 15-3-11.
//  Copyright (c) 2015年 qb-group. All rights reserved.
//

#import "practiceTableViewCell.h"
#import "UIButton+NKImage.h"
#import "UIView+NKMoreAttribute.h"
#import "DEMOModelTool.h"
#import "DEMO_C.h"
#define kScreenWidth  [UIScreen mainScreen].applicationFrame.size.width
#define kScreenHeight  [UIScreen mainScreen].applicationFrame.size.height
#define kWidthRatio 44.0/320.0
#define kHeightRatio 44.0/568.0
#define YYNameFont [UIFont systemFontOfSize:15]
#define YYTextFont [UIFont systemFontOfSize:16]


@implementation practiceTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)demoTableViewCellWithTableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* ID = @"localMusicCell";
    
    practiceTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[practiceTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //自定义contentView
        [self setupContentView];
       
    }
    return self;
}
#pragma mark 自定义contentView
-(void)setupContentView{
    
    UIButton* leftButton = [UIButton buttonWithNormalImage:@"all_favorite_btn_check_on_default" selectedImage:@"all_favorite_btn_check_on_pressed" target:self action:@selector(leftButtonClicked:)];
    leftButton.frame = CGRectMake(0, 0, kScreenWidth*kWidthRatio, kScreenHeight*kHeightRatio);
    
    [self.contentView addSubview:leftButton];
    _leftButton = leftButton;
    
}

- (void)leftButtonClicked:(UIButton*)btn{
    
    
    NSInteger row = [DEMOModelTool sharedDEMOModelTool].questionNumber;
    
    
    DEMO_C * mode = [DEMOModelTool sharedDEMOModelTool].allQuestionList[row];

    btn.selected = !btn.selected;
    
    
    NSString * checkAnswer1 = [self.textLabel.text substringToIndex:5];
    NSString * checkAnswer = [checkAnswer1 substringFromIndex:4];
     NSLog(@"选中的行数%li,当前题目模型的rightAnswer%@,截取当前选中行的选项%@",(long)_indexPath.row,mode.rigthAnswer,checkAnswer);
    NSInteger rightAnswerNumber=[[DEMOModelTool sharedDEMOModelTool].answerDict[mode.rigthAnswer]intValue];;
    NSLog(@"%li",(long)rightAnswerNumber);
    if ([DEMOModelTool sharedDEMOModelTool].modelNumber !=2) {
        if ([mode.rigthAnswer isEqualToString:checkAnswer]) {
            
            self.textLabel.textColor = [UIColor greenColor];
            
        }
        else
        {
            self.textLabel.textColor = [UIColor redColor];
            if ([_delegate respondsToSelector:@selector(changeCellTextColor:)]) {
                [_delegate changeCellTextColor:rightAnswerNumber];
            }
            
            
        }
         [self.superview addSubview:[DEMOModelTool sharedDEMOModelTool].mengban];
        
    }
     if ([DEMOModelTool sharedDEMOModelTool].modelNumber ==2)
    {
        if ([mode.rigthAnswer isEqualToString:checkAnswer]) {
           [[DEMOModelTool sharedDEMOModelTool]examScore ];
            
            
        }
    }
  
   
}

@end

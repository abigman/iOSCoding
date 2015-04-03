//
//  DEMOSecondNavRootViewController.m
//  iOS_面试宝典
//
//  Created by 秦彬 on 15/3/11.
//  Copyright (c) 2015年 qb-group. All rights reserved.
//

#import "DEMOSecondNavRootViewController.h"
#import "DEMOModelTool.h"
#import "DEMORootViewController.h"
#import "HHAlertView.h"

@interface DEMOSecondNavRootViewController ()<HHAlertViewDelegate>

@end

@implementation DEMOSecondNavRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[HHAlertView shared] setDelegate:self];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=YES;
}

-(void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=NO;
}

- (IBAction)beginBtnClick:(UIButton *)sender
{
    [HHAlertView showAlertWithStyle:HHAlertStyleWraing inView:self.view Title:@"警告！前方高能试题！" detail:@"骚年，你确定?" cancelButton:@"认怂" Okbutton:@"哼！"];
}

- (void)didClickButtonAnIndex:(HHAlertButton)button
{
    if (button == HHAlertButtonOk)
    {
            if ([DEMOModelTool sharedDEMOModelTool].modelNumber==2) {
            [self performSegueWithIdentifier:@"push2" sender:self];
            }
            else
            {
            [self performSegueWithIdentifier:@"push1" sender:self];
            }
    }
    else
    {
        [HHAlertView Hide];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

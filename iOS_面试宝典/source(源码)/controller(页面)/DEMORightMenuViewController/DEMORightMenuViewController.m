//
//  DEMORightMenuViewController.m
//  RESideMenuStoryboards
//
//  Created by Roman Efimov on 2/11/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import "DEMORightMenuViewController.h"
#import "DEMOFirstViewController.h"
#import "DEMOLeftMenuViewController.h"

@interface DEMORightMenuViewController ()<UIAlertViewDelegate>
{
    UIAlertView * _alertView;
}

@property (strong, readwrite, nonatomic) UITableView *tableView;

@end

@implementation DEMORightMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, (self.view.frame.size.height - 54 * 2) / 2.0f, self.view.frame.size.width, 54 * 3) style:UITableViewStylePlain];
        tableView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.opaque = NO;
        tableView.backgroundColor = [UIColor clearColor];
        tableView.backgroundView = nil;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.bounces = NO;
        tableView;
    });
    [self.view addSubview:self.tableView];
    
}

#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"提示" message:@"亲，目前功能我们正在努力完善中，感谢您对我们的支持！" delegate:self cancelButtonTitle:nil otherButtonTitles:@"好", nil];
    UIAlertView *alertview1 = [[UIAlertView alloc] initWithTitle:@"提示" message:@"此版本已是最新版本" delegate:self cancelButtonTitle:nil otherButtonTitles:@"好", nil];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [alertview show];
            break;
        case 1:
            [alertview show];

            break;
            case 2:
            [alertview show];
            break;
            case 3:
            [alertview1 show];
            break;
        default:
            break;
    }
}

#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 36;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:19];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.highlightedTextColor = [UIColor lightGrayColor];
        cell.selectedBackgroundView = [[UIView alloc] init];
    }
    NSArray *titles = @[@"我的收藏",@"考试记录", @"关于我们", @"版本更新"];
    cell.textLabel.text = titles[indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentRight;
    
    return cell;
}

@end

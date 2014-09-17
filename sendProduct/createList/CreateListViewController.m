//
//  CreateListViewController.m
//  XianYunTong
//
//  Created by wuzhensong on 14-9-14.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "CreateListViewController.h"
#import "WSTabBarController.h"

@interface CreateListViewController ()

@end

@implementation CreateListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [NOTIFICATIONCENTER postNotificationName:NOTI_WSTABBARHIDDEN object:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createBarWithLeftBarItem:MoshNavigationBarItemBack rightBarItem:MoshNavigationBarItemNone title:@"发布货单"];
    self.baseScrollView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    self.baseScrollView.contentSize = CGSizeMake(SCREENWIDTH, 530);
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardDidDisapper:) name:UIKeyboardDidHideNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIKeyboardNotification -
- (void) keyBoardDidShow:(NSNotification *)noti
{
    [GlobalConfig keyBoardDidShow:noti scrollView:self.baseScrollView];
}

- (void) keyBoardDidDisapper:(NSNotification *)noti
{
    [GlobalConfig keyBoardDidDisapper:noti scrollView:self.baseScrollView];
}

- (void) navBackClick
{

    [super navBackClick];
    [NOTIFICATIONCENTER postNotificationName:NOTI_WSTABBARSHOW object:nil];
}


- (IBAction)confirm:(id)sender {
}

- (IBAction)selectType:(id)sender {
}

- (IBAction)selectDate:(id)sender {
}

- (IBAction)selectStartPlace:(id)sender {
}

- (IBAction)selectEndPlace:(id)sender {
}

- (IBAction)cancle:(id)sender {
}
@end

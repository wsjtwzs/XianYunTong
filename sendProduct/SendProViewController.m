//
//  SendProViewController.m
//  XianYunTong
//
//  Created by wuzhensong on 14-9-14.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "SendProViewController.h"

typedef enum {
    ItemPressed_createList  = 101,
    ItemPressed_nearerCar   = 102,
    ItemPressed_confirmList = 103,
} ItemPressed;

@interface SendProViewController ()

@end

@implementation SendProViewController

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
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self createBarWithLeftBarItem:MoshNavigationBarItemBack rightBarItem:MoshNavigationBarItemNone title:@"我要发货"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton *)sender {
    switch (sender.tag) {
        case ItemPressed_createList:
            [self.navigationController pushViewController:[Controllers viewControllerWithName:@"CreateListViewController"] animated:YES];
            break;
        case ItemPressed_nearerCar:
            [self.navigationController pushViewController:[Controllers viewControllerWithName:@"CarPathViewController"] animated:YES];
            break;
        case ItemPressed_confirmList:
            [self.navigationController pushViewController:[Controllers viewControllerWithName:@"SendProViewController"] animated:YES];
            break;
        default:
            break;
    }
}


@end

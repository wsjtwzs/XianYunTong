//
//  HomeViewController.m
//  XianYunTong
//
//  Created by wuzhensong on 14-9-14.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "HomeViewController.h"

typedef enum {
    homeItemPressed_sendPro     = 100,
    homeItemPressed_searchPro   = 101,
    homeItemPressed_carLocation = 102,
    homeItemPressed_proLocation = 103,
} homeItemPressed;

@interface HomeViewController ()

@end

@implementation HomeViewController

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
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton *)sender {
    switch (sender.tag) {
        case homeItemPressed_sendPro:
            [self.navigationController pushViewController:[Controllers viewControllerWithName:@"SendProViewController"] animated:YES];
            break;
        case homeItemPressed_searchPro:
            [self.navigationController pushViewController:[Controllers viewControllerWithName:@"SearchProViewController"] animated:YES];
            break;
        case homeItemPressed_carLocation:
            [self.navigationController pushViewController:[Controllers viewControllerWithName:@"SendProViewController"] animated:YES];
            break;
        case homeItemPressed_proLocation:
            [self.navigationController pushViewController:[Controllers viewControllerWithName:@"SendProViewController"] animated:YES];
            break;
            
        default:
            break;
    }
}
@end

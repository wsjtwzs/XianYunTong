//
//  CommonViewController.m
//  XianYunTong
//
//  Created by wuzhensong on 14-9-16.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "CommonViewController.h"

static CGFloat headerHeight = 20.0f;

@interface CommonViewController ()
{
    UIButton *_allSelectButton;
}

@end

@implementation CommonViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.selectArr = [NSMutableArray new];
    // Do any additional setup after loading the view.
    
    UIView *headerView = [GlobalConfig createViewWithFrame:CGRectMake(0, 0, SCREENWIDTH, headerHeight)];
    
    _allSelectButton = [GlobalConfig createButtonWithFrame:CGRectMake(10, 4, 12, 12) ImageName:@"btn_allSelect" Title:nil Target:self Action:@selector(allSelected:)];
    [headerView addSubview:_allSelectButton];
    
    UILabel *label = [GlobalConfig createLabelWithFrame:CGRectMake(25, 4, 100, 12) Text:@"全选" FontSize:12 textColor:TEXTGRAYCOLOR];
    [headerView addSubview:label];
    
    UIImageView *line = [GlobalConfig createImageViewWithFrame:CGRectMake(10, headerHeight - 1, 300, 1) ImageName:@"line"];
    [headerView addSubview:line];
    
    self.baseTableView.tableHeaderView = headerView;
    
}

- (void) allSelected:(UIButton *)button
{
    NSMutableArray *arr = [NSMutableArray new];
        for (NSNumber *number in self.selectArr) {
            [arr addObject:[NSNumber numberWithBool:![number boolValue]]];
        }
    self.selectArr = arr;
    
    [self.baseTableView reloadData];
}

- (void) setSelectedAtIndex:(NSInteger)index
{
    if (index >= 0 && index < self.selectArr.count) {
        NSNumber *number = self.selectArr[index];
        number = [NSNumber numberWithBool:![number boolValue]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

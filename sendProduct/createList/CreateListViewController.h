//
//  CreateListViewController.h
//  XianYunTong
//
//  Created by wuzhensong on 14-9-14.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "BaseViewController.h"

@interface CreateListViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UIScrollView *baseScrollView;

@property (weak, nonatomic) IBOutlet UITextField *proName;
@property (weak, nonatomic) IBOutlet UITextField *proWeight;
@property (weak, nonatomic) IBOutlet UIButton *proType;
@property (weak, nonatomic) IBOutlet UIButton *date;
@property (weak, nonatomic) IBOutlet UIButton *startPlace;
@property (weak, nonatomic) IBOutlet UIButton *endPlace;
@property (weak, nonatomic) IBOutlet UITextField *companyName;
@property (weak, nonatomic) IBOutlet UITextField *linkMan;
@property (weak, nonatomic) IBOutlet UITextField *linkPhone;
- (IBAction)confirm:(id)sender;

- (IBAction)selectType:(id)sender;
- (IBAction)selectDate:(id)sender;
- (IBAction)selectStartPlace:(id)sender;
- (IBAction)selectEndPlace:(id)sender;
- (IBAction)cancle:(id)sender;





@end

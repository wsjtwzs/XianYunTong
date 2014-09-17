//
//  CommonViewController.h
//  XianYunTong
//
//  Created by wuzhensong on 14-9-16.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "BaseTableViewController.h"

@interface CommonViewController : BaseTableViewController

@property (nonatomic ,strong) NSMutableArray *selectArr;//内部为bool值的number，数量与cell个数相同

/**
 *  设置某个值为选中或非选中状态
 *
 *  @param index 
 */
- (void) setSelectedAtIndex:(NSInteger)index;

@end

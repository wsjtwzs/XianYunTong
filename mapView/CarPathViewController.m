//
//  CarPathViewController.m
//  CoolProject
//
//  Created by wuzhensong on 14-7-16.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "CarPathViewController.h"
#import "HTTPClient+CarLocation.h"
#import "BMapKit.h"
@interface CarPathViewController ()

@end

@implementation CarPathViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id) initWithCarID:(NSString *)cid
{
    self = [super init];
    if (self) {
        _carID = cid;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"轨迹";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) downloadData
{
    
    [[HTTPClient shareHTTPClient] getCarPathWithCarID:_carID Success:^(NSMutableArray *array){
        
        for (BMKPointAnnotation *anno in array) {
            [_mapView addAnnotation:anno];
        }
    }];
    //    BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
    //    CLLocationCoordinate2D coor;
    //    coor.latitude = 39.915;
    //    coor.longitude = 116.404;
    //    annotation.coordinate = coor;
    //    annotation.title = @"这里是北京";
    //    [_mapView addAnnotation:annotation];
    //
    //    BMKPointAnnotation* annotation2 = [[BMKPointAnnotation alloc]init];
    //    CLLocationCoordinate2D coor2;
    //    coor2.latitude = 39.9;
    //    coor2.longitude = 116.4;
    //    annotation2.coordinate = coor2;
    //    annotation2.title = @"这里是2";
    //    [_mapView addAnnotation:annotation2];
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

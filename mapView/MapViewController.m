//
//  MapViewController.m
//  CoolProject
//
//  Created by wuzhensong on 14-6-15.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "MapViewController.h"
#import "HTTPClient+CarLocation.h"

@interface MapViewController ()
{
    MKAnnotationView *lView;
    CGPoint movedPoint;
}
@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:NSStringFromClass([MapViewController class]) bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];

    
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

- (void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//
    [self createBarWithLeftBarItem:MoshNavigationBarItemBack rightBarItem:MoshNavigationBarItemNone title:@"地图"];
    
    _mapView = [[BMKMapView alloc]initWithFrame:self.view.frame];
    
//    [_mapView showsUserLocation];
//    [_mapView setCenterCoordinate:[MyAppDelegate shareAppDelegate].getLocation.coordinate];
    [_mapView setZoomLevel:14];
    lView = [[MKAnnotationView alloc] initWithFrame:CGRectMake(0,0, 256, 105)];
    lView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_mapView];
    
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放// 添加一个PointAnnotation
    [self downloadData];
}

- (void) downloadData
{

    
    [[HTTPClient shareHTTPClient] getCarsLocationSuccess:^(NSMutableArray *array){
    
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
        BMKPinAnnotationView *newAnnotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myAnnotation"];
        newAnnotationView.pinColor = BMKPinAnnotationColorPurple;
        newAnnotationView.image = [UIImage imageNamed:@"icon_2"];
        newAnnotationView.animatesDrop = YES;// 设置该标注点动画显示
        
//        UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
//        customView.backgroundColor = [UIColor redColor];
        newAnnotationView.paopaoView = [[BMKActionPaopaoView alloc] initWithCustomView:self.carInfoView];
//        newAnnotationView.leftCalloutAccessoryView = customView;
//        newAnnotationView.rightCalloutAccessoryView = customView;
//        newAnnotationView.paopaoView = nil;
        newAnnotationView.canShowCallout = YES;
        return newAnnotationView;
    }
    return nil;
}

@end

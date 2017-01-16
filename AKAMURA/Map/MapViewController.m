//
//  MapViewController2.m
//  ISICAkaVillage
//
//  Created by araki kenta on 2014/11/20.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()
@end

@implementation MapViewController

@synthesize map_mode_state;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self navigationbarTitleSet];
    
    _locationManager = [CLLocationManager new];
    [_locationManager setDelegate:self];
    
    if([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [_locationManager requestAlwaysAuthorization];
    }
    [_locationManager startUpdatingLocation];
    mapData = [[[SQLiteManager alloc] init] getMapData];
    
    [self mapSet];
    // デフォルトでは左を選択
    self.map_mode_state.selectedSegmentIndex = 0;
}

- (void)navigationbarTitleSet {
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectZero];
    title.font = [UIFont fontWithName:@"KFhimaji" size:18.0];
    title.textColor = [UIColor whiteColor];
    title.text = @"観光MAP";
    [title sizeToFit];
    self.navigationItem.titleView = title;
}

- (void)mapSet {
    for (int i = 0; i <= mapData.count-1; i++) {
        MapDto *mapDto = [mapData objectAtIndex:i];
        NSLog(@"%f",mapDto.result_latitube);
        if(mapDto.result_latitube != 0){
        latitube_count[i] = mapDto.result_latitube;
        longitube_count[i] = mapDto.result_longitube;
        CLLocationDegrees latitube = latitube_count[i];
        CLLocationDegrees longitube = longitube_count[i];
        //ピンさす
        [_mapView addAnnotation:[[CustomAnnotation alloc]initWithLocationCoordinate:CLLocationCoordinate2DMake(latitube,longitube)
                                                                              title:mapDto.result_title
                                                                           subtitle:@""]];
        }
    }
    _mapView.delegate = self;
    
    // 緯度・軽度を設定
    CLLocationCoordinate2D location;
    location.latitude = 33.6234785;
    location.longitude = 130.921065813;
    
    [_mapView setCenterCoordinate:location animated:NO];
    
    // 縮尺を設定
    MKCoordinateRegion region = _mapView.region;
    region.center = location;
    region.span.latitudeDelta = 0.1;
    region.span.longitudeDelta = 0.1;
    
    [_mapView setRegion:region animated:NO];
    
    // view に追加
    [self.view addSubview:_mapView];
}

- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views {
    // コールアウト、ボタンの追加
    // アノテーションビューを取得する
    for (MKAnnotationView* annotationView in views) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        
        // コールアウトの左側のアクセサリビューにボタンを追加する
        annotationView.leftCalloutAccessoryView = button;
    }
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    //コールアウトボタンを押したときの処理
    PIN_TITLE = view.annotation.title;
    NSLog(@"PIN_TITLE:%@",view.annotation.title);
    [self performSegueWithIdentifier:@"DetailView" sender:self];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"DetailView"]) {
        DetailViewController *detailviewcon = segue.destinationViewController;
        detailviewcon.TITLE_VALUE = PIN_TITLE;
        detailviewcon.state = YES;
    }
}

- (IBAction)map_mode:(id)sender {
    UISegmentedControl *segment = (UISegmentedControl *)sender;
    switch (segment.selectedSegmentIndex) {
        case 0:
            _mapView.mapType = MKMapTypeStandard;
            NSLog(@"標準");
            break;
        case 1:
            _mapView.mapType = MKMapTypeHybrid;
            NSLog(@"ハイブリット");
            break;
        case 2:
            _mapView.mapType = MKMapTypeSatellite;
            NSLog(@"サテライト");
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end

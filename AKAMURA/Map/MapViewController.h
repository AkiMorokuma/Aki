//
//  MapViewController2.h
//  ISICAkaVillage
//
//  Created by araki kenta on 2014/11/20.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import <Foundation/Foundation.h>
#import "CustomAnnotation.h"
#import "CustomAnnotationView.h"
#import "DetailViewController.h"
#import "FMDatabase.h"
#import "MapDto.h"
#import "SQLiteManager.h"

@interface MapViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>{
    double latitube_count[100]; // 拠点の数！
    double longitube_count[100]; //
    CLLocationManager *_locationManager;
    CLLocationCoordinate2D coordinate;
    NSString *PIN_TITLE;
    NSMutableArray* mapData;
    UISegmentedControl* map_mode_state;
}

@property (nonatomic,retain) IBOutlet UISegmentedControl *map_mode_state;
@property (nonatomic,retain) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
-(IBAction)map_mode:(id)sender;

@end

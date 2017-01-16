//
//  BeaconManager.m
//  ISICAkaVillage
//
//  Created by ArakiKenta on 2016/07/28.
//  Copyright © 2016年 araki kenta. All rights reserved.
//

#import "BeaconManager.h"
#import "AppDelegate.h"
#import "WalkrallyViewController.h"

@implementation BeaconManager

- (void)oveserveBeacon {
    if ([CLLocationManager isMonitoringAvailableForClass:[CLCircularRegion class]]) {

        locationManager = [CLLocationManager new];
        locationManager.delegate = self;
        [locationManager requestAlwaysAuthorization];
        proximityUUID = [[NSUUID alloc] initWithUUIDString:UUID];
        beaconRegion  = [[CLBeaconRegion alloc]initWithProximityUUID:proximityUUID identifier:@"test"];
        [locationManager startMonitoringForRegion:beaconRegion];
        NSLog(@"#####################");
        NSLog(@"To observe the Beacon");
        NSLog(@"#####################");
    }
}

- (void)locationManager:(CLLocationManager *)manager
didStartMonitoringForRegion:(CLRegion *)region {
    NSLog(@"#####################");
    NSLog(@"State is stable");
    NSLog(@"#####################");
}

- (void)locationManager:(CLLocationManager *)manager
         didEnterRegion:(CLRegion *)region {
    NSLog(@"#####################");
    NSLog(@"It entered the area");
    NSLog(@"#####################");
    [locationManager startRangingBeaconsInRegion:beaconRegion];
}

- (void)locationManager:(CLLocationManager *)manager
          didExitRegion:(CLRegion *)region {
    NSLog(@"#####################");
    NSLog(@"Out of the area");
    NSLog(@"#####################");
    [locationManager stopRangingBeaconsInRegion:beaconRegion];
}

- (void)locationManager:(CLLocationManager *)manager
        didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region {
    NSLog(@"#####################");
    NSLog(@"In the region");
    NSLog(@"#####################");
    
    CLBeacon* beacon = beacons.firstObject;
    NSNumber* major;
    major = beacon.major;
    
    [sqliteManager openDatabase];
    
    if ([major isEqualToNumber: @1]) {
        beaconData     = [[[SQLiteManager alloc] init] getMapDataById:[beacon.minor intValue]];
        MapDto* mapDto = [beaconData objectAtIndex:0];
        SoundManager* soundManager = [[SoundManager alloc] init];
        AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
        appDelegate.title = mapDto.result_title;
        
        [soundManager selectBackgroundSound:[beacon.minor intValue] :beaconData :mapDto.result_title];
    }
    
    if ([major isEqualToNumber: @2]) {
        beaconData     = [[[SQLiteManager alloc] init] getWalkrallyDataById:[beacon.minor intValue]];
        WalkrallyDto* walkrallyDto = [beaconData objectAtIndex:0];
        WalkrallyViewController* walkrallyViewController = [[WalkrallyViewController alloc] init];
        
        [walkrallyViewController quiz:[beacon.minor intValue] :beaconData];
    }
    
    [locationManager stopRangingBeaconsInRegion:beaconRegion];
}

//- (void)changeQuiz: (int)minor{
//
//    NSLog(@"%d", minor);
//    NSLog(@"%d", random);
//    NSLog(@"Number:%d", _number);
//    
//    if(minor == _number) {
//        NSLog(@"正解だドン");
//        MINOR = minor;
//        NSLog(@"MINOR:%d", MINOR);
//        // Mainストーリーボードを取得
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        // ストーリーボードに定義されているViewControllerをidentityで取得
//        WalkrallyViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"Walkrally"];
//        // FooViewControllerに定義されているメソッド呼べるかテスト
//        [viewController quiz];
//    }else{
//        NSLog(@"違うドン");
//    }
//}
@end

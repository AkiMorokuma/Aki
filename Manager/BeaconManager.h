//
//  BeaconManager.h
//  ISICAkaVillage
//
//  Created by ArakiKenta on 2016/07/28.
//  Copyright © 2016年 araki kenta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "SQLiteManager.h"
#import "SoundManager.h"
#import "BeaconManager.h"

@class AppDelegate;

//UUID
static NSString* const UUID = @"0C55D4B6-0000-4F47-A722-83ABF61EEF6A";

@interface BeaconManager : NSObject<CLLocationManagerDelegate> {

    CLLocationManager *locationManager;
    CLBeaconRegion    *beaconRegion;
    NSUUID            *proximityUUID;
    NSString          *beaconTitle;
    NSInteger         *beaconMajor;
    NSInteger         *beaconMinor;
    NSMutableArray    *beaconData;
    SQLiteManager     *sqliteManager;
    
    int number;

}

-(void)oveserveBeacon;
//@property (assign) NSInteger number;
@property (assign) NSInteger beaconMinor;

@end

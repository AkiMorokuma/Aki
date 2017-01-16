//
//  AppDelegate.h
//  AKAMURA
//
//  Created by araki kenta on 2014/09/03.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapDto.h"
#import "WalkrallyDto.h"
#import "FMDatabase.h"
#import "ViewController.h"
#import "DetailViewController2.h"
#import "NavigationController.h"
#import "WalkrallyViewController.h"

@class BeaconManager;

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    SQLiteManager* sqliteManager;
    NSString* title_;
    BOOL state_;
}

-(void)setTitle:(NSString*)title;

@property (strong, nonatomic) UIWindow* window;
@property (nonatomic) NSString* title;
@property (nonatomic) BOOL state;
@property (nonatomic) int number;

@end

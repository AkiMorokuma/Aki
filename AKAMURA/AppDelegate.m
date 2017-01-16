//
//  AppDelegate.m
//  AKAMURA
//
//  Created by araki kenta on 2014/09/03.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//


#import <AVFoundation/AVFoundation.h>
#import <Audiotoolbox/AudioServices.h>
#import "AppDelegate.h"
#import "BeaconManager.h"

@implementation AppDelegate {
    BeaconManager* beaconManager;
}

@synthesize title = title_;
@synthesize state = state_;
@synthesize number = _number;

// 音声読み上げ
AVSpeechSynthesizer *_speechSynthesizer;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    title_ = nil;
    sqliteManager = [[SQLiteManager alloc] init];
    beaconManager = [[BeaconManager alloc] init];
    [beaconManager oveserveBeacon];
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        // use registerUserNotificationSettings
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
        [application registerForRemoteNotifications];
    }
#else
    // use registerForRemoteNotifications
    [application registerForRemoteNotificationTypes: (UIRemoteNotificationTypeBadge|UIRemoteNotificationTypeSound|UIRemoteNotificationTypeAlert)];
#endif
    
    NSDictionary* userInfo = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    if (userInfo != nil) {
        //パターン１：アプリのプロセスが完全に切れていた時に通知をタップ
        [self showViewController];
    }
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    [UIApplication sharedApplication].applicationIconBadgeNumber = -1;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [[NSNotificationCenter defaultCenter] postNotificationName:@"applicationDidBecomeActive" object:nil];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    if (application.applicationState == UIApplicationStateActive) {
        //パターン２：画面が既に表示されていて通知が飛んできた時に勝手に呼ばれる
        [self showViewController];
        return;
    }else if(application.applicationState == UIApplicationStateInactive) {
        //パターン３：アプリがバックグラウンドでは生きている時に通知をタップ
        [self showViewController];
        return;
    }
}

- (void)showViewController {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    DetailViewController2* view = [storyboard instantiateViewControllerWithIdentifier:@"DetailView2"];
    [self.window.rootViewController  presentViewController:view animated:NO completion:NULL];
}
@end

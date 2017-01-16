//
//  SoundManager.m
//  ISICAkaVillage
//
//  Created by ArakiKenta on 2016/07/29.
//  Copyright © 2016年 araki kenta. All rights reserved.
//

#import "SoundManager.h"

@implementation SoundManager

- (void)sendNotification:(NSString*)message sound:(NSString*)soundname {
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.fireDate = [[NSDate date] init];
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.alertBody = message;
    notification.alertAction = @"Open";
    notification.soundName = soundname;
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

- (void)selectBackgroundSound:(int)minor
                             :(NSMutableArray* )beaconData
                             :(NSString*)title {
    NSString* SoundName;
    switch(minor){
        case 1:
            SoundName = @"waterfall(voice).mp3";//大音の滝
            break;
        case 2:
            SoundName = @"tokusanbutu_center.mp3";//特産物センター
            break;
        case 3:
            SoundName = @"hirayama_pond.mp3";//平山池
            break;
        case 4:
            SoundName = @"genjiinomori.mp3";//源じいの森
            break;
        case 5:
            SoundName = @"imagawa_park.mp3";//今川公園
            break;
        case 6:
            SoundName = @"akamura_tram_yusubaruline.mp3";//赤村トロッコ油須原線
            break;
        case 7:
            SoundName = @"komyo_temple.mp3";//光明寺
            break;
        case 8:
            SoundName = @"museum.mp3";//田川市石炭・歴史博物館
            break;
        case 9:
            SoundName = @"issaka_tunnel.mp3";//石坂トンネル
            break;
        case 10:
            SoundName = @"iwatakeinari.mp3";//岩嶽稲荷
            break;
        case 11:
            SoundName = @"mituankyo.mp3";//みつあんきょう
            break;
        case 12:
            SoundName = @"townhall.mp3";//役場
            break;
        case 13:
            SoundName = @"genjii_hot_springs.mp3";//源じい温泉
            break;
            
    }
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    appDelegate.state = [self getUserDefaults: @"Townhall_Nofitication"];
    
    if([self getUserDefaults: @"Townhall_Nofitication"]) {
        [appDelegate setState:[self getUserDefaults: @"Nofitication_preference"]];
        if([self getUserDefaults: @"Nofitication_preference"]) {
            [self sendNotification:[NSString stringWithFormat:@"%@に到着しました！",title] sound:SoundName];
        }else{
            [self sendNotification:[NSString stringWithFormat:@"%@に到着しました！",title] sound:@"Voicemail.caf"];
        }
    }else{
        [appDelegate setState:[self getUserDefaults: @"Nofitication_preference"]];
        if(minor != 12){
            if([self getUserDefaults: @"Nofitication_preference"]) {
                [self sendNotification:[NSString stringWithFormat:@"%@に到着しました！",title] sound:SoundName];
            }else{
                [self sendNotification:[NSString stringWithFormat:@"%@に到着しました！",title] sound:@"Voicemail.caf"];
            }
        }
    }
}

- (BOOL)getUserDefaults:(NSString*)key {
    // 変更された設定をデータベースに反映
    [NSUserDefaults resetStandardUserDefaults];
    // UserDefaultが設定アプリで設定値を変更するまで取得できない問題に対応するメソッド
    // それぞれのplistに対して処理を実行する。
    [self registerDefaultsFromSettingsBundle:@"Root.plist"];
    
    // 設定アプリのデータにアクセスするために、NSUserDefaultsを作成
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:key];
}

- (void)registerDefaultsFromSettingsBundle:(NSString*)plist {
    // 設定アプリのデータにアクセスするために、NSUserDefaultsを作成
    NSUserDefaults * defs = [NSUserDefaults standardUserDefaults];
    [defs synchronize];
    
    NSString *settingsBundle = [[NSBundle mainBundle] pathForResource:@"Settings" ofType:@"bundle"];
    if(!settingsBundle) {
        return;
    }
    
    // Setting.bundle 内の指定の plist の情報を取得
    NSDictionary *settings = [NSDictionary dictionaryWithContentsOfFile:[settingsBundle stringByAppendingPathComponent:plist]];
    
    // 指定した plist 内の PreferenceSpecifiers の情報を取得
    NSArray *preferences = [settings objectForKey:@"PreferenceSpecifiers"];
    
    // オブジェクトを取得できないもののデフォルト値を格納する Dictionary を作成
    NSMutableDictionary *defaultsToRegister = [[NSMutableDictionary alloc] initWithCapacity:[preferences count]];
    
    // preferences に格納されている情報の数だけループを回す
    for (NSDictionary *prefSpecification in preferences) {
        // 現在の情報の Key を取得
        NSString *key = [prefSpecification objectForKey:@"Key"];
        if (key) {
            // UserDefaults 内の Key の情報にアクセスできるか確認する
            id currentObject = [defs objectForKey:key];
            if (currentObject == nil) {
                // アクセスできない場合は、そのキーとデフォルト値を defaultsToRegister に登録する
                id objectToSet = [prefSpecification objectForKey:@"DefaultValue"];
                [defaultsToRegister setObject:objectToSet forKey:key];
            }
        }
    }
    // アクセスできないデフォルト値を UserDefaults に登録する
    [defs registerDefaults:defaultsToRegister];
    [defs synchronize];
}
@end

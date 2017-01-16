//
//  NetworkCheck.m
//  ISICAkaVillage
//
//  Created by ArakiKenta on 2016/07/30.
//  Copyright © 2016年 araki kenta. All rights reserved.
//

#import "Util.h"

@implementation Util

- (BOOL)networkCheck:(UIViewController*)controller {
    vc = controller;
    Reachability *hostReach = [Reachability reachabilityForInternetConnection];
    switch ([hostReach currentReachabilityStatus]) {
        case NotReachable:{
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"ネットに接続できません。"
                                                                                     message:@"再接続しますか？"
                                                                              preferredStyle:UIAlertControllerStyleAlert];
            
            [alertController addAction:[UIAlertAction actionWithTitle:@"はい" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [self otherBUttonPushed];
            }]];
            [alertController addAction:[UIAlertAction actionWithTitle:@"いいえ" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            }]];
            
            [controller presentViewController:alertController animated:YES completion:nil];
            return YES;
        }
        default:
            return false;
    }
}

- (void)otherBUttonPushed {
    [self networkCheck:vc];
}

@end

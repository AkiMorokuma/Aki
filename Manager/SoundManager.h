//
//  SoundManager.h
//  ISICAkaVillage
//
//  Created by ArakiKenta on 2016/07/29.
//  Copyright © 2016年 araki kenta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface SoundManager : NSObject {
    
}

- (void)selectBackgroundSound:(int)minor
                             :(NSMutableArray* )beaconData
                             :(NSString*)title;
@end

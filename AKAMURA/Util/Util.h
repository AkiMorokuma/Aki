//
//  NetworkCheck.h
//  ISICAkaVillage
//
//  Created by ArakiKenta on 2016/07/30.
//  Copyright © 2016年 araki kenta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

@interface Util: NSObject {
    UIViewController* vc;
}

- (BOOL)networkCheck:(UIViewController*)controller;

@end

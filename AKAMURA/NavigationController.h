//
//  NavigationController.h
//  AKAMURA
//
//  Created by araki kenta on 2014/09/04.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

@interface NavigationController : UINavigationController
@property (weak, nonatomic) IBOutlet UINavigationBar *navigation;

@end

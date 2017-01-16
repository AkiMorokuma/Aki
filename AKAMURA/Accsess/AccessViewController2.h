//
//  AccessViewController2.h
//  ISICAkaVillage
//
//  Created by araki kenta on 2014/10/14.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccessViewController2 : UIViewController{
    NSString *receiveValue;
}
@property (weak, nonatomic) IBOutlet UINavigationItem *navigation;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic) NSString *receiveValue;

@end

//
//  SPviewController.h
//  ISICAkaVillage
//
//  Created by araki kenta on 2014/10/30.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewController.h"

@interface SPViewController : UIViewController{
    
}
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *baseView;
- (IBAction)detail_btn:(id)sender;
@end

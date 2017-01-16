//
//  SPViewController.h
//  ISICAkaVillage
//
//  Created by araki kenta on 2014/10/26.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"

@interface WebViewController : UIViewController<UIWebViewDelegate>{
    NSURL *url;
    NSURLRequest *req;
    int receive_num;
    BOOL flag;
}

@property (weak, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)back_btn:(id)sender;
- (IBAction)next_btn:(id)sender;
- (IBAction)reload_btn:(id)sender;
- (IBAction)safari_btn:(id)sender;
@property (weak, nonatomic) IBOutlet UIToolbar *tb;
@property (nonatomic)int receive_num;


@end

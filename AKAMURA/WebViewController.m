//
//  SPViewController.m
//  ISICAkaVillage
//
//  Created by araki kenta on 2014/10/26.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import "WebViewController.h"

@implementation WebViewController
@synthesize receive_num = _receive_num;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self network_check];
    self.tb.translucent = NO;
}

- (void)web_set {
    switch (_receive_num) {
        case 0:
            url = [NSURL URLWithString:@"http://www.genjii.com/spa/spa_1.htm"];
            break;
        case 1:
            url = [NSURL URLWithString:@"http://www.genjii.com/hotaru/hotaru_1.htm"];
            break;
        case 2:
            url = [NSURL URLWithString:@"http://www.genjii.com/lodge/lodge_1.htm"];
            break;
        case 3:
            url = [NSURL URLWithString:@"http://www.genjii.com/bang/bang_1.htm"];
            break;
        case 4:
            url = [NSURL URLWithString:@"http://www.genjii.com/garden/gar_1.htm"];
            break;
        case 5:
            url = [NSURL URLWithString:@"http://www.genjii.com/camp/camp_1.htm"];
            break;
        case 6:
            url = [NSURL URLWithString:@"http://www.red-village.com/"];
            break;
        default:
            break;
    }
    req = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:req];
}

- (BOOL)network_check {
    
    Reachability *hostReach = [Reachability reachabilityForInternetConnection];
    switch ([hostReach currentReachabilityStatus]){
        case NotReachable:{
            
            flag = YES;
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"ネットに接続できません。" message:@"再接続しますか？" preferredStyle:UIAlertControllerStyleAlert];
            // addActionした順に左から右にボタンが配置されます
            [alertController addAction:[UIAlertAction actionWithTitle:@"はい" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                // otherボタンが押された時の処理
                [self otherBUttonPushed];
            }]];
            [alertController addAction:[UIAlertAction actionWithTitle:@"いいえ" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                // cancelボタンが押された時の処理
            }]];
            
            [self presentViewController:alertController animated:YES completion:nil];
            break;
        }
            
        default:
            flag=NO;
            [self web_set];
            break;
    }
    return flag;
}

- (void)otherBUttonPushed {
    [self network_check];
}

// ページ読込開始時にインジケータをくるくるさせる
- (void)webViewDidStartLoad:(UIWebView*)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

// ページ読込完了時にインジケータを非表示にする
- (void)webViewDidFinishLoad:(UIWebView*)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (IBAction)back_btn:(id)sender {
    [self.webView goBack];
}

- (IBAction)next_btn:(id)sender {
    [self.webView goForward];
}

- (IBAction)reload_btn:(id)sender {
    [self.webView reload];
}

- (IBAction)safari_btn:(id)sender {
    NSURLRequest* request = self.webView.request;
    NSURL* url_now = [request URL];
    [[UIApplication sharedApplication] openURL:url_now];

}
@end

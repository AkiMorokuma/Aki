//
//  townOfficeViewController.m
//  ISICAkaVillage
//
//  Created by araki kenta on 2014/10/26.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import "townOfficeViewController.h"

@implementation townOfficeViewController

@synthesize get_num = _get_num;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self navigationbarTitleSet];
    [self checkOfGetNumber];
    [self setFont];
}

- (void)setFont {
    self.title_text.font = [UIFont fontWithName:@"KFhimaji" size:23.0];
    self.address_num_text.font = [UIFont fontWithName:@"KFhimaji" size:18.0];
    self.phone_num_text.font = [UIFont fontWithName:@"KFhimaji" size:25.0];
    self.url_text.font = [UIFont fontWithName:@"KFhimaji" size:17.0];
    self.tap_text.font = [UIFont fontWithName:@"KFhimaji" size:16.0];
}

- (void)navigationbarTitleSet {
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectZero];
    title.font = [UIFont fontWithName:@"KFhimaji" size:18.0];
    title.textColor = [UIColor whiteColor];
    title.text = @"お問い合わせ";
    [title sizeToFit];
    self.navigationItem.titleView = title;
}

- (void)checkOfGetNumber {
    switch (_get_num) {
        case 1:
            self.title_text.text = @"源じいの森";
            self.address_num_text.text = @"福岡県田川郡赤村大字赤6933-1";
            self.phone_num_text.text = @"0947-62-2911";
            self.url_text.text = @"http://www.genjii.com/";
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)facebook_btn:(id)sender {
    NSURL* url = [NSURL URLWithString:@"https://www.facebook.com/akamurajoho?fref=ts"];
    [[UIApplication sharedApplication] openURL:url];
}
@end

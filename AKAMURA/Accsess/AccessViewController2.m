//
//  AccessViewController2.m
//  ISICAkaVillage
//
//  Created by araki kenta on 2014/10/14.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import "AccessViewController2.h"

@interface AccessViewController2 ()

@end

@implementation AccessViewController2

@synthesize receiveValue = _receiveValue;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setScrollView];
}

- (void)setScrollView {
    //スクロールビューに画像を設定
    UIImage *image;
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectZero];
    title.font = [UIFont fontWithName:@"KFhimaji" size:18.0];
    title.textColor = [UIColor whiteColor];
    
    if ([_receiveValue isEqualToString:@"1"]) {
        image = [UIImage imageNamed:@"airport"];
        title.text = @"飛行機";
    }else if([_receiveValue isEqualToString:@"2"]){
        image = [UIImage imageNamed:@"train"];
        title.text = @"電車";
    }else if([_receiveValue isEqualToString:@"3"]){
        image = [UIImage imageNamed:@"mycar"];
        title.text = @"マイカー";
    }
    self.imageView.image = image;
    [title sizeToFit];
    self.navigationItem.titleView = title;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end

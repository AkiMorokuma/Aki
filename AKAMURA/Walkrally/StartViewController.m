//
//  WalkrallyViewController.m
//  ISICAkaVillage
//
//  Created by Aki Morokuma on 2016/07/05.
//  Copyright © 2016年 araki kenta. All rights reserved.
//

#import "StartViewController.h"

@interface StartViewController ()

@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self navigationbarTitleSet];
    [self shouldAutorotate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)navigationbarTitleSet {
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectZero];
    title.font = [UIFont fontWithName:@"KFhimaji" size:18.0];
    title.textColor = [UIColor whiteColor];
    title.text = @"ウォークラリー";
    [title sizeToFit];
    self.navigationItem.titleView = title;
}

- (IBAction)startButtonEvent:(UIButton*)sender {
    [self performSegueWithIdentifier:@"difficultySegue" sender:self];
}

//回転処理の有無
- (BOOL)shouldAutorotate {
    return YES;
    NSLog(@"回転するよ！！");
}
//サポートしている方向
- (NSUInteger)supportedInterfaceOrientations {
    //以下の場合は縦
    return UIInterfaceOrientationMaskLandscapeRight;
}

@end

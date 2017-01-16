//
//  StartViewController.m
//  ISICAkaVillage
//
//  Created by Aki Morokuma on 2016/07/05.
//  Copyright © 2016年 araki kenta. All rights reserved.
//

#import "DifficultyViewController.h"
#import "WalkrallyViewController.h"

@interface DifficultyViewController ()

@end

@implementation DifficultyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self navigationbarTitleSet];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)navigationbarTitleSet {
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectZero];
    title.font = [UIFont fontWithName:@"KFhimaji" size:18.0];
    title.textColor = [UIColor whiteColor];
    title.text = @"難易度";
    [title sizeToFit];
    self.navigationItem.titleView = title;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"walkrallySegue"]) {
        WalkrallyViewController* walkrallyViewController = segue.destinationViewController;
        walkrallyViewController.type = diddicultyNum;
    }
}

/**
 * buttonのtag
 * 100:かんたん
 * 200:ふつう
 * 300:むずかしい
 * 400:とてもむずかしい
 *
 *  @param sender 
 */
- (IBAction)buttonEvent:(UIButton*)sender {
    switch (sender.tag) {
        case 100:
            diddicultyNum = 0;
            break;
        case 200:
            diddicultyNum = 1;
            break;
        case 300:
            diddicultyNum = 2;
            break;
        case 400:
            diddicultyNum = 3;
            break;
        default:
            break;
    }
    [self performSegueWithIdentifier:@"walkrallySegue" sender:self];
}

@end

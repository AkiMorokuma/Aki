//
//  GenjiViewController.m
//  ISICAkaVillage
//
//  Created by araki kenta on 2014/10/25.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import "GenjiViewController.h"

@implementation GenjiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self navigationbarTitleSet];
}

- (void)navigationbarTitleSet {
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectZero];
    title.font = [UIFont fontWithName:@"KFhimaji" size:18.0];
    title.textColor = [UIColor whiteColor];
    title.text = @"源じいの森";
    [title sizeToFit];
    self.navigationItem.titleView = title;
}

- (IBAction)accommodations_btn:(id)sender {
    [self performSegueWithIdentifier:@"accommodationsSegue" sender:self];
}

- (IBAction)hotspring_btn:(id)sender {
    [self performSegueWithIdentifier:@"hotspringSegue" sender:self];
}

- (IBAction)requestbtn:(id)sender {
    [self performSegueWithIdentifier:@"requestSegue" sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"requestSegue"]){
        townOfficeViewController *viewCon = segue.destinationViewController;
        viewCon.get_num = 1;
        
    }else if([segue.identifier isEqualToString:@"hotspringSegue"]){
        WebViewController *viewCon = segue.destinationViewController;
        viewCon.receive_num = 0;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end

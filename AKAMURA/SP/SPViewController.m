//
//  SPviewController.m
//  ISICAkaVillage
//
//  Created by araki kenta on 2014/10/30.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import "SPViewController.h"

@implementation SPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self navigationbarTitleSet];
    [self scrollViewSetProperty];
}

- (void)navigationbarTitleSet {
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectZero];
    title.font = [UIFont fontWithName:@"KFhimaji" size:18.0];
    title.textColor = [UIColor whiteColor];
    title.text = @"特産物センター";
    [title sizeToFit];
    self.navigationItem.titleView = title;
}

- (void)scrollViewSetProperty {
    //拡大/縮小対応
    _scrollView.delegate = (id)self;
    _scrollView.minimumZoomScale = 1.0;
    _scrollView.maximumZoomScale = 3.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _baseView; //拡大/縮小対応
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"SPSegue2"]) {
        WebViewController *viewCon = segue.destinationViewController;
        viewCon.receive_num = 6;
    }
}

- (IBAction)detail_btn:(id)sender {
    [self performSegueWithIdentifier:@"SPSegue2" sender:self];
}
@end

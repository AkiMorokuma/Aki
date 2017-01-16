//
//  townOfficeViewController.h
//  ISICAkaVillage
//
//  Created by araki kenta on 2014/10/26.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface townOfficeViewController : UIViewController{
    int get_num;
}
@property (nonatomic) int get_num;
@property (weak, nonatomic) IBOutlet UITextView *title_text;
@property (weak, nonatomic) IBOutlet UITextView *address_num_text;
@property (weak, nonatomic) IBOutlet UITextView *phone_num_text;
@property (weak, nonatomic) IBOutlet UITextView *url_text;
@property (weak, nonatomic) IBOutlet UITextView *tap_text;

- (IBAction)facebook_btn:(id)sender;
@end

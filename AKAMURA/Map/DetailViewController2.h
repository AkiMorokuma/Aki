//
//  DatailViewController2.h
//  ISICAkaVillage
//
//  Created by Keita Fujino on 2015/05/26.
//  Copyright (c) 2015年 araki kenta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDatabase.h"
#import "MapDto.h"
#import "AppDelegate.h"
#import "ViewController.h"
#import "NavigationController.h"
#import <AVFoundation/AVFoundation.h>
#import "SQLiteManager.h"

@interface DetailViewController2 : UIViewController{
    NSString *_TITLE_VALUE;
    NSString *PIC_NAME;
    UIImageView *imageView2;
    UIScrollView *scrollView;
    UIView *view2;
    NSMutableArray *mapData;
    BOOL image_tap;
    BOOL _state;
    AVAudioPlayer* player1, * player2;
}
@property (nonatomic) NSString* TITLE_VALUE;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *title_label;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIView *title_view;
@property (nonatomic) BOOL state;

- (IBAction)cancell_btn:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancell_btn;
- (IBAction)backBtn:(id)sender;

@end
